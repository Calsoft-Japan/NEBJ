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
                    Caption = 'Option';
                    field(FileName; FileName)
                    {
                        ApplicationArea = All;
                        Caption = 'File Name';
                        AssistEdit = true;

                        trigger OnAssistEdit()
                        var
                            FileMgt: Codeunit "File Management";
                        begin
                            FileName := FileMgt.BLOBImportWithFilter(TempBlob, ImpFileLbl, FileName, StrSubstNo(DialogTxt, FilterTxt), FilterTxt);
                            FileExt := FileMgt.GetExtension(FileName);
                            if (FileName = '') or (not TempBlob.HasValue()) or not (FileExt in ['csv']) then begin
                                FileName := '';
                                Error(BlankFileErr);
                            end;
                            TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);
                        end;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        Delimiter := '"';
        Separator := ',';

        while (not FileInStream.EOS) do begin
            FileInStream.ReadText(RecString);
            RecLen := StrLen(RecString);
            RecTotal := RecLen;
            RecCount := 0;

            Window.Open(StrSubstNo(Text011, Text015) + Text012 + Text013 + Text014);
            Window.Update(1, FileName);

            if SalesOrderImportResult.FindLast() then begin
                BatchNum := SalesOrderImportResult."Batch No." + 1;
                EntryNum := SalesOrderImportResult."Entry No.";
            end else begin
                BatchNum := 1;
                EntryNum := 0;
            end;
            ImportLineCount := 0;

            while RecLen <> 0 do begin
                Window.Update(2, CopyStr(RecString, 1, 30));
                RecCount += RecLen;
                Window.Update(3, Round(RecCount / RecTotal * 10000, 1));

                InitSubString(RecString, Delimiter, Separator);

                Clear(SalesOrderImportResult);
                Clear(TempSalesOrderImportResult);

                TempSalesOrderImportResult.Init();
                TempSalesOrderImportResult."Entry No." := EntryNum;
                TempSalesOrderImportResult.Insert();

                TempSalesOrderImportResult."Batch No." := BatchNum;
                TempSalesOrderImportResult."Import Line Count" := ImportLineCount;

                //Order Source Corporation Code_1
                SubString := GetSubString(RecString);

                //Order Source Code_2
                SubString := GetSubString(RecString);
                TempSalesOrderImportResult."Order Source Code" := SubString;
                OrderSourceCode := SubString;
                OrderSourceCodeText := SubString;

                if ImportLineCount = 0 then
                    if OrderSourceCodeText <> Text022 then
                        LabelError();

                //3
                SubString := GetSubString(RecString);

                //4
                SubString := GetSubString(RecString);

                //5
                SubString := GetSubString(RecString);

                //Item Code_6
                SubString := GetSubString(RecString);
                TempSalesOrderImportResult."Item Code" := SubString;
                ItemCode := SubString;
                ItemCodeText := SubString;

                if ImportLineCount = 0 then begin
                    if ItemCodeText <> Text024 then
                        LabelError();
                end;

                //7
                SubString := GetSubString(RecString);

                //8
                SubString := GetSubString(RecString);

                //9
                SubString := GetSubString(RecString);

                //10
                SubString := GetSubString(RecString);

                //Quantity_11
                SubString := GetSubString(RecString);
                TempSalesOrderImportResult.Quantity := SubString;
                QuantityText := SubString;
                Evaluate(QuantityCode, QuantityText);
                if QuantityCode = '' then
                    QuantityCode := '0';

                if ImportLineCount = 0 then begin
                    if QuantityText <> Text025 then
                        LabelError();
                end else begin
                    if Evaluate(SubNum, QuantityCode) then
                        Quantity := SubNum
                    else
                        Quantity := -1;
                end;


                SubString := GetSubString(RecString);

                SubString := GetSubString(RecString);
                TempSalesOrderImportResult."Order Source Order No." := SubString;
                OrderSourceOrderNum := SubString;
                OrderSourceOrderNumCheck := DelChr(OrderSourceOrderNum, '=', '　');
                OrderSourceOrderNumCheck := DelChr(OrderSourceOrderNumCheck, '=', ' ');

                if ImportLineCount = 0 then
                    if OrderSourceOrderNum <> Text023 then
                        LabelError();
                // 14
                SubString := GetSubString(RecString);

                //  15
                SubString := GetSubString(RecString);

                //   16
                SubString := GetSubString(RecString);

                //Stataus
                TempSalesOrderImportResult.Status := SalesOrderImportResult.Status::Skip;

                //Proccessing Date
                TempSalesOrderImportResult."Proccessing Date" := CurrentDateTime;

                //User ID
                TempSalesOrderImportResult."User ID" := UserId;

                if ImportLineCount <> 0 then begin
                    if OrderSourceCode <> '' then begin
                        if OrderSourceOrderNumCheck <> '' then begin
                            if ItemCode <> '' then begin
                                if Quantity <> 0 then begin
                                    if Quantity <> -1 then
                                        SpecifiedTableProcessing()
                                    else
                                        TempSalesOrderImportResult."Error Comment" := Text027;
                                end else
                                    TempSalesOrderImportResult."Error Comment" := Text025 + Text026;
                            end else
                                TempSalesOrderImportResult."Error Comment" := Text024 + Text026;
                        end else
                            TempSalesOrderImportResult."Error Comment" := Text023 + Text026;
                    end else
                        TempSalesOrderImportResult."Error Comment" := Text022 + Text026;
                    if TempSalesOrderImportResult.Status <> TempSalesOrderImportResult.Status::Success then begin
                        TempSalesOrderImportResult.Validate(Status, TempSalesOrderImportResult.Status::Skip);
                        TempSalesOrderImportResult.Validate("Line No.", 0);
                    end;
                    TempSalesOrderImportResult.Modify();
                    SalesOrderImportResult.Init();
                    SalesOrderImportResult.Copy(TempSalesOrderImportResult);
                    SalesOrderImportResult.Insert();
                    if (TempSalesOrderImportResult.Status = TempSalesOrderImportResult.Status::Success) then begin
                        if (TempSalesOrderImportResult_A.Quantity <> '') then begin
                            TempSalesOrderImportResultHold_A.Init();
                            TempSalesOrderImportResultHold_A.Copy(TempSalesOrderImportResult);
                            TempSalesOrderImportResultHold_A."Document No." := TempSalesOrderImportResult_A."Document No.";
                            TempSalesOrderImportResultHold_A."Line No." := TempSalesOrderImportResult_A."Line No.";
                            TempSalesOrderImportResultHold_A.Quantity := TempSalesOrderImportResult_A.Quantity;
                            TempSalesOrderImportResultHold_A.Insert();
                            TempSalesOrderImportResult_A.Quantity := '';
                        end;
                        TempSalesOrderImportResultHold.Init();
                        TempSalesOrderImportResultHold.Copy(TempSalesOrderImportResult);
                        TempSalesOrderImportResultHold.Insert();
                    end;
                end;
                EntryNum := EntryNum + 1;
                ImportLineCount := ImportLineCount - 1;
                RecLen := StrLen(RecString);
            end;

            if TempSalesOrderImportResultHold_A.FindFirst then begin
                repeat
                    SalesOrderImportResult.Init();
                    SalesOrderImportResult.Copy(TempSalesOrderImportResultHold_A);
                    SalesOrderImportResult."Entry No." := EntryNum;
                    SalesOrderImportResult.Insert();
                    EntryNum := EntryNum + 1;
                until TempSalesOrderImportResultHold_A.Next() = 0
            end;
            if TempSalesOrderImportResultHold.FindFirst() then begin
                repeat
                    if SalesHeader.Get(SalesHeader."Document Type"::Order, TempSalesOrderImportResultHold."Document No.") then begin
                        Clear(SalesLine);
                        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                        SalesLine.SetFilter("Document No.", TempSalesOrderImportResultHold."Document No.");
                        if not SalesLine.FindLast() then begin
                            SalesHeader.Delete();
                        end;

                    end;
                until TempSalesOrderImportResultHold.Next() = 0;
            end;
        end;
        Window.Close();
        Message(Text016);
    end;

    var
        Item: Record "Item";
        Customer: Record "Customer";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesOrderImportResult: Record "Sales Order Import Result";
        TempSalesOrderImportResult: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResult_A: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResultHold_A: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResultHold: Record "Sales Order Import Result" temporary;
        ItemTrackingManagement: Codeunit "Item Tracking Management";
        TempBlob: Codeunit "Temp Blob";
        FileExt: Text;
        FileName: Text[250];
        ServerFileName: Text[1024];
        f: File;
        RecTotal: Integer;
        RecCount: Integer;
        RecString: Text[1024];
        SubString: Text[250];
        RecLen: Integer;
        Delimiter: Text[5];
        Separator: Text[5];
        Window: Dialog;
        CustomerNum: Text[20];
        OrderSourceOrderNum: Text[20];
        OrderSourceOrderNumCheck: Text[30];
        QuantityText: Text[30];
        OrderSourceCodeText: Text[30];
        ItemCodeText: Text[30];
        OrderSourceCode: Code[20];
        ItemCode: Code[20];
        DocumentNum: Code[20];
        QuantityCode: Code[30];
        Quantity: Integer;
        LineNum: Integer;
        EntryNum: Integer;
        SubNum: Decimal;
        BatchNum: Integer;
        ImportLineCount: Integer;
        c: Integer;
        gs_is: Integer;
        gs_imax: Integer;
        gs_del: Text[10];
        gs_sep: Text[10];
        StringPatch: Boolean;
        FileInStream: InStream;
        ImpFileLbl: Label 'Import from Zengin File';
        BlankFileErr: Label 'File not found or incorrect.';
        DialogTxt: Label 'Text Files (%1)|%1';
        FilterTxt: Label '(*.csv)|*.csv|All Files (*.*)|*.*';
        Text001: Label 'Import from Zengin File';
        Text002: Label 'Text Files (*.csv)|*.csv|All Files (*.*)|*.*';
        Text003: Label 'Please input import file path.';
        Text004: Label 'File not found or incoorect.';
        Text005: Label 'File could not be opened !';
        Text011: Label '%1ing ...\';
        Text012: Label 'File Name  #1##############################\';
        Text013: Label 'Record     #2##############################\\';
        Text014: Label '@3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        Text015: Label 'Import';
        Text016: Label 'The file was successfully uploaded to server.';
        Text017: Label 'Does not exist Customer master corresponding to the "Order Source Code".';
        Text018: Label 'Does not exist Item master corresponding to the  "Item Code".';
        Text019: Label 'Entry No.';
        Text020: Label ': combination of "Item Code" and "Order Source Order No." is the same to this Entry Number.';
        Text021: Label 'The first line of the import data can not be recognized as a label.\Please check whether there is an error in the item name of the label line.\"%1","%2","%3","%4"';
        Text022: Label 'Order Source Code';
        Text023: Label 'Order Source Order No.';
        Text024: Label 'Item Code';
        Text025: Label 'Quantity';
        Text026: Label 'is not importing.';
        Text027: Label 'Quantity has not been entered in a continuous single-byte numerical value.';

    procedure SpecifiedTableProcessing()
    var
        SalesHeader_temp: Record "Sales Header" temporary;
        Quantity_A: integer;
        OverCheck: Boolean;
    begin
        Customer.SetFilter("No.", OrderSourceCode);//customer
        if Customer.FindFirst() then begin
            CustomerNum := Customer."No.";
            Item.SetFilter("No.", ItemCode);
            if Item.FindFirst() then begin
                Clear(SalesLine);
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SetRange("Sell-to Customer No.", CustomerNum);
                SalesLine.SetRange("No.", ItemCode);
                SalesLine.SetRange("ExternaDocumentNo.", OrderSourceOrderNum);
                if not SalesLine.FindFirst() then begin
                    SalesOrderImportResult.SetRange("Batch No.", BatchNum);
                    SalesOrderImportResult.SetRange(Status, SalesOrderImportResult.Status::Success);
                    SalesOrderImportResult.SetFilter("Order Source Code", OrderSourceCode);
                    if not SalesOrderImportResult.FindFirst() then begin
                        Inventrycheck(Quantity, Quantity_A, OverCheck);
                        SalesHeader := SalesHeader_temp;
                        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                        Clear(SalesHeader."No.");
                        Clear(SalesHeader."Sell-to Customer No.");
                        Clear(SalesHeader."Bill-to Customer No.");
                        SalesHeader.Insert(true);
                        SalesHeader.InitRecord;
                        SalesHeader.Validate("Sell-to Customer No.", CustomerNum);
                        SalesHeader.Validate("External Document No.", SalesHeader."No.");
                        SalesHeader.Modify();
                        DocumentNum := SalesHeader."No.";
                        LineNum := 10000;
                        // SalesLineInsert;
                        // SalesLineModify;
                        if Quantity <> 0 then begin
                            SalesLineInsert(Quantity);
                            SalesLineModify(Quantity);
                        end else Begin
                            TempSalesOrderImportResult.Validate(Status, SalesOrderImportResult.Status::Success);
                            TempSalesOrderImportResult.Validate("Document No.", DocumentNum);
                            TempSalesOrderImportResult.Validate(Quantity, Format(Quantity));
                        End;
                        if OverCheck then begin
                            SalesHeader := SalesHeader_temp;
                            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                            Clear(SalesHeader."No.");
                            Clear(SalesHeader."Sell-to Customer No.");
                            Clear(SalesHeader."Bill-to Customer No.");
                            SalesHeader.Insert(true);
                            SalesHeader.InitRecord();

                            SalesHeader.Validate("Sell-to Customer No.", CustomerNum);
                            SalesHeader.Validate("External Document No.", SalesHeader."No.");
                            SalesHeader.Modify();
                            DocumentNum := SalesHeader."No.";
                            LineNum := 10000;
                            SalesLineInsert_A(Quantity_A);
                            SalesLineModify_A(Quantity_A);
                        end;
                    end else begin
                        Inventrycheck(Quantity, Quantity_A, OverCheck);
                        DocumentNum := SalesOrderImportResult."Document No.";
                        if Quantity <> 0 then begin
                            Clear(SalesLine);
                            SalesLine.SetFilter(SalesLine."Document No.", DocumentNum);
                            if SalesLine.FindFirst() then begin
                                if SalesLine.FindLast() then
                                    LineNum := SalesLine."Line No." + 10000;
                            end;
                            SalesLineInsert(Quantity);
                            SalesLineModify(Quantity);
                        end else Begin
                            TempSalesOrderImportResult.Validate(Status, SalesOrderImportResult.Status::Success);
                            TempSalesOrderImportResult.Validate("Document No.", DocumentNum);
                            TempSalesOrderImportResult.Validate(Quantity, Format(Quantity));
                        End;

                        if OverCheck then begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                            SalesHeader.SetRange("No.", TempSalesOrderImportResultHold_A."Document No.");
                            if ((not SalesHeader.FindFirst()) AND ((DocumentNum < TempSalesOrderImportResultHold_A."Document No.") or (TempSalesOrderImportResultHold_A."Document No." = ''))) then begin
                                SalesHeader := SalesHeader_temp;
                                SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                                Clear(SalesHeader."No.");
                                Clear(SalesHeader."Sell-to Customer No.");
                                Clear(SalesHeader."Bill-to Customer No.");
                                SalesHeader.Insert(true);
                                SalesHeader.InitRecord();

                                SalesHeader.Validate("Sell-to Customer No.", CustomerNum);
                                SalesHeader.Validate("External Document No.", SalesHeader."No.");
                                SalesHeader.Modify();
                                DocumentNum := SalesHeader."No.";
                                LineNum := 10000;
                            end else begin
                                Clear(SalesLine);
                                DocumentNum := TempSalesOrderImportResultHold_A."Document No.";
                                SalesLine.SetFilter(SalesLine."Document No.", DocumentNum);
                                if SalesLine.FindFirst() then begin
                                    if SalesLine.FindLast() then
                                        LineNum := SalesLine."Line No." + 10000;
                                end;
                            end;
                            SalesLineInsert_A(Quantity_A);
                            SalesLineModify_A(Quantity_A);
                        end;
                    end;
                end else begin
                    DocumentNum := SalesLine."Document No.";
                    TempSalesOrderImportResult."Error Comment" := Text019 + DocumentNum + Text020;
                end;
            end else
                TempSalesOrderImportResult."Error Comment" := Text018;
        end else
            TempSalesOrderImportResult."Error Comment" := Text017;
    end;

    procedure SalesLineInsert(var QuantityOrigin: integer)
    begin
        SalesLine."Document Type" := SalesLine."Document Type"::Order;
        SalesLine."Document No." := DocumentNum;
        SalesLine."Line No." := LineNum;
        SalesLine.Type := SalesLine.Type::Item;
        SalesLine."Quantity (Base)" := QuantityOrigin;
        SalesLine.Insert(true);
    end;

    procedure SalesLineModify(var QuantityOrigin: integer)
    var
        ItemTrackMgmt: Codeunit ItemTrackingMgmt;
    begin
        SalesLine.Validate("No.", ItemCode);
        SalesLine.Validate(Quantity, QuantityOrigin);
        SalesLine.Validate("ExternaDocumentNo.", OrderSourceOrderNum);
        SalesLine.Modify();
        ItemTrackMgmt.ImportProcessingFlag;
        ItemTrackMgmt.AssistEditLotSerialNo(SalesLine, SalesLine.Quantity - SalesLine."Quantity Shipped");
        TempSalesOrderImportResult.Validate(Status, SalesOrderImportResult.Status::Success);
        TempSalesOrderImportResult.Validate("Document No.", DocumentNum);
        TempSalesOrderImportResult.Validate("Line No.", SalesLine."Line No.");
        TempSalesOrderImportResult.Validate(Quantity, Format(QuantityOrigin));
    end;

    procedure SalesLineInsert_A(var Quantity_A: integer)
    begin
        SalesLine."Document Type" := SalesLine."Document Type"::Order;
        SalesLine."Document No." := DocumentNum;
        SalesLine."Line No." := LineNum;
        SalesLine.Type := SalesLine.Type::Item;
        SalesLine."Quantity (Base)" := Quantity_A;
        SalesLine.Insert(true);
    end;

    procedure SalesLineModify_A(var Quantity_A: integer)
    begin
        SalesLine.Validate("No.", ItemCode);
        SalesLine.Validate(Quantity, Quantity_A);
        SalesLine.Validate("ExternaDocumentNo.", OrderSourceOrderNum);
        SalesLine.Modify();
        TempSalesOrderImportResult_A.Init();
        TempSalesOrderImportResult_A.Copy(TempSalesOrderImportResult);
        TempSalesOrderImportResult_A.Validate(Status, SalesOrderImportResult.Status::Success);
        TempSalesOrderImportResult_A.Validate("Document No.", DocumentNum);
        TempSalesOrderImportResult_A.Validate("Line No.", SalesLine."Line No.");
        TempSalesOrderImportResult_A.Validate(Quantity, Format(Quantity_A));
    end;

    procedure Inventrycheck(var retQuantity_origin: integer; var retQuantity_A: integer; var overCheck: Boolean)
    var
        Item_Check: Record Item;
        InventoryCheckQty: Integer;
    begin
        retQuantity_A := 0;
        overCheck := false;
        InventoryCheckQty := 0;
        Item_Check.Reset();
        Item_Check.SetRange("No.", ItemCode);
        Item_Check.SetRange("Location Filter", '1000');

        if Item_Check.FindFirst() then begin
            Item_Check.CalcFields(Item_Check.Inventory, Item_Check."Qty. on Sales Order");
            InventoryCheckQty := Item_Check.Inventory - Item_Check."Qty. on Sales Order";
        end;
        if InventoryCheckQty < 0 then begin
            InventoryCheckQty := 0
        end;
        if retQuantity_origin < 0 then begin
            retQuantity_origin := 0
        end;
        if InventoryCheckQty < retQuantity_origin then begin
            retQuantity_A := retQuantity_origin - InventoryCheckQty;
            retQuantity_origin := InventoryCheckQty;
            overCheck := true;
        end;
    end;

    procedure LabelError()
    begin
        Error(Text021, Text022, Text023, Text024, Text025);
    end;

    PROCEDURE InitSubString(String: Text[1024]; Delimiter: Code[10]; Separator: Code[10]);
    begin
        StringPatch := NeedStringPatch;

        gs_is := 1;
        if StringPatch then
            gs_imax := f_STRLEN(String)
        else
            gs_imax := STRLEN(String);
        gs_del := '';
        gs_sep := '';
        case Delimiter of
            '<TAB>':
                gs_del[1] := 9;
            '<CR>':
                gs_del[1] := 13;
            '<LF>':
                gs_del[1] := 10;
            '<CR/LF>':
                begin
                    gs_del[1] := 13;
                    gs_del[2] := 10;
                end;
            else
                gs_del := Delimiter;
        end;
        case Separator of
            '<TAB>':
                gs_sep[1] := 9;
            '<CR>':
                gs_sep[1] := 13;
            '<LF>':
                gs_sep[1] := 10;
            '<CR/LF>':
                begin
                    gs_sep[1] := 13;
                    gs_sep[2] := 10;
                end;
            else
                gs_sep := Separator;
        end;
    end;

    PROCEDURE NeedStringPatch(): Boolean;
    VAR
        String: Text[30];
    begin
        String := '漢字';
        exit(StrLen(String) = 2);
    end;

    PROCEDURE f_STRLEN(String: Text[1024]) Len: Integer;
    VAR
        ip: Integer;
        found: Boolean;
    begin
        Len := 0;
        ip := 0;
        found := false;
        repeat
            Len += 1;
            ip += 1;
            if String[ip] = 0 then
                found := true;
            if IsKanjiFirstByte(String[ip]) then
                Len += 1;
        until found or (Len >= 1024);
        if (Len = 1024) AND (not found) then
            exit(Len)
        else
            exit(Len - 1);
    end;

    PROCEDURE IsKanjiFirstByte(Cod: Char): Boolean;
    begin
        exit(((Cod >= 129) AND (Cod <= 159)) or ((Cod >= 224) AND (Cod <= 252)));
    end;

    PROCEDURE GetSubString(String: Text[1024]) SubString: Text[250];
    VAR
        ip: Integer;
        is: Integer;
        FieldEnd: Boolean;
    begin
        if gs_imax = 0 then
            exit('');
        if String[gs_is] = gs_del[1] then begin
            gs_is += 1;
            ip := 1;
            is := 1;
            FieldEnd := false;
            repeat
                case String[gs_is] of
                    0:
                        FieldEnd := true;
                    gs_del[1]:
                        case String[gs_is + 1] of
                            0:
                                FieldEnd := true;
                            gs_del[1]:
                                begin
                                    SubString[is] := gs_del[1];
                                    is += 1;
                                    ip += 2;
                                    gs_is += 2;
                                end;
                            gs_sep[1]:
                                begin
                                    ip += 1;
                                    gs_is += 2;
                                    FieldEnd := true;
                                end;
                        end;
                    else begin
                        SubString += CopyStr(String, gs_is, 1);
                        is += 1;
                        ip += 1;
                        gs_is += 1;
                    end
                end;
            until FieldEnd;
            gs_imax := gs_imax - ip;
        end else begin
            if StringPatch then
                ip := f_STRPOS(f_COPYSTR3(String, gs_is, gs_imax), gs_sep)
            else
                ip := StrPos(CopyStr(String, gs_is, gs_imax), gs_sep);
            if ip = 0 then begin
                if StringPatch then
                    SubString := f_COPYSTR3(String, gs_is, gs_imax)
                else
                    SubString := CopyStr(String, gs_is, gs_imax);
                gs_imax := 0;
            end else begin
                if StringPatch then
                    if ip <> 1 then
                        SubString := f_COPYSTR3(String, gs_is, ip - 1)
                    else
                        SubString := ''
                else
                    SubString := CopyStr(String, gs_is, ip - 1);
                gs_is := gs_is + ip;
                gs_imax := gs_imax - ip;
            end;
        end;
    end;


    PROCEDURE f_COPYSTR3(String: Text[1024]; Position: Integer; Length: Integer) NewString: Text[1024];
    VAR
        len: Integer;
        epos: Integer;
        ip: Integer;
        ip_b: Integer;
    begin
        if (Position < 1) or (Length < 0) then
            NewString := CopyStr(String, Position, Length);
        NewString := '';
        len := f_STRLEN(String);
        if Length = 0 then
            epos := len
        else
            epos := Position + Length - 1;
        if epos > len then
            epos := len;
        ip := 0;
        ip_b := 0;
        repeat
            ip += 1;
            ip_b += 1;
            if ip_b >= Position then
                NewString := NewString + CopyStr(String, ip, 1);
            if IsKanjiFirstByte(String[ip]) then
                ip_b += 1;
        until ip_b >= epos;
    end;

    PROCEDURE f_STRPOS(String: Text[1024]; SubString: Text[30]) Pos: Integer;
    VAR
        mlen: Integer;
        slen: Integer;
        ip: Integer;
        ip_b: Integer;
        m_ip: Integer;
        s_ip: Integer;
        s_ip_b: Integer;
    begin
        if (String = '') or (SubString = '') then
            exit(0);
        mlen := f_STRLEN(String);
        slen := f_STRLEN(SubString);
        if mlen < slen then
            exit(0);
        ip := 0;
        ip_b := 0;
        Pos := 0;
        repeat
            ip += 1;
            ip_b += 1;
            if String[ip] = SubString[1] then begin
                if (mlen - ip_b + 1 < slen) then
                    exit(0);
                Pos := ip_b;
                m_ip := ip;
                s_ip := 0;
                s_ip_b := 0;
                repeat
                    s_ip += 1;
                    s_ip_b += 1;
                    if String[m_ip] <> SubString[s_ip] then
                        Pos := 0;
                    m_ip += 1;
                    if IsKanjiFirstByte(SubString[s_ip]) then
                        s_ip_b += 1;
                until (Pos = 0) or (s_ip_b >= slen);
            end;
            if IsKanjiFirstByte(String[ip]) then
                ip_b += 1;
        until (Pos <> 0) or (ip_b >= 1024);
        exit(Pos);
    end;
}

