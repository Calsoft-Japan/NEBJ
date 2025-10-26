report 50000 "Sales Order Import"
{
    ApplicationArea = All;
    Caption = 'Sales Order Import';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset { }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
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

                            Clear(TempBlob);
                            Encoding.Encoding(932);
                            StreamReader.StreamReader(FileInStream, Encoding);
                            FileContent := StreamReader.ReadToEnd();
                            TempBlob.CreateOutStream(ContentOutStream, TextEncoding::UTF8);
                            ContentOutStream.WriteText(FileContent);
                            TempBlob.CreateInStream(ContentInStream);

                            TempCSVBuffer.Reset();
                            TempCSVBuffer.DeleteAll();
                            TempCSVBuffer.LoadDataFromStream(ContentInStream, ',');
                        end;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    var
        RowNo: Integer;
        TotRows: Integer;
    begin
        TotRows := TempCSVBuffer.GetNumberOfLines();
        Window.Open(StrSubstNo(Text011, Text015) + Text012 + Text013 + Text014);
        Window.Update(1, FileName);
        if SOImportResult.FindLast() then begin
            BatchNo := SOImportResult."Batch No." + 1;
            EntryNo := SOImportResult."Entry No.";
        end else begin
            BatchNo := 1;
            EntryNo := 0;
        end;
        ImportLineCnt := 0;

        for RowNo := 1 to TotRows do begin
            Clear(SOImportResult);
            Clear(TempSOImpResult);

            TempSOImpResult.Init();
            TempSOImpResult."Entry No." := EntryNo;
            TempSOImpResult.Insert();

            TempSOImpResult."Batch No." := BatchNo;
            TempSOImpResult."Import Line Count" := ImportLineCnt;

            //Order Source Code : Column 2
            OrderSourceCode := GetCellValue(RowNo, 2).TrimStart('"').TrimEnd('"');
            TempSOImpResult."Order Source Code" := OrderSourceCode;
            if ImportLineCnt = 0 then
                if OrderSourceCode <> Text022 then
                    LabelError();

            //Order Source Order No. Column 10
            OrdSrcOrderNo := GetCellValue(RowNo, 10).TrimStart('"').TrimEnd('"');
            TempSOImpResult."Order Source Order No." := OrdSrcOrderNo;
            OrdSrcOrdNoCheck := DelChr(OrdSrcOrderNo, '=', '　');
            OrdSrcOrdNoCheck := DelChr(OrdSrcOrdNoCheck, '=', ' ');

            if ImportLineCnt = 0 then
                if OrdSrcOrderNo <> Text023 then
                    LabelError();

            //Item Code Column 13
            ItemCode := GetCellValue(RowNo, 13).TrimStart('"').TrimEnd('"');
            TempSOImpResult."Item Code" := ItemCode;
            if ImportLineCnt = 0 then
                if ItemCode <> Text024 then
                    LabelError();

            //Quantity Column 16
            QtyCode := GetCellValue(RowNo, 16).TrimStart('"').TrimEnd('"');
            TempSOImpResult.Quantity := QtyCode;
            if QtyCode = '' then
                QtyCode := '0';

            if ImportLineCnt = 0 then begin
                if QtyCode <> Text025 then
                    LabelError();
            end else begin
                if Evaluate(SubNum, QtyCode) then
                    LineQty := SubNum
                else
                    LineQty := -1;
            end;

            //Status
            TempSOImpResult.Status := SOImportResult.Status::Skip;

            //Proccessing Date
            TempSOImpResult."Proccessing Date" := CurrentDateTime;

            //User ID
            TempSOImpResult."User ID" := UserId;

            if ImportLineCnt <> 0 then begin
                if OrderSourceCode <> '' then begin
                    if OrdSrcOrdNoCheck <> '' then begin
                        if ItemCode <> '' then begin
                            if LineQty <> 0 then begin
                                if LineQty <> -1 then
                                    SpecifiedTableProcessing()
                                else
                                    TempSOImpResult."Error Comment" := Text027;
                            end else
                                TempSOImpResult."Error Comment" := Text025 + Text026;
                        end else
                            TempSOImpResult."Error Comment" := Text024 + Text026;
                    end else
                        TempSOImpResult."Error Comment" := Text023 + Text026;
                end else
                    TempSOImpResult."Error Comment" := Text022 + Text026;
                if TempSOImpResult.Status <> TempSOImpResult.Status::Success then begin
                    TempSOImpResult.Validate(Status, TempSOImpResult.Status::Skip);
                    TempSOImpResult.Validate("Line No.", 0);
                end;
                TempSOImpResult.Modify();
                SOImportResult.Init();
                SOImportResult.Copy(TempSOImpResult);
                SOImportResult.Insert();
            end;
            EntryNo := EntryNo + 1;
            ImportLineCnt := ImportLineCnt - 1;
        end;
        Window.Close();
        Message(Text016);
    end;

    var
        Item: Record "Item";
        Customer: Record "Customer";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TempCSVBuffer: Record "CSV Buffer" temporary;
        SOImportResult: Record "Sales Order Import Result";
        TempSOImpResult: Record "Sales Order Import Result" temporary;
        TempBlob: Codeunit "Temp Blob";
        Encoding: Codeunit DotNet_Encoding;
        StreamReader: Codeunit DotNet_StreamReader;
        FileInStream: InStream;
        FileName: Text[250];
        DocNo: Code[20];
        CustNo: Text[20];
        OrdSrcOrderNo: Text[20];
        OrderSourceCode: Code[20];
        OrdSrcOrdNoCheck: Text[30];
        ItemCode: Code[20];
        QtyCode: Code[30];
        LineQty: Integer;
        LineNo: Integer;
        EntryNo: Integer;
        SubNum: Decimal;
        BatchNo: Integer;
        ImportLineCnt: Integer;
        Window: Dialog;
        DialogTxt: Label 'Import from zengin file';
        BlankFileErr: Label 'File not found or incorrect.';
        FilterTxt: Label 'Text Files (*.csv)|*.csv|All Files (*.*)|*.*';
        Text011: Label '%1ing ...\';
        Text012: Label 'File Name  #1##############################\';
        Text013: Label 'Record     #2##############################\\';
        Text014: Label '@3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        Text015: Label 'Import';
        Text016: Label 'The file was successfully uploaded to server.';
        Text017: Label 'Does not exist Customer master corresponding to the "Order Source Code".';
        Text018: Label 'Does not exist Item master corresponding to the  "Item Code".';
        Text019: Label 'Entry No.';
        Text020: Label ': Combination of "Item Code" and "Order Source Order No." is the same to this Entry Number.';
        Text021: Label 'The first line of the import data can not be recognized as a label.\Please check whether there is an error in the item name of the label line.\"%1","%2","%3","%4"';
        Text022: Label 'Order Source Code';
        Text023: Label 'Order Source Order No.';
        Text024: Label 'Item Code';
        Text025: Label 'Quantity';
        Text026: Label 'is not importing.';
        Text027: Label 'Quantity has not been entered in a continuous single-byte numerical value.';

    procedure SpecifiedTableProcessing()
    var
        TempSalesHeader: Record "Sales Header" temporary;
    begin
        Customer.Reset();
        Customer.SetFilter("Order Source", OrderSourceCode);
        IF Customer.FindFirst() then begin
            CustNo := Customer."No.";
            Item.SetFilter("No.", ItemCode);
            IF Item.FindFirst() then begin
                Clear(SalesLine);
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SetRange("Sell-to Customer No.", CustNo);
                SalesLine.SetRange("No.", ItemCode);
                SalesLine.SetRange("ExternaDocumentNo.", OrdSrcOrderNo);
                if not SalesLine.FindFirst() then begin
                    SOImportResult.SetRange("Batch No.", BatchNo);
                    SOImportResult.SetRange(Status, SOImportResult.Status::Success);
                    SOImportResult.SetFilter("Order Source Code", OrderSourceCode);
                    if not SOImportResult.FindFirst() then begin
                        SalesHeader := TempSalesHeader;
                        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                        Clear(SalesHeader."No.");
                        Clear(SalesHeader."Sell-to Customer No.");
                        Clear(SalesHeader."Bill-to Customer No.");
                        SalesHeader.Insert(true);
                        SalesHeader.InitRecord();
                        SalesHeader.Validate("Sell-to Customer No.", CustNo);
                        SalesHeader.Validate("External Document No.", SalesHeader."No.");
                        SalesHeader.Modify();
                        DocNo := SalesHeader."No.";
                        LineNo := 10000;
                        InsertSalesLine();
                        ModifySalesLine();
                    end else begin
                        DocNo := SOImportResult."Document No.";
                        Clear(SalesLine);
                        SalesLine.SetFilter(SalesLine."Document No.", DocNo);
                        IF SalesLine.FindFirst() then begin
                            IF SalesLine.FindLast() then
                                LineNo := SalesLine."Line No." + 10000;
                        end;
                        InsertSalesLine();
                        ModifySalesLine();
                    end;
                end else begin
                    DocNo := SalesLine."Document No.";
                    TempSOImpResult."Error Comment" := Text019 + DocNo + Text020;
                end;
            end else
                TempSOImpResult."Error Comment" := Text018;
        end else
            TempSOImpResult."Error Comment" := Text017;
    end;

    procedure InsertSalesLine()
    begin
        SalesLine."Document Type" := SalesLine."Document Type"::Order;
        SalesLine."Document No." := DocNo;
        SalesLine."Line No." := LineNo;
        SalesLine.Type := SalesLine.Type::Item;
        SalesLine."Quantity (Base)" := LineQty;
        SalesLine.Insert(true);
    end;

    procedure ModifySalesLine()
    var
        ItemTrackingMgt: Codeunit ItemTrackingMgtNEBJ;
    begin
        SalesLine.Validate("No.", ItemCode);
        SalesLine.Validate(Quantity, LineQty);
        SalesLine.Validate("ExternaDocumentNo.", OrdSrcOrderNo);
        SalesLine.Modify();
        ItemTrackingMgt.ImportProcessingFlag();
        ItemTrackingMgt.AssistEditLotSerialNo(SalesLine, SalesLine.Quantity - SalesLine."Quantity Shipped");
        TempSOImpResult.Validate(Status, SOImportResult.Status::Success);
        TempSOImpResult.Validate("Document No.", DocNo);
        TempSOImpResult.Validate("Line No.", SalesLine."Line No.");
    end;

    procedure LabelError()
    begin
        Error(Text021, Text022, Text023, Text024, Text025);
    end;

    local procedure GetCellValue(RowNo: Integer; ColNo: Integer): Text
    begin
        TempCSVBuffer.Reset();
        if TempCSVBuffer.Get(RowNo, ColNo) then
            exit(TempCSVBuffer.Value)
        else
            exit('');
    end;
}

