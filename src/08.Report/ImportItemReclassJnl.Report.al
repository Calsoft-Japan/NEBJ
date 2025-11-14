report 50002 "Import Goods Rcpt. Insp. Data"
{
    ApplicationArea = All;
    Caption = 'Import Goods Receipt Inspection Data';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset { }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Option)
                {
                    Caption = 'Option';
                    field(ReqBatchName; BatchName)
                    {
                        ApplicationArea = All;
                        Caption = 'Batch Name';
                        TableRelation = "Item Journal Batch".Name where("Journal Template Name" = const('TRANSFER'));
                    }
                    field(FileName; FileName)
                    {
                        ApplicationArea = All;
                        Caption = 'File Name';
                        AssistEdit = true;

                        trigger OnAssistEdit()
                        begin
                            UploadIntoStream(DialogTxt, '', FilterTxt, FileName, FileInStream);
                            if FileName = '' then
                                Error(BlankFileErr);
                        end;
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin
        TemplateName := 'TRANSFER';

        NextLineNo := 0;

        ExcelBuf.LockTable();
        ReadTextFile();
        AnalyzeData();
    end;

    trigger OnPostReport()
    begin
        ExcelBuf.DeleteAll();
        Message(ImpMsg)
    end;

    local procedure ReadTextFile()
    var
        FileContent: Text;
        Columns: List of [Text];
        ColumnValue: Text;
        TabChr: Char;
        Window: Dialog;
        ColNo: Integer;
        RowNo: Integer;
        ReadFileLbl: Label 'Reading Text File...\\';
    begin
        if GuiAllowed then
            Window.Open(ReadFileLbl + '#1########################\');

        ExcelBuf.DeleteAll();

        RowNo := 1;
        TabChr := 9;
        while (not FileInStream.EOS) do begin
            FileInStream.ReadText(FileContent);
            Columns := FileContent.Split(TabChr);
            ColNo := 1;
            foreach ColumnValue in Columns do begin
                ExcelBuf.Init();
                ExcelBuf."Row No." := RowNo;
                ExcelBuf."Column No." := ColNo;
                ExcelBuf."Cell Value as Text" := ColumnValue;
                ExcelBuf.Insert();
                ColNo += 1;
                if GuiAllowed then
                    if RowNo > 2 then
                        Window.Update(1, ExcelBuf."Cell Value as Text");
            end;
            RowNo += 1;
        end;
        if GuiAllowed then
            Window.Close();
    end;

    local procedure AnalyzeData();
    VAR
        RowCounter: Integer;
    begin
        if ExcelBuf.FindLast() then
            TotalRecNo := ExcelBuf."Row No."
        else
            TotalRecNo := ExcelBuf.Count;
        RecNo := 0;

        for RowCounter := 2 to TotalRecNo do begin
            RecNo := RecNo + 1;

            ClearFields();

            if ExcelBuf.Get(RowCounter, 1) then begin
                DocNo := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 2) then
                    ExtDocNo := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 3) then
                    Evaluate(PostingDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));

                if ExcelBuf.Get(RowCounter, 4) then
                    ItemNo := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 5) then
                    Description := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 6) then
                    LocCode := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 7) then
                    NewLocCode := Format(ExcelBuf."Cell Value as Text");

                if ExcelBuf.Get(RowCounter, 8) then
                    LotNo := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(RowCounter, 9) then
                    Evaluate(ExpDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));

                if ExcelBuf.Get(RowCounter, 10) then
                    Evaluate(Qty, ExcelBuf."Cell Value as Text");

                if ExcelBuf.Get(RowCounter, 11) then
                    Evaluate(ASEDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));

                if ExcelBuf.Get(RowCounter, 12) then
                    xlsRecNo := ExcelBuf."Cell Value as Text";

                // create new line
                InsertItemJnlLine(LotNo, SerialNo, ItemNo, LocCode, '', Qty, '', LineNo);

            end;
        end;
    end;

    procedure InsertItemJnlLine(LotNo: Code[20]; SerialNo: Code[20]; ItemNo: Code[20]; LocCode2: Code[10]; Bin2: Code[20]; Quantity1: Decimal; Uom: Code[10]; intLineNo: Integer);
    VAR
        RecRef: RecordRef;
        LotNoInfo: Record "Lot No. Information";
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        ItemLedEntry: Record "Item Ledger Entry";
        CreateRsvEntry: Codeunit "Create Reserv. Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReservMgmt: Codeunit "Reservation Management";
        DirEnum: Enum "Transfer Direction";
    begin
        ItemJnlLine.LockTable();
        ItemJnlLine.Init();
        ItemJnlLine.SetRange("Journal Template Name", TemplateName);
        ItemJnlLine.SetRange("Journal Batch Name", BatchName);
        if ItemJnlLine.FindLast() then
            NextLineNo := ItemJnlLine."Line No." + 10000
        else
            NextLineNo := 10000;

        if Quantity1 <> 0 then begin
            ItemJnlLine.Init();
            ItemJnlLine."Journal Template Name" := TemplateName;
            ItemJnlLine."Journal Batch Name" := BatchName;
            ItemJnlLine."Line No." := NextLineNo;

            ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::Transfer);
            ItemJnlLine.Validate("Posting Date", PostingDate);
            ItemJnlLine.Validate("Document No.", DocNo);
            ItemJnlLine.Validate("External Document No.", ExtDocNo);

            ItemJnlLine.Validate("Item No.", ItemNo);
            ItemJnlLine.Validate("Location Code", LocCode);

            OldLotNo := '';
            EntryNo := 0;
            ItemLedEntry.Reset();
            ItemLedEntry.SetCurrentKey("Item No.", "Posting Date");
            ItemLedEntry.SetRange("Item No.", ItemNo);
            ItemLedEntry.SetRange("Variant Code", '');
            ItemLedEntry.SetRange("Location Code", LocCode);
            ItemLedEntry.SetRange("External Document No.", ExtDocNo);
            ItemLedEntry.SetFilter("Remaining Quantity", '<>%1', 0);
            if ItemLedEntry.FindLast() then begin
                OldLotNo := ItemLedEntry."Lot No.";
                EntryNo := ItemLedEntry."Entry No.";
            end else begin
                ItemLedEntry.SetRange("External Document No.");
                if ItemLedEntry.FindLast() then
                    OldLotNo := ItemLedEntry."Lot No."
            end;

            NewLotNo := '';
            NewExpDate := 0D;
            ItemLedEntry.Reset();
            ItemLedEntry.SetCurrentKey("Item No.", "Posting Date");
            ItemLedEntry.SetRange("Item No.", ItemNo);
            ItemLedEntry.SetRange("Variant Code", '');
            ItemLedEntry.SetRange("Lot No.", LotNo);
            if ItemLedEntry.FindLast() then begin
                NewExpDate := ItemLedEntry."Expiration Date";
            end;

            ItemJnlLine.Validate("New Location Code", NewLocCode);
            ItemJnlLine.Validate(Quantity, Qty);
            if EntryNo <> 0 then
                ItemJnlLine.Validate(ItemJnlLine."Applies-to Entry", EntryNo);

            ItemJnlLine.Insert(true);

            if OldLotNo <> '' then begin
                Clear(ReservEntry);
                ReservEntry."Lot No." := OldLotNo;
                ReservEntry."Serial No." := SerialNo;
                CreateRsvEntry.CreateReservEntryFor(
                  Database::"Item Journal Line",
                  ItemJnlLine."Entry Type".AsInteger(),
                  ItemJnlLine."Journal Template Name",
                  ItemJnlLine."Journal Batch Name",
                  ItemJnlLine."Prod. Order Comp. Line No.",
                  ItemJnlLine."Line No.",
                  ItemJnlLine."Qty. per Unit of Measure",
                  Abs(ItemJnlLine."Quantity (Base)"),
                  Abs(ItemJnlLine."Quantity (Base)"),
                  ReservEntry);

                CreateRsvEntry.CreateEntry(
                  ItemJnlLine."Item No.",
                  ItemJnlLine."Variant Code",
                  ItemJnlLine."Location Code",
                  ItemJnlLine.Description,
                  0D, 0D, 0,
                  ReservEntry."Reservation Status"::Prospect);

                Clear(ReservEntry2);
                ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry2, true);
                //ReserveItemJnlLine.FilterReservFor(ReservEntry2, ItemJnlLine);
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);
                ReservEntry2.SetRange("Reservation Status", ReservEntry2."Reservation Status"::Prospect);
                if SerialNo <> '' then
                    ReservEntry2.SetRange("Serial No.", SerialNo);
                if LotNo <> '' then
                    ReservEntry2.SetRange("Lot No.", OldLotNo);
                if ReservEntry2.FindFirst() then
                    repeat
                        ReservEntry2.Validate("New Lot No.", LotNo);

                        if NewExpDate <> 0D then
                            ReservEntry2.Validate("New Expiration Date", NewExpDate)
                        else
                            if ExpDate <> 0D then
                                ReservEntry2.Validate("New Expiration Date", ExpDate);
                        ReservEntry2.Modify();
                        ReservEntry2.Validate("Quantity (Base)", Qty);
                        if not LotNoInfo.Get(ReservEntry2."Item No.", ReservEntry2."Variant Code", ReservEntry2."New Lot No.") then begin
                            LotNoInfo.Init();
                            LotNoInfo."Item No." := ReservEntry2."Item No.";
                            LotNoInfo."Lot No." := ReservEntry2."New Lot No.";
                            LotNoInfo."First Receiving Date" := PostingDate;
                            LotNoInfo."Inspection Passed Date" := ASEDate;
                            LotNoInfo.Insert();
                        end;
                    until ReservEntry2.Next() = 0;
            end;
        end;
    end;

    local procedure FormatDataToDate(TextToFormat: Text[250]): Text[250];
    VAR
        FormatInteger: Integer;
        FormatDecimal: Decimal;
        FormatDate: Date;
        FormatBigInteger: BigInteger;
    begin
        case true of
            Evaluate(FormatDate, TextToFormat):
                exit(Format(FormatDate));
            else
                exit(TextToFormat);
        end;
    end;

    local procedure ClearFields()
    begin
        Clear(LineNo);
        Clear(DocNo);
        Clear(ExtDocNo);
        Clear(PostingDate);
        Clear(ItemNo);
        Clear(Description);
        Clear(LocCode);
        Clear(NewLocCode);
        Clear(LotNo);
        Clear(ExpDate);
        Clear(Qty);
        Clear(ASEDate);
        Clear(RecNo);
    end;

    var
        ExcelBuf: Record "Excel Buffer";
        ItemJnlLine: Record "Item Journal Line";
        FileInStream: InStream;
        TemplateName: Code[20];
        BatchName: Code[20];
        FileName: Text[250];
        TotalRecNo: Integer;
        RecNo: Integer;
        NextLineNo: Integer;
        OldLotNo: Code[20];
        EntryNo: Integer;
        NewLotNo: Code[20];
        NewExpDate: Date;
        LineNo: Integer;
        ItemNo: Code[20];
        PostingDate: Date;
        ASEDate: Date;
        DocNo: Code[20];
        ExtDocNo: Code[20];
        xlsRecNo: Code[20];
        LocCode: Code[20];
        NewLocCode: Code[20];
        LotNo: Code[20];
        SerialNo: Code[20];
        ExpDate: Date;
        Description: Text[80];
        Qty: Decimal;
        ImpMsg: Label 'Import Completed';
        DialogTxt: Label 'Import from excel file';
        BlankFileErr: Label 'File not found or incorrect.';
        FilterTxt: Label 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*';
}