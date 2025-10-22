/* report 50000 "Sales Order Import Online"
{
    Caption = 'Sales Order Import Online';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
    }

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
                        AssistEdit = true;
                        Caption = 'File Name';

                        trigger OnAssistEdit()
                        var
                            FileMgt: Codeunit "File Management";
                        begin
                            IF NOT ISSERVICETIER THEN BEGIN
                                FileName := FileMgt.OpenFileDialog(Text001, FileName, Text002);
                                ServerFileName := FileName;
                            END ELSE
                                IF UPLOAD('', '', Text002, FileName, ServerFileName) THEN BEGIN
                                    FileName := ServerFileName;
                                END ELSE
                                    ServerFileName := '';
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

        IF ServerFileName = '' THEN
            ERROR(Text003);
        IF NOT EXISTS(ServerFileName) THEN
            ERROR(Text004);

        f.WRITEMODE(FALSE);
        f.TEXTMODE(TRUE);

        IF NOT f.OPEN(ServerFileName) THEN
            ERROR(Text005);

        RecLen := f.READ(RecString);
        RecTotal := f.LEN;
        RecCount := 0;

        Window.OPEN(STRSUBSTNO(Text011, Text015) + Text012 + Text013 + Text014);
        Window.UPDATE(1, FileName);


        IF SalesOrderImportResult.FINDLAST THEN BEGIN
            BatchNum := SalesOrderImportResult."Batch No." + 1;
            EntryNum := SalesOrderImportResult."Entry No.";
        END ELSE BEGIN
            BatchNum := 1;
            EntryNum := 0;
        END;

        ImportLineCount := 0;


        WHILE RecLen <> 0 DO BEGIN
            Window.UPDATE(2, COPYSTR(RecString, 1, 30));
            RecCount += RecLen;
            Window.UPDATE(3, ROUND(RecCount / RecTotal * 10000, 1));

            InitSubString(RecString, Delimiter, Separator);

            CLEAR(SalesOrderImportResult);
            CLEAR(TempSalesOrderImportResult);

            TempSalesOrderImportResult.INIT;
            TempSalesOrderImportResult."Entry No." := EntryNum;
            TempSalesOrderImportResult.INSERT;

            TempSalesOrderImportResult."Batch No." := BatchNum;
            TempSalesOrderImportResult."Import Line Count" := ImportLineCount;

            //Order Source Corporation Code_1
            SubString := GetSubString(RecString);

            //Order Source Code_2
            SubString := GetSubString(RecString);
            TempSalesOrderImportResult."Order Source Code" := SubString;
            OrderSourceCode := SubString;
            OrderSourceCodeText := SubString;

            IF ImportLineCount = 0 THEN BEGIN
                IF OrderSourceCodeText <> Text022 THEN
                    LabelError;
            END;

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

            IF ImportLineCount = 0 THEN BEGIN
                IF ItemCodeText <> Text024 THEN
                    LabelError;
            END;

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
            EVALUATE(QuantityCode, QuantityText);
            IF QuantityCode = '' THEN
                QuantityCode := '0';

            IF ImportLineCount = 0 THEN BEGIN
                IF QuantityText <> Text025 THEN
                    LabelError;
            END ELSE BEGIN
                IF EVALUATE(SubNum, QuantityCode) THEN
                    Quantity := SubNum
                ELSE
                    Quantity := -1;
            END;
            

            SubString := GetSubString(RecString);

            //Order Source Order No._13
            SubString := GetSubString(RecString);
            TempSalesOrderImportResult."Order Source Order No." := SubString;
            OrderSourceOrderNum := SubString;
            OrderSourceOrderNumCheck := DELCHR(OrderSourceOrderNum, '=', '　');
            OrderSourceOrderNumCheck := DELCHR(OrderSourceOrderNumCheck, '=', ' ');

            IF ImportLineCount = 0 THEN BEGIN
                IF OrderSourceOrderNum <> Text023 THEN
                    LabelError;
            END;

            // 14
            SubString := GetSubString(RecString);


            //  15
            SubString := GetSubString(RecString);

            //   16
            SubString := GetSubString(RecString);


            // //  17
            // SubString := GetSubString(RecString);

            // //    18
            // SubString := GetSubString(RecString);

            // //  19
            // SubString := GetSubString(RecString);

            // // 20
            // SubString := GetSubString(RecString);

            // //  21
            // SubString := GetSubString(RecString);

            // //Delivery Flag
            // SubString := GetSubString(RecString);

            // //Delivery Name
            // SubString := GetSubString(RecString);

            // //Delivery Post Code
            // SubString := GetSubString(RecString);

            // //Delivery Address
            // SubString := GetSubString(RecString);

            // //Delivery Phone
            // SubString := GetSubString(RecString);

            // //Order Transmission Datetime
            // SubString := GetSubString(RecString);

            //Stataus
            TempSalesOrderImportResult.Status := SalesOrderImportResult.Status::Skip;

            //Proccessing Date
            TempSalesOrderImportResult."Proccessing Date" := CURRENTDATETIME;

            //User ID
            TempSalesOrderImportResult."User ID" := USERID;

            IF ImportLineCount <> 0 THEN BEGIN
                IF OrderSourceCode <> '' THEN BEGIN
                    IF OrderSourceOrderNumCheck <> '' THEN BEGIN
                        IF ItemCode <> '' THEN BEGIN
                            IF Quantity <> 0 THEN BEGIN
                                IF Quantity <> -1 THEN
                                    SpecifiedTableProcessing
                                ELSE
                                    TempSalesOrderImportResult."Error Comment" := Text027;
                            END ELSE
                                TempSalesOrderImportResult."Error Comment" := Text025 + Text026;
                        END ELSE
                            TempSalesOrderImportResult."Error Comment" := Text024 + Text026;
                    END ELSE
                        TempSalesOrderImportResult."Error Comment" := Text023 + Text026;
                END ELSE
                    TempSalesOrderImportResult."Error Comment" := Text022 + Text026;
                IF TempSalesOrderImportResult.Status <> TempSalesOrderImportResult.Status::Success THEN BEGIN
                    TempSalesOrderImportResult.VALIDATE(Status, TempSalesOrderImportResult.Status::Skip);
                    TempSalesOrderImportResult.VALIDATE("Line No.", 0);
                END;
                TempSalesOrderImportResult.MODIFY;
                SalesOrderImportResult.INIT;
                SalesOrderImportResult.COPY(TempSalesOrderImportResult);
                SalesOrderImportResult.INSERT;
                if (TempSalesOrderImportResult.Status = TempSalesOrderImportResult.Status::Success) then begin
                    if (TempSalesOrderImportResult_A.Quantity <> '') then begin
                        TempSalesOrderImportResultHold_A.INIT;
                        TempSalesOrderImportResultHold_A.COPY(TempSalesOrderImportResult);
                        TempSalesOrderImportResultHold_A."Document No." := TempSalesOrderImportResult_A."Document No.";
                        TempSalesOrderImportResultHold_A."Line No." := TempSalesOrderImportResult_A."Line No.";
                        TempSalesOrderImportResultHold_A.Quantity := TempSalesOrderImportResult_A.Quantity;
                        TempSalesOrderImportResultHold_A.INSERT;
                        TempSalesOrderImportResult_A.Quantity := '';
                    end;

                    TempSalesOrderImportResultHold.INIT;
                    TempSalesOrderImportResultHold.COPY(TempSalesOrderImportResult);
                    TempSalesOrderImportResultHold.INSERT;
                end;
            END;

            EntryNum := EntryNum + 1;
            ImportLineCount := ImportLineCount - 1;
            RecLen := f.READ(RecString);
        END;

        if TempSalesOrderImportResultHold_A.FindFirst then begin
            repeat
                SalesOrderImportResult.INIT;
                SalesOrderImportResult.COPY(TempSalesOrderImportResultHold_A);
                SalesOrderImportResult."Entry No." := EntryNum;
                SalesOrderImportResult.INSERT;
                EntryNum := EntryNum + 1;
            until TempSalesOrderImportResultHold_A.Next = 0
        end;
        if TempSalesOrderImportResultHold.FindFirst() then begin
            repeat
                if SalesHeader.Get(SalesHeader."Document Type"::Order, TempSalesOrderImportResultHold."Document No.") then begin
                    CLEAR(SalesLine);
                    SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SETFILTER("Document No.", TempSalesOrderImportResultHold."Document No.");
                    IF not SalesLine.FINDLAST THEN BEGIN
                        SalesHeader.Delete();
                    END;

                end;
            until TempSalesOrderImportResultHold.Next() = 0;
        end;
        Window.CLOSE;
        f.CLOSE;
        MESSAGE(Text016);

    end;

    var
        FileName: Text[250];
        ServerFileName: Text[1024];
        f: File;
        Text001: TextConst ENU = 'Import from Zengin File', JPN = '受注データファイルインポート';
        Text002: TextConst ENU = 'Text Files (*.csv)|*.csv|All Files (*.*)|*.*', JPN = 'CSV ファイル (*.csv)|*.csv|全てのファイル (*.*)|*.*';
        Text003: TextConst ENU = 'Please input import file path.', JPN = 'インポートファイルパスを指定してください。';
        Text004: TextConst ENU = 'File not found or incoorect.', JPN = 'ファイルが見つからないか正しくありません。';
        Text005: TextConst ENU = 'File could not be opened !', JPN = 'ファイルがオープンできません！';
        Text011: TextConst ENU = '%1ing ...\', JPN = '%1実行中 ...\';
        Text012: TextConst ENU = 'File Name  #1##############################\', JPN = 'ファイル名   #1##############################\';
        Text013: TextConst ENU = 'Record     #2##############################\\', JPN = 'レコード     #2##############################\\';
        Text014: TextConst ENU = '@3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', JPN = '@3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        Text015: TextConst ENU = 'Import', JPN = 'インポート';
        Text016: TextConst ENU = 'The file was successfully uploaded to server.', JPN = 'インポート処理終了';
        RecTotal: Integer;
        RecCount: Integer;
        RecString: Text[1024];
        SubString: Text[250];
        RecLen: Integer;
        Delimiter: Text[5];
        Separator: Text[5];
        Window: Dialog;
        Customer: Record "Customer";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record "Item";
        SalesOrderImportResult: Record "Sales Order Import Result";
        TempSalesOrderImportResult: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResult_A: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResultHold_A: Record "Sales Order Import Result" temporary;
        TempSalesOrderImportResultHold: Record "Sales Order Import Result" temporary;
        ItemTrackingManagement: Codeunit "Item Tracking Management";
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
        Text017: TextConst ENU = 'Does not exist Customer master corresponding to the "Order Source Code".', JPN = '発注元事業所コードに対応する得意先マスタが存在しません。';
        Text018: TextConst ENU = 'Does not exist Item master corresponding to the  "Item Code".', JPN = '品目番号に対応する品目マスタが存在しません。';
        Text019: TextConst ENU = 'Entry No.', JPN = '受注番号';
        Text020: TextConst ENU = ': combination of "Item Code" and "Order Source Order No." is the same to this Entry Number.', JPN = 'に登録項目の組合せと重複したラインが既に存在します。';

        BatchNum: Integer;
        Text021: TextConst ENU = 'The first line of the import data can not be recognized as a label.\Please check whether there is an error in the item name of the label line.\"%1","%2","%3","%4"', JPN = 'インポートデータの1行目がラベルと認識できません。\ラベル行の項目名に誤りが無いか確認を行ってください。\"%1","%2","%3","%4"';

        ImportLineCount: Integer;
        Text022: TextConst ENU = 'Order Source Code', JPN = '得意先コード';
        Text023: TextConst ENU = 'Order Source Order No.', JPN = '販売店注文番号';
        Text024: TextConst ENU = 'Item Code', JPN = '品目番号';
        Text025: TextConst ENU = 'Quantity', JPN = '注文数';
        Text026: TextConst ENU = 'is not importing.', JPN = 'が入力されていません。';
        SubNum: Decimal;
        c: Integer;
        Text027: TextConst ENU = 'Quantity has not been entered in a continuous single-byte numerical value.', JPN = '数量が連続した半角数字で入力されていません。';

        gs_is: Integer;
        gs_imax: Integer;
        gs_del: Text[10];
        gs_sep: Text[10];
        StringPatch: Boolean;

    [Scope('Internal')]
    procedure SpecifiedTableProcessing()
    var
        SalesHeader_temp: Record "Sales Header" temporary;
        Quantity_A: integer;
        OverCheck: Boolean;
    begin
        Customer.SETFILTER("No.", OrderSourceCode);//customer
        IF Customer.FIND('-') THEN BEGIN
            CustomerNum := Customer."No.";
            Item.SETFILTER("No.", ItemCode);
            IF Item.FIND('-') THEN BEGIN
                CLEAR(SalesLine);
                SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SETRANGE("Sell-to Customer No.", CustomerNum);
                SalesLine.SETRANGE("No.", ItemCode);
                SalesLine.SETRANGE("ExternaDocumentNo.", OrderSourceOrderNum);
                IF NOT SalesLine.FIND('-') THEN BEGIN
                    SalesOrderImportResult.SETRANGE("Batch No.", BatchNum);
                    SalesOrderImportResult.SETRANGE(Status, SalesOrderImportResult.Status::Success);
                    SalesOrderImportResult.SETFILTER("Order Source Code", OrderSourceCode);
                    IF NOT SalesOrderImportResult.FIND('-') THEN BEGIN
                        //ここに既存在庫数チェック
                        Inventrycheck(Quantity, Quantity_A, OverCheck);

                        //元のロジック start
                        SalesHeader := SalesHeader_temp;
                        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                        CLEAR(SalesHeader."No.");
                        CLEAR(SalesHeader."Sell-to Customer No.");
                        CLEAR(SalesHeader."Bill-to Customer No.");
                        SalesHeader.INSERT(TRUE);
                        SalesHeader.InitRecord;
                        SalesHeader.VALIDATE("Sell-to Customer No.", CustomerNum);
                        SalesHeader.VALIDATE("External Document No.", SalesHeader."No.");
                        SalesHeader.MODIFY;
                        DocumentNum := SalesHeader."No.";
                        LineNum := 10000;
                        // SalesLineInsert;
                        // SalesLineModify;
                        //元のロジック End
                        if Quantity <> 0 then begin
                            SalesLineInsert(Quantity);
                            SalesLineModify(Quantity);
                        end Else Begin
                            TempSalesOrderImportResult.VALIDATE(Status, SalesOrderImportResult.Status::Success);
                            TempSalesOrderImportResult.VALIDATE("Document No.", DocumentNum);
                            TempSalesOrderImportResult.VALIDATE(Quantity, Format(Quantity));
                        End;
                        //新規ロジック Begin
                        if OverCheck then begin
                            SalesHeader := SalesHeader_temp;
                            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                            CLEAR(SalesHeader."No.");
                            CLEAR(SalesHeader."Sell-to Customer No.");
                            CLEAR(SalesHeader."Bill-to Customer No.");
                            SalesHeader.INSERT(TRUE);
                            SalesHeader.InitRecord;

                            SalesHeader.VALIDATE("Sell-to Customer No.", CustomerNum);
                            SalesHeader.VALIDATE("External Document No.", SalesHeader."No.");
                            SalesHeader.MODIFY;
                            DocumentNum := SalesHeader."No.";
                            LineNum := 10000;
                            SalesLineInsert_A(Quantity_A);
                            SalesLineModify_A(Quantity_A);
                        end;
                        //新規ロジック End
                    END ELSE BEGIN
                        //既存在庫数チェック
                        Inventrycheck(Quantity, Quantity_A, OverCheck);
                        DocumentNum := SalesOrderImportResult."Document No.";
                        if Quantity <> 0 then begin
                            CLEAR(SalesLine);
                            SalesLine.SETFILTER(SalesLine."Document No.", DocumentNum);
                            IF SalesLine.FIND('-') THEN BEGIN
                                IF SalesLine.FINDLAST THEN
                                    LineNum := SalesLine."Line No." + 10000;
                            END;
                            SalesLineInsert(Quantity);
                            SalesLineModify(Quantity);
                        end Else Begin
                            TempSalesOrderImportResult.VALIDATE(Status, SalesOrderImportResult.Status::Success);
                            TempSalesOrderImportResult.VALIDATE("Document No.", DocumentNum);
                            TempSalesOrderImportResult.VALIDATE(Quantity, Format(Quantity));

                        End;

                        //新規ロジック Begin
                        if OverCheck then begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                            SalesHeader.SetRange("No.", TempSalesOrderImportResultHold_A."Document No.");
                            if ((not SalesHeader.FindFirst()) AND ((DocumentNum < TempSalesOrderImportResultHold_A."Document No.") OR (TempSalesOrderImportResultHold_A."Document No." = ''))) then begin
                                SalesHeader := SalesHeader_temp;
                                SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                                CLEAR(SalesHeader."No.");
                                CLEAR(SalesHeader."Sell-to Customer No.");
                                CLEAR(SalesHeader."Bill-to Customer No.");
                                SalesHeader.INSERT(TRUE);
                                SalesHeader.InitRecord;

                                SalesHeader.VALIDATE("Sell-to Customer No.", CustomerNum);
                                SalesHeader.VALIDATE("External Document No.", SalesHeader."No.");
                                SalesHeader.MODIFY;
                                DocumentNum := SalesHeader."No.";
                                LineNum := 10000;
                            end ELSE begin
                                CLEAR(SalesLine);
                                DocumentNum := TempSalesOrderImportResultHold_A."Document No.";
                                SalesLine.SETFILTER(SalesLine."Document No.", DocumentNum);
                                IF SalesLine.FIND('-') THEN BEGIN
                                    IF SalesLine.FINDLAST THEN
                                        LineNum := SalesLine."Line No." + 10000;
                                END;
                            END;
                            SalesLineInsert_A(Quantity_A);
                            SalesLineModify_A(Quantity_A);
                        end;
                        //新規ロジック End
                    END;
                END ELSE BEGIN
                    DocumentNum := SalesLine."Document No.";
                    TempSalesOrderImportResult."Error Comment" := Text019 + DocumentNum + Text020;
                END;
            END ELSE
                TempSalesOrderImportResult."Error Comment" := Text018;
        END ELSE
            TempSalesOrderImportResult."Error Comment" := Text017;
    end;

    [Scope('Internal')]
    procedure SalesLineInsert(var QuantityOrigin: integer)
    begin
        SalesLine."Document Type" := SalesLine."Document Type"::Order;
        SalesLine."Document No." := DocumentNum;
        SalesLine."Line No." := LineNum;
        SalesLine.Type := SalesLine.Type::Item;
        SalesLine."Quantity (Base)" := QuantityOrigin;
        SalesLine.INSERT(TRUE);
    end;

    [Scope('Internal')]
    procedure SalesLineModify(var QuantityOrigin: integer)
    var
        CEItemTrackMgt: Codeunit "Conside Ext. Item Track Mgt.";
    begin
        SalesLine.VALIDATE("No.", ItemCode);
        SalesLine.VALIDATE(Quantity, QuantityOrigin);
        SalesLine.VALIDATE("ExternaDocumentNo.", OrderSourceOrderNum);
        SalesLine.MODIFY;
        CEItemTrackMgt.ImportProcessingFlag; 
        CEItemTrackMgt.AssistEditLotSerialNo(SalesLine, SalesLine.Quantity - SalesLine."Quantity Shipped");
        TempSalesOrderImportResult.VALIDATE(Status, SalesOrderImportResult.Status::Success);
        TempSalesOrderImportResult.VALIDATE("Document No.", DocumentNum);
        TempSalesOrderImportResult.VALIDATE("Line No.", SalesLine."Line No.");
        TempSalesOrderImportResult.VALIDATE(Quantity, Format(QuantityOrigin));
    end;

    [Scope('Internal')]
    procedure SalesLineInsert_A(var Quantity_A: integer)
    begin
        SalesLine."Document Type" := SalesLine."Document Type"::Order;
        SalesLine."Document No." := DocumentNum;
        SalesLine."Line No." := LineNum;
        SalesLine.Type := SalesLine.Type::Item;
        SalesLine."Quantity (Base)" := Quantity_A;
        SalesLine.INSERT(TRUE);
    end;

    [Scope('Internal')]
    procedure SalesLineModify_A(var Quantity_A: integer)
    var
        CEItemTrackMgt: Codeunit "Conside Ext. Item Track Mgt.";
    begin
        SalesLine.VALIDATE("No.", ItemCode);
        SalesLine.VALIDATE(Quantity, Quantity_A);
        SalesLine.VALIDATE("ExternaDocumentNo.", OrderSourceOrderNum);
        SalesLine.MODIFY;
        // CEItemTrackMgt.ImportProcessingFlag; 
        // CEItemTrackMgt.AssistEditLotSerialNo(SalesLine, SalesLine.Quantity - SalesLine."Quantity Shipped");
        TempSalesOrderImportResult_A.Init();
        TempSalesOrderImportResult_A.Copy(TempSalesOrderImportResult);
        TempSalesOrderImportResult_A.VALIDATE(Status, SalesOrderImportResult.Status::Success);
        TempSalesOrderImportResult_A.VALIDATE("Document No.", DocumentNum);
        TempSalesOrderImportResult_A.VALIDATE("Line No.", SalesLine."Line No.");
        TempSalesOrderImportResult_A.VALIDATE(Quantity, Format(Quantity_A));
    end;

    [Scope('Internal')]
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
        Item_Check.SetRange("Location Filter", '1000');//場所コード　通常

        IF Item_Check.FindFirst() THEN BEGIN
            Item_Check.CalcFields(Item_Check.Inventory, Item_Check."Qty. on Sales Order");
            InventoryCheckQty := Item_Check.Inventory - Item_Check."Qty. on Sales Order"//残数 

        END;
        if InventoryCheckQty < 0 THEN BEGIN
            InventoryCheckQty := 0
        END;
        if retQuantity_origin < 0 THEN BEGIN
            retQuantity_origin := 0
        END;
        // 在庫数<数量分
        if InventoryCheckQty < retQuantity_origin THEN BEGIN
            retQuantity_A := retQuantity_origin - InventoryCheckQty;
            retQuantity_origin := InventoryCheckQty;
            overCheck := true;
        END;


    end;

    [Scope('Internal')]
    procedure LabelError()
    begin
        ERROR(Text021, Text022, Text023, Text024, Text025);
    end;



    PROCEDURE InitSubString(String: Text[1024]; Delimiter: Code[10]; Separator: Code[10]);
    var
    // gs_is: Integer;
    // gs_imax: Integer;
    // gs_del: Text[10];
    // gs_sep: Text[10];
    // StringPatch: Boolean;
    BEGIN
        StringPatch := NeedStringPatch;  //PBCJP04.02

        gs_is := 1;

        //PBCJP04.02: BEGIN
        IF StringPatch THEN
            gs_imax := f_STRLEN(String)
        ELSE
            gs_imax := STRLEN(String);
        gs_del := '';
        gs_sep := '';
        CASE Delimiter OF
            '<TAB>':
                gs_del[1] := 9;
            '<CR>':
                gs_del[1] := 13;
            '<LF>':
                gs_del[1] := 10;
            '<CR/LF>':
                BEGIN
                    gs_del[1] := 13;
                    gs_del[2] := 10;
                END;
            ELSE
                gs_del := Delimiter;
        END;
        CASE Separator OF
            '<TAB>':
                gs_sep[1] := 9;
            '<CR>':
                gs_sep[1] := 13;
            '<LF>':
                gs_sep[1] := 10;
            '<CR/LF>':
                BEGIN
                    gs_sep[1] := 13;
                    gs_sep[2] := 10;
                END;
            ELSE
                gs_sep := Separator;
        END;
        //gs_imax := STRLEN(String);
        //gs_del := Delimiter;
        //gs_sep := Separator;
        //PBCJP04.02: END
    END;

    PROCEDURE NeedStringPatch(): Boolean;
    VAR
        String: Text[30];
    BEGIN
        //PBCJP04.02: BEGIN
        String := '漢字';
        EXIT(STRLEN(String) = 2);
        //PBCJP04.02: END
    END;

    PROCEDURE f_STRLEN(String: Text[1024]) Len: Integer;
    VAR
        ip: Integer;
        found: Boolean;
    BEGIN
        //PBCJP04.02: BEGIN
        Len := 0;
        ip := 0;
        found := FALSE;
        REPEAT
            Len += 1;
            ip += 1;
            IF String[ip] = 0 THEN
                found := TRUE;
            IF IsKanjiFirstByte(String[ip]) THEN
                Len += 1;
        UNTIL found OR (Len >= 1024);
        IF (Len = 1024) AND (NOT found) THEN
            EXIT(Len)
        ELSE
            EXIT(Len - 1);
        //PBCJP04.02: END
    END;


    PROCEDURE IsKanjiFirstByte(Cod: Char): Boolean;
    BEGIN
        EXIT(((Cod >= 129) AND (Cod <= 159)) OR ((Cod >= 224) AND (Cod <= 252)));
    END;

    PROCEDURE GetSubString(String: Text[1024]) SubString: Text[250];
    VAR
        ip: Integer;
        is: Integer;
        FieldEnd: Boolean;

    BEGIN
        IF gs_imax = 0 THEN
            EXIT('');
        IF String[gs_is] = gs_del[1] THEN BEGIN
            gs_is += 1;
            ip := 1;
            is := 1;
            FieldEnd := FALSE;
            REPEAT
                CASE String[gs_is] OF
                    0:
                        FieldEnd := TRUE;
                    gs_del[1]:
                        CASE String[gs_is + 1] OF
                            0:
                                FieldEnd := TRUE;
                            gs_del[1]:
                                BEGIN
                                    SubString[is] := gs_del[1];
                                    is += 1;
                                    ip += 2;
                                    gs_is += 2;
                                END;
                            gs_sep[1]:
                                BEGIN
                                    ip += 1;
                                    gs_is += 2;
                                    FieldEnd := TRUE;
                                END;
                        END;
                    ELSE BEGIN

                        SubString += COPYSTR(String, gs_is, 1);  //PBCJP04.02
                                                                 // SubString[is] := String[gs_is];        //PBCJP04.02

                        is += 1;
                        ip += 1;
                        gs_is += 1;
                    END
                END;
            UNTIL FieldEnd;
            gs_imax := gs_imax - ip;
        END ELSE BEGIN

            //PBCJP04.02: BEGIN
            IF StringPatch THEN
                ip := f_STRPOS(f_COPYSTR3(String, gs_is, gs_imax), gs_sep)
            ELSE
                ip := STRPOS(COPYSTR(String, gs_is, gs_imax), gs_sep);
            //ip := STRPOS(COPYSTR(String,gs_is,gs_imax),gs_sep);
            //PBCJP04.02: END

            IF ip = 0 THEN BEGIN

                //PBCJP04.02: BEGIN
                IF StringPatch THEN
                    SubString := f_COPYSTR3(String, gs_is, gs_imax)
                ELSE
                    SubString := COPYSTR(String, gs_is, gs_imax);
                //SubString := COPYSTR(String,gs_is,gs_imax);
                //PBCJP04.02: END

                gs_imax := 0;
            END ELSE BEGIN

                //PBCJP04.02: BEGIN
                IF StringPatch THEN

                    //PBCJP04.02.001: BEGIN
                    IF ip <> 1 THEN
                        SubString := f_COPYSTR3(String, gs_is, ip - 1)
                    ELSE
                        SubString := ''
                //SubString := DBCSFunc.f_COPYSTR3(String,gs_is,ip - 1)
                //PBCJP04.02.001: END

                ELSE
                    SubString := COPYSTR(String, gs_is, ip - 1);
                //SubString := COPYSTR(String,gs_is,ip - 1);
                //PBCJP04.02: END

                gs_is := gs_is + ip;
                gs_imax := gs_imax - ip;
            END;
        END;
    END;


    PROCEDURE f_COPYSTR3(String: Text[1024]; Position: Integer; Length: Integer) NewString: Text[1024];
    VAR
        len: Integer;
        epos: Integer;
        ip: Integer;
        ip_b: Integer;
    BEGIN
        //PBCJP04.02: BEGIN
        IF (Position < 1) OR (Length < 0) THEN
            NewString := COPYSTR(String, Position, Length);
        NewString := '';
        len := f_STRLEN(String);
        IF Length = 0 THEN
            epos := len
        ELSE
            epos := Position + Length - 1;
        IF epos > len THEN
            epos := len;
        ip := 0;
        ip_b := 0;
        REPEAT
            ip += 1;
            ip_b += 1;
            IF ip_b >= Position THEN
                NewString := NewString + COPYSTR(String, ip, 1);
            IF IsKanjiFirstByte(String[ip]) THEN
                ip_b += 1;
        UNTIL ip_b >= epos;
        //PBCJP04.02: END
    END;

    PROCEDURE f_STRPOS(String: Text[1024]; SubString: Text[30]) Pos: Integer;
    VAR
        mlen: Integer;
        slen: Integer;
        ip: Integer;
        ip_b: Integer;
        m_ip: Integer;
        s_ip: Integer;
        s_ip_b: Integer;
    BEGIN
        //PBCJP04.02: BEGIN
        IF (String = '') OR (SubString = '') THEN
            EXIT(0);
        mlen := f_STRLEN(String);
        slen := f_STRLEN(SubString);
        IF mlen < slen THEN
            EXIT(0);
        ip := 0;
        ip_b := 0;
        Pos := 0;
        REPEAT
            ip += 1;
            ip_b += 1;
            IF String[ip] = SubString[1] THEN BEGIN
                IF (mlen - ip_b + 1 < slen) THEN
                    EXIT(0);
                Pos := ip_b;
                m_ip := ip;
                s_ip := 0;
                s_ip_b := 0;
                REPEAT
                    s_ip += 1;
                    s_ip_b += 1;
                    IF String[m_ip] <> SubString[s_ip] THEN
                        Pos := 0;
                    m_ip += 1;
                    IF IsKanjiFirstByte(SubString[s_ip]) THEN
                        s_ip_b += 1;
                UNTIL (Pos = 0) OR (s_ip_b >= slen);
            END;
            IF IsKanjiFirstByte(String[ip]) THEN
                ip_b += 1;
        UNTIL (Pos <> 0) OR (ip_b >= 1024);
        EXIT(Pos);
        //PBCJP04.02: END
    END;
}

 */