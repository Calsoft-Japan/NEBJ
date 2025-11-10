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
                    field(ReqBatchName; ReqBatchName)
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
                        var
                            FileMgt: Codeunit "File Management";
                            FromFile: Text[100];
                            FileContent: Text;
                            ContentOutStream: OutStream;
                            ContentInStream: InStream;
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
    var
        ExcelBuf: Record "Excel Buffer";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        FileInStream: InStream;
        ReqBatchName: Code[20];
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
        xlsLineNo: Integer;
        xlsItemNo: Code[20];
        xlsPostingDate: Date;
        xlsASEDate: Date;
        xlsEntryType: Integer;
        xlsDocNo: Code[20];
        xlsExtDocNo: Code[20];
        xlsRecNo: Code[20];
        xlsLocCode: Code[20];
        xlsNewLocCode: Code[20];
        xlsJnlBatchName: Code[10];
        xlsLotNo: Code[20];
        xlsSerialNo: Code[20];
        xlsExpDate: Date;
        xlsDescription: Text[80];
        xlsDocDate: Date;
        xlsQty: Decimal;
        DialogTxt: Label 'Import from excel file';
        BlankFileErr: Label 'File not found or incorrect.';
        FilterTxt: Label 'Text Files (*.csv)|*.csv|All Files (*.*)|*.*';

    local procedure ReadExcelSheet();
    VAR
        Position: Integer;
    begin
        ReadSheetTXT2(FileName);
    end;

    local procedure AnalyzeData();
    VAR
        TempExcelBuf: Record "Excel Buffer" temporary;
        TempBudgetBuf: Record "Budget Buffer" temporary;
        BudgetBuf: Record "Budget Buffer";
        HeaderRowNo: Integer;
        CountDim: Integer;
        TestDate: Date;
        OldRowNo: Integer;
        DimRowNo: Integer;
        DimCode3: Code[20];
        lrecItem: Record 27;
        lintRowCounter: Integer;
        ldecPrice: Decimal;
        lrecItemVendor: Record 99;
        ltxtVendorItemNo: Text[20];
        lcodVendorNo: Code[20];
        lcodItemNo: Code[20];
        SalesType: Text[30];
        SalesCode: Text[30];
        StartingDate: Date;
        CurrencyCode: Text[30];
        UnitOfMeasure: Text[30];
        MinQty: Decimal;
        UnitPrice: Decimal;
        EndingDate: Date;
        AllowLineDisc: Boolean;
        txtType: Text[30];
        txtCode: Code[30];
        UOMCode: Text[30];
        LineDisc: Decimal;
        ReservEntry: Record 337;
        CreateReservEntry: Codeunit 99000830;
        ReservEngineMgt: Codeunit 99000831;
        lrReservEntry: Record 337;
        ReserveItemJnlLine: Codeunit 99000835;
        lrecLotNoInfo: Record 6505;
        lrecSNInfo: Record 6504;
        lint: BigInteger;
    begin
        if ExcelBuf.FindLast() then
            TotalRecNo := ExcelBuf."Row No."
        else
            TotalRecNo := ExcelBuf.Count;
        RecNo := 0;

        for lintRowCounter := 2 to TotalRecNo do begin
            RecNo := RecNo + 1;

            CLEAR(xlsLineNo);
            CLEAR(xlsDocNo);
            CLEAR(xlsExtDocNo);
            CLEAR(xlsPostingDate);
            CLEAR(xlsItemNo);
            CLEAR(xlsDescription);
            CLEAR(xlsLocCode);
            CLEAR(xlsNewLocCode);
            CLEAR(xlsLotNo);
            CLEAR(xlsExpDate);
            CLEAR(xlsQty);
            CLEAR(xlsASEDate);
            CLEAR(xlsRecNo);

            if ExcelBuf.Get(lintRowCounter, 1) then begin
                xlsDocNo := ExcelBuf."Cell Value as Text";

                if ExcelBuf.Get(lintRowCounter, 2) then begin
                    xlsExtDocNo := ExcelBuf."Cell Value as Text";
                end;

                if ExcelBuf.Get(lintRowCounter, 3) then begin
                    Evaluate(xlsPostingDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));
                end;

                if ExcelBuf.Get(lintRowCounter, 4) then begin
                    xlsItemNo := ExcelBuf."Cell Value as Text";
                end;

                if ExcelBuf.Get(lintRowCounter, 5) then begin
                    xlsDescription := ExcelBuf."Cell Value as Text";
                end;
                if ExcelBuf.Get(lintRowCounter, 6) then begin
                    xlsLocCode := ExcelBuf."Cell Value as Text";
                end;

                if ExcelBuf.Get(lintRowCounter, 7) then begin
                    xlsNewLocCode := Format(ExcelBuf."Cell Value as Text");
                end;

                if ExcelBuf.Get(lintRowCounter, 8) then begin
                    xlsLotNo := ExcelBuf."Cell Value as Text";
                end;

                if ExcelBuf.Get(lintRowCounter, 9) then begin
                    Evaluate(xlsExpDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));
                end;

                if ExcelBuf.Get(lintRowCounter, 10) then begin
                    Evaluate(xlsQty, ExcelBuf."Cell Value as Text");
                end;

                if ExcelBuf.Get(lintRowCounter, 11) then begin
                    Evaluate(xlsASEDate, FormatDataToDate(ExcelBuf."Cell Value as Text"));
                end;

                if ExcelBuf.Get(lintRowCounter, 12) then begin
                    xlsRecNo := ExcelBuf."Cell Value as Text";
                end;

                // create new line
                InsertItemJnlLine(xlsLotNo, xlsSerialNo, xlsItemNo, xlsLocCode, '', xlsQty, '', xlsLineNo);

            end;
        end;
    end;

    procedure InsertItemJnlLine(LotNo: Code[20]; SerialNo: Code[20]; ItemNo: Code[20]; LocCode2: Code[10]; Bin2: Code[20]; Quantity1: Decimal; Uom: Code[10]; intLineNo: Integer);
    VAR
        lrecLotNoInfo: Record "Lot No. Information";
        lrecItemLedgerEntry: Record "Item Ledger Entry";
        WhseEntry2: Record "Warehouse Entry";
        WhseEntry3: Record "Warehouse Entry";
        ReservEntry: Record "Reservation Entry";
        lrReservEntry: Record "Reservation Entry";
        RecRef: RecordRef;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
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
            ItemJnlLine.Validate("Posting Date", xlsPostingDate);
            ItemJnlLine.Validate("Document No.", xlsDocNo);
            ItemJnlLine.Validate("External Document No.", xlsExtDocNo);

            ItemJnlLine.Validate("Item No.", xlsItemNo);
            ItemJnlLine.Validate("Location Code", xlsLocCode);

            OldLotNo := '';
            EntryNo := 0;
            lrecItemLedgerEntry.Reset();
            lrecItemLedgerEntry.SetCurrentKey("Item No.", "Posting Date");
            lrecItemLedgerEntry.SetRange("Item No.", xlsItemNo);
            lrecItemLedgerEntry.SetRange("Variant Code", '');
            lrecItemLedgerEntry.SetRange("Location Code", xlsLocCode);
            lrecItemLedgerEntry.SetRange("External Document No.", xlsExtDocNo);
            lrecItemLedgerEntry.SetFilter("Remaining Quantity", '<>%1', 0);
            if lrecItemLedgerEntry.FindLast() then begin
                OldLotNo := lrecItemLedgerEntry."Lot No.";
                EntryNo := lrecItemLedgerEntry."Entry No.";
            end else begin
                lrecItemLedgerEntry.SetRange("External Document No.");
                if lrecItemLedgerEntry.FindLast() then
                    OldLotNo := lrecItemLedgerEntry."Lot No."
            end;

            NewLotNo := '';
            NewExpDate := 0D;
            lrecItemLedgerEntry.Reset();
            lrecItemLedgerEntry.SetCurrentKey("Item No.", "Posting Date");
            lrecItemLedgerEntry.SetRange("Item No.", xlsItemNo);
            lrecItemLedgerEntry.SetRange("Variant Code", '');
            lrecItemLedgerEntry.SetRange("Lot No.", xlsLotNo);
            if lrecItemLedgerEntry.FindLast() then begin
                NewExpDate := lrecItemLedgerEntry."Expiration Date";
            end;

            ItemJnlLine.Validate("New Location Code", xlsNewLocCode);
            ItemJnlLine.Validate(Quantity, xlsQty);
            if EntryNo <> 0 then
                ItemJnlLine.Validate(ItemJnlLine."Applies-to Entry", EntryNo);

            ItemJnlLine.Insert(true);

            if OldLotNo <> '' then begin
                Clear(ReservEntry);
                ReservEntry."Lot No." := OldLotNo;
                ReservEntry."Serial No." := SerialNo;
                CreateReservEntry.CreateReservEntryFor(
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

                CreateReservEntry.CreateEntry(
                  ItemJnlLine."Item No.",
                  ItemJnlLine."Variant Code",
                  ItemJnlLine."Location Code",
                  ItemJnlLine.Description,
                  0D, 0D, 0,
                  ReservEntry."Reservation Status"::Prospect);

                Clear(lrReservEntry);
                ReservEngineMgt.InitFilterAndSortingLookupFor(lrReservEntry, true);
                //ReserveItemJnlLine.FilterReservFor(lrReservEntry, ItemJnlLine);
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);
                lrReservEntry.SetRange("Reservation Status", lrReservEntry."Reservation Status"::Prospect);
                if SerialNo <> '' then
                    lrReservEntry.SetRange("Serial No.", SerialNo);
                if LotNo <> '' then
                    lrReservEntry.SetRange("Lot No.", OldLotNo);
                if lrReservEntry.FindFirst() then
                    repeat
                        lrReservEntry.Validate("New Lot No.", LotNo);

                        if NewExpDate <> 0D then
                            lrReservEntry.Validate("New Expiration Date", NewExpDate)
                        else
                            if xlsExpDate <> 0D then
                                lrReservEntry.Validate("New Expiration Date", xlsExpDate);
                        lrReservEntry.Modify();
                        lrReservEntry.Validate("Quantity (Base)", xlsQty);
                        if not lrecLotNoInfo.Get(lrReservEntry."Item No.", lrReservEntry."Variant Code", lrReservEntry."New Lot No.") then begin
                            lrecLotNoInfo.Init();
                            lrecLotNoInfo."Item No." := lrReservEntry."Item No.";
                            lrecLotNoInfo."Lot No." := lrReservEntry."New Lot No.";
                            lrecLotNoInfo."First Receiving Date" := xlsPostingDate;
                            lrecLotNoInfo."Inspection Passed Date" := xlsASEDate;
                            lrecLotNoInfo.Insert();
                        end;
                    until lrReservEntry.Next() = 0;
            end;
        end;
    end;

    local procedure FormatDataToCode(TextToFormat: Text[250]): Text[250];
    VAR
        FormatInteger: Integer;
        FormatDecimal: Decimal;
        FormatDate: Date;
        FormatBigInteger: BigInteger;
    begin
        case true of
            Evaluate(FormatBigInteger, TextToFormat):
                begin
                    if (StrPos(TextToFormat, '.') = 0) and (StrPos(TextToFormat, ',') = 0)
                    then
                        exit(TextToFormat)
                    else
                        exit(Format(FormatBigInteger, 0, '<Integer>'));
                end;
            Evaluate(FormatInteger, TextToFormat):
                begin
                    if (StrPos(TextToFormat, '.') = 0) and (StrPos(TextToFormat, ',') = 0)
                    then
                        exit(TextToFormat)
                    else
                        exit(Format(FormatInteger, 0, '<Integer>'));
                end;
            else
                exit(TextToFormat);
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

    local procedure FormatDataToNumber(TextToFormat: Text[250]): Text[250];
    VAR
        FormatInteger: Integer;
        FormatDecimal: Decimal;
        FormatDate: Date;
        FormatBigInteger: BigInteger;
    begin
        case true of
            Evaluate(FormatBigInteger, TextToFormat):
                exit(Format(FormatBigInteger, 0, '<Integer>'));
            Evaluate(FormatInteger, TextToFormat):
                exit(Format(FormatInteger, 0, '<Integer>'));
            Evaluate(FormatDecimal, TextToFormat):
                exit(Format(FormatDecimal));
            else
                exit(TextToFormat);
        end;
    end;

    local procedure ReadSheetTXT2(FileName: Text[250])
    var
        FileCSV: File;
        Window: Dialog;
        ReadFileLbl: Label 'Reading CSV worksheet...\\';
    begin
        /* if GUIALLOWED then
            Window.OPEN(
              ReadFileLbl +
              '#1########################\');
        ExcelBuf.DELETEALL;

        lchrFieldSeperator := 9;

        FileCSV.WRITEMODE(true);
        FileCSV.TEXTMODE(true);
        FileCSV.OPEN(FileName);
        FileCSV.CREATEINSTREAM(lInStream);

        i := 0;
        ltxtLine := '';

        intColumn := 0;
        intRow := 1;

        repeat
            i += 1;
            ChrOK := lInStream.READ(Chr);
            z := Chr;
            if (z <> 10) and (z <> 13) and (Chr <> lchrFieldSeperator) then begin
                ltxtLine += Format(Chr);
            end
            else begin
                intColumn += 1;
                if z = 10 then begin
                    intColumn := 0;
                    intRow += 1;
                end;

                if DELCHR(Format(ltxtLine), '<', '') <> '' then begin
                    Init();
                    "Row No." := intRow;
                    "Column No." := intColumn;
                    "Cell Value as Text" := DELCHR(Format(ltxtLine), '>', '');
                    Insert();
                    if GUIALLOWED then
                        Window.UPDATE(1, "Cell Value as Text");
                end;

                ltxtLine := '';
            end;
        until (ChrOK = 0);
        FileCSV.CLOSE;
        if GUIALLOWED then
            Window.CLOSE;
    */
    end;
}