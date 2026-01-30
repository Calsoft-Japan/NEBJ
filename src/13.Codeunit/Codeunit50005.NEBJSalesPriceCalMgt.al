codeunit 50005 "NEBJ Sales Price Cal. Mgt."
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price List Management", 'OnAfterSetAssetFilters', '', true, true)]
    local procedure OnAfterSetAssetFilters(var DuplicatePriceListLine: Record "Price List Line"; PriceListLine: Record "Price List Line")
    begin
        DuplicatePriceListLine.SetRange(EndUser, PriceListLine.EndUser);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterFillBuffer', '', true, true)]
    local procedure NEBJOnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer" temporary; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    var
        Item: Record Item;
    begin
        PriceCalculationBuffer."NEBJ Customer No." := SalesHeader."Bill-to Customer No.";
        PriceCalculationBuffer."NEBJ Contact No." := SalesHeader."Bill-to Contact";
        PriceCalculationBuffer."NEBJ Cust. Disc. Grp." := SalesHeader."Customer Disc. Group";
        PriceCalculationBuffer."NEBJ EndUser" := SalesLine.EndUser;
        PriceCalculationBuffer."NEBJ Item No." := SalesLine."No.";
        if Item.Get(SalesLine."No.") then;
        PriceCalculationBuffer."NEBJ Item Disc. Grp2" := Item."Item Disc. Group 2";
        PriceCalculationBuffer."NEBJ Item Disc. Grp3" := Item."Item Disc. Group 3";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnAfterFindLines', '', true, true)]
    procedure NEBJFindSalesLineDisc(var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.";
                                        var TempPriceListLine: Record "Price List Line" temporary;
                                        AmountType: Enum "Price Amount Type"; ShowAll: Boolean; var FoundLines: Boolean)
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        CustNo: Code[20];
        ContNo: Code[20];
        ItemNo: Code[20];
        VarCode: Code[20];
        UoMCode: Code[20];
        EndUser: Code[20];
        CompaignNo: Code[20];
        CustDiscGrp: Code[20];
        ItemDisGrp: Code[20];
        ItemDisGrp2: Code[20];
        ItemDisGrp3: Code[20];
        StartDate: Date;
        InclCampain: Boolean;
        Cnt2: Integer;
        Cnt3: Integer;
        Cnt4: Integer;
    begin
        if TempPriceListLine.FindSet() then
            repeat
                Message('%1', TempPriceListLine."Line Discount %");
            until TempPriceListLine.Next() = 0;

        PriceCalculationBufferMgt.GetBuffer(PriceCalcBuff);
        ItemNo := PriceCalcBuff."NEBJ Item No.";
        EndUser := PriceCalcBuff."NEBJ EndUser";
        CustNo := PriceCalcBuff."NEBJ Customer No.";
        ContNo := PriceCalcBuff."NEBJ Contact No.";
        CustDiscGrp := PriceCalcBuff."NEBJ Cust. Disc. Grp.";
        ItemDisGrp := PriceCalcBuff."Item Disc. Group";
        ItemDisGrp2 := PriceCalcBuff."NEBJ Item Disc. Grp2";
        ItemDisGrp3 := PriceCalcBuff."NEBJ Item Disc. Grp3";
        CompaignNo := '';

        FromPriceList.SetFilter("Ending Date", '%1|>=%2', 0D, PriceCalcBuff."Document Date");
        FromPriceList.SetFilter("Variant Code", '%1|%2', PriceCalcBuff."Variant Code", '');
        if not ShowAll then begin
            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
            FromPriceList.SetFilter("Currency Code", '%1|%2', PriceCalcBuff."Currency Code", '');
            if PriceCalcBuff."Unit of Measure Code" <> '' then
                FromPriceList.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuff."Unit of Measure Code", '');
        end;
        TempPriceListLine.Reset();
        TempPriceListLine.DeleteAll();
        for FromPriceList."Source Type" := FromPriceList."Source Type"::"All Customers" to FromPriceList."Source Type"::Campaign do
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = ''))) then begin
                if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") then
                    continue;
                InclCampain := false;
                FromPriceList.SetRange("Source Type", FromPriceList."Source Type");
                case FromPriceList."Source Type" of
                    FromPriceList."Source Type"::"All Customers":
                        FromPriceList.SetRange("Assign-to No.");
                    FromPriceList."Source Type"::Customer:
                        FromPriceList.SetRange("Assign-to No.", CustNo);
                    FromPriceList."Source Type"::"Customer Disc. Group":
                        FromPriceList.SetRange("Assign-to No.", CustDiscGrp);
                    FromPriceList."Source Type"::Campaign:
                        FromPriceList.SetRange("Assign-to No.", CompaignNo);
                end;
                repeat
                    FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
                    FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                    if not ShowAll then begin
                        FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
                        if FromPriceList.Count = 0 then
                            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
                    end;
                    CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);

                    if ItemDisGrp <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if ItemDisGrp2 <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 2");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp2);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if ItemDisGrp3 <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 3");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp3);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if Item.Get(ItemNo) then;
                    if not Item."Disable All Item DisCount" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"All Items");
                        FromPriceList.SetRange("Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;
                until not InclCampain;
            end;

        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        //
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group");
        FromPriceList.SetRange("Asset No.", ItemDisGrp);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;

        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group 2");
        FromPriceList.SetRange("Asset No.", ItemDisGrp2);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group 3");
        FromPriceList.SetRange("Asset No.", ItemDisGrp3);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        //

        Cnt3 := FromPriceList.Count;
        Cnt4 := TempPriceListLine.Count;

        /* if TempPriceListLine.Count > 1 then begin
            TempPriceListLine.SetCurrentKey("Line Discount %");
            TempPriceListLine.SetRange("Line Discount %");
            TempPriceListLine.FindLast();
        end; */

        TempPriceListLine.SetRange(EndUser, EndUser);
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            else
                TempPriceListLine.SetRange(EndUser, '');
    end;

    /* local procedure ProcessSourceType(SourceType: Enum "NEBJ Price Source Type")
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        CustNo: Code[20];
        ContNo: Code[20];
        ItemNo: Code[20];
        VarCode: Code[20];
        UoMCode: Code[20];
        EndUser: Code[20];
        CompaignNo: Code[20];
        CustDiscGrp: Code[20];
        ItemDisGrp: Code[20];
        ItemDisGrp2: Code[20];
        ItemDisGrp3: Code[20];
        StartDate: Date;
        InclCampain: Boolean;
        Cnt2: Integer;
        Cnt3: Integer;
        Cnt4: Integer;
    begin
        if not ((SourceType = FromPriceList."Source Type"::"All Customers") or
            ((SourceType = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
            ((SourceType = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
            ((SourceType = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = '')))) then
            exit;

        InclCampain := false;

        FromPriceList.SetRange("Source Type", FromPriceList."Source Type");

        case FromPriceList."Source Type" of
            FromPriceList."Source Type"::"All Customers":
                FromPriceList.SetRange("Assign-to No.");
            FromPriceList."Source Type"::Customer:
                FromPriceList.SetRange("Assign-to No.", CustNo);
            FromPriceList."Source Type"::"Customer Disc. Group":
                FromPriceList.SetRange("Assign-to No.", CustDiscGrp);
            FromPriceList."Source Type"::Campaign:
                FromPriceList.SetRange("Assign-to No.", CompaignNo);
        end;

        repeat
        // your logic here
        until not InclCampain;
    end; */

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnAfterFindLines', '', true, true)]
    procedure NEBJFindSalesLineDisc(var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.";
                                    var TempPriceListLine: Record "Price List Line" temporary;
                                    AmountType: Enum "Price Amount Type"; ShowAll: Boolean; var FoundLines: Boolean)
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        CustNo: Code[20];
        ContNo: Code[20];
        ItemNo: Code[20];
        VarCode: Code[20];
        UoMCode: Code[20];
        EndUser: Code[20];
        CompaignNo: Code[20];
        CustDiscGrp: Code[20];
        ItemDisGrp: Code[20];
        ItemDisGrp2: Code[20];
        ItemDisGrp3: Code[20];
        StartDate: Date;
        InclCampain: Boolean;
        Cnt2: Integer;
        Cnt3: Integer;
        Cnt4: Integer;
    begin
        PriceCalculationBufferMgt.GetBuffer(PriceCalcBuff);
        ItemNo := PriceCalcBuff."NEBJ Item No.";
        EndUser := PriceCalcBuff."NEBJ EndUser";
        CustNo := PriceCalcBuff."NEBJ Customer No.";
        ContNo := PriceCalcBuff."NEBJ Contact No.";
        CustDiscGrp := PriceCalcBuff."NEBJ Cust. Disc. Grp.";
        ItemDisGrp := PriceCalcBuff."Item Disc. Group";
        ItemDisGrp2 := PriceCalcBuff."NEBJ Item Disc. Grp2";
        ItemDisGrp3 := PriceCalcBuff."NEBJ Item Disc. Grp3";
        CompaignNo := '';

        FromPriceList.SetFilter("Ending Date", '%1|>=%2', 0D, PriceCalcBuff."Document Date");
        FromPriceList.SetFilter("Variant Code", '%1|%2', PriceCalcBuff."Variant Code", '');
        if not ShowAll then begin
            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
            FromPriceList.SetFilter("Currency Code", '%1|%2', PriceCalcBuff."Currency Code", '');
            if PriceCalcBuff."Unit of Measure Code" <> '' then
                FromPriceList.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuff."Unit of Measure Code", '');
        end;
        TempPriceListLine.Reset();
        TempPriceListLine.DeleteAll();
        for FromPriceList."Source Type" := FromPriceList."Source Type"::"All Customers" to FromPriceList."Source Type"::Campaign do
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = ''))) then begin
                if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") then
                    continue;
                InclCampain := false;
                FromPriceList.SetRange("Source Type", FromPriceList."Source Type");
                case FromPriceList."Source Type" of
                    FromPriceList."Source Type"::"All Customers":
                        FromPriceList.SetRange("Assign-to No.");
                    FromPriceList."Source Type"::Customer:
                        FromPriceList.SetRange("Assign-to No.", CustNo);
                    FromPriceList."Source Type"::"Customer Disc. Group":
                        FromPriceList.SetRange("Assign-to No.", CustDiscGrp);
                    FromPriceList."Source Type"::Campaign:
                        FromPriceList.SetRange("Assign-to No.", CompaignNo);
                end;
                repeat
                    FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
                    FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                    if not ShowAll then begin
                        FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
                        if FromPriceList.Count = 0 then
                            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
                    end;
                    CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);

                    if ItemDisGrp <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if ItemDisGrp2 <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 2");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp2);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if ItemDisGrp3 <> '' then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 3");
                        FromPriceList.SetRange("Asset No.", ItemDisGrp3);
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if Item.Get(ItemNo) then;
                    if not Item."Disable All Item DisCount" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"All Items");
                        FromPriceList.SetRange("Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;
                until not InclCampain;
            end;

        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        //
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group");
        FromPriceList.SetRange("Asset No.", ItemDisGrp);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;

        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group 2");
        FromPriceList.SetRange("Asset No.", ItemDisGrp2);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item Discount Group 3");
        FromPriceList.SetRange("Asset No.", ItemDisGrp3);
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
        //

        Cnt3 := FromPriceList.Count;
        Cnt4 := TempPriceListLine.Count;

        if TempPriceListLine.Count > 1 then begin
            TempPriceListLine.SetCurrentKey("Line Discount %");
            TempPriceListLine.SetRange("Line Discount %");
            TempPriceListLine.FindLast();
        end;

        TempPriceListLine.SetRange(EndUser, EndUser);
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            else
                TempPriceListLine.SetRange(EndUser, '');
    end; */

    local procedure CopySalesDiscToSalesLine(var FromPriceList: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromPriceList.FindSet() then
            repeat
                TempPriceListLine := FromPriceList;
                TempPriceListLine.Insert();
            until FromPriceList.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', EndUser, true, true)]
    local procedure SalesLineEndUserOnValidate(var Rec: Record "Sales Line")
    var
        PriceCalculation: Interface "Price Calculation";
    begin
        Rec.UpdateUnitPriceByField(0);
    end;

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterFillBuffer', '', true, true)]
    local procedure NEBJOnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer" temporary; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    begin
        PriceCalculationBuffer."NEBJ Customer No." := SalesHeader."Bill-to Customer No.";
        PriceCalculationBuffer."NEBJ Contact No." := SalesHeader."Bill-to Contact";
        PriceCalculationBuffer."NEBJ Cust. Disc. Grp." := SalesHeader."Customer Disc. Group";
        PriceCalculationBuffer."NEBJ EndUser" := SalesLine.EndUser;
        PriceCalculationBuffer."NEBJ Item No." := SalesLine."No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Asset - Item", 'OnAfterFillBestLine', '', true, true)]
    procedure NEBJFindSalesLineDisc(var PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type";
                                    PriceCalculationBuffer: Record "Price Calculation Buffer" temporary)
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        CustNo: Code[20];
        ContNo: Code[20];
        ItemNo: Code[20];
        VarCode: Code[20];
        UoMCode: Code[20];
        EndUser: Code[20];
        CompaignNo: Code[20];
        CustDiscGrp: Code[20];
        ItemDisGrp: Code[20];
        ItemDisGrp2: Code[20];
        ItemDisGrp3: Code[20];
        StartDate: Date;
        InclCampain: Boolean;
        ShowAll: Boolean;
        Cnt1: Integer;
        Cnt2: Integer;
        Cnt3: Integer;
        Cnt4: Integer;
    begin
        //if AmountType = AmountType::Discount then begin
        PriceCalcBuff := PriceCalculationBuffer;
        ItemNo := PriceCalcBuff."NEBJ Item No.";
        EndUser := PriceCalcBuff."NEBJ EndUser";
        CustNo := PriceCalcBuff."NEBJ Customer No.";
        ContNo := PriceCalcBuff."NEBJ Contact No.";
        CustDiscGrp := PriceCalcBuff."NEBJ Cust. Disc. Grp.";
        CompaignNo := '';
        ShowAll := false;

        FromPriceList.SetFilter("Ending Date", '%1|>=%2', 0D, PriceCalcBuff."Document Date");
        FromPriceList.SetFilter("Variant Code", '%1|%2', PriceCalcBuff."Variant Code", '');
        if not ShowAll then begin
            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
            FromPriceList.SetFilter("Currency Code", '%1|%2', PriceCalcBuff."Currency Code", '');
            if PriceCalcBuff."Unit of Measure Code" <> '' then
                FromPriceList.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuff."Unit of Measure Code", '');
        end;
        PriceListLine.Reset();
        PriceListLine.DeleteAll();
        for FromPriceList."Source Type" := FromPriceList."Source Type"::"All Customers" to FromPriceList."Source Type"::Campaign do
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = ''))) then begin
                if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") then
                    continue;
                InclCampain := false;
                FromPriceList.SetRange("Source Type", FromPriceList."Source Type");
                case FromPriceList."Source Type" of
                    FromPriceList."Source Type"::"All Customers":
                        FromPriceList.SetRange("Assign-to No.");
                    FromPriceList."Source Type"::Customer:
                        FromPriceList.SetRange("Assign-to No.", CustNo);
                    FromPriceList."Source Type"::"Customer Disc. Group":
                        FromPriceList.SetRange("Assign-to No.", CustDiscGrp);
                    FromPriceList."Source Type"::Campaign:
                        FromPriceList.SetRange("Assign-to No.", CompaignNo);
                end;
                repeat
                    FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
                    FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                    if not ShowAll then begin
                        FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
                        if FromPriceList.Count = 0 then
                            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
                    end;
                    CopySalesDiscToSalesLine(FromPriceList, PriceListLine);

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, PriceListLine);
                    end;

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group 2" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 2");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, PriceListLine);
                    end;

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group 3" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 3");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, PriceListLine);
                    end;

                    if Item.Get(ItemNo) then;
                    if not Item."Disable All Item DisCount" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::" ");
                        FromPriceList.SetRange("Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, PriceListLine);
                    end;
                until not InclCampain;
            end;

        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, PriceListLine);

        PriceListLine.SetRange(EndUser, EndUser);
        if PriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                PriceListLine.SetRange(EndUser)
            else
                PriceListLine.SetRange(EndUser, '');

        Cnt3 := FromPriceList.Count;
        Cnt4 := PriceListLine.Count;
    end;
    //end;

    local procedure CopySalesDiscToSalesLine(var FromPriceList: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromPriceList.FindSet() then
            repeat
                TempPriceListLine := FromPriceList;
                TempPriceListLine.Insert();
            until FromPriceList.Next() = 0;
    end; */

    /* //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnApplyDisCountOnBeforeFillBestLine', '', true, true)]
    //procedure NEBJFindSalesLineDisc(var TempPriceListLine: Record "Price List Line" temporary; var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.")
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Asset - Item", 'OnAfterFillBestLine', '', true, true)]
    procedure NEBJFindSalesLineDisc(var PriceListLine: Record "Price List Line"; PriceCalculationBuffer: Record "Price Calculation Buffer" temporary)
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        CustNo: Code[20];
        ContNo: Code[20];
        ItemNo: Code[20];
        VarCode: Code[20];
        UoMCode: Code[20];
        EndUser: Code[20];
        CompaignNo: Code[20];
        CustDiscGrp: Code[20];
        ItemDisGrp: Code[20];
        ItemDisGrp2: Code[20];
        ItemDisGrp3: Code[20];
        StartDate: Date;
        InclCampain: Boolean;
        ShowAll: Boolean;
        Cnt1: Integer;
        Cnt2: Integer;
        Cnt3: Integer;
        Cnt4: Integer;
    begin
        //PriceCalculationBufferMgt.GetBuffer(PriceCalcBuff);
        //Cnt1 := FromPriceList.Count;
        //Cnt2 := TempPriceListLine.Count;
        PriceCalcBuff := PriceCalculationBuffer;
        ItemNo := PriceCalcBuff."NEBJ Item No.";
        EndUser := PriceCalcBuff."NEBJ EndUser";
        CustNo := PriceCalcBuff."NEBJ Customer No.";
        ContNo := PriceCalcBuff."NEBJ Contact No.";
        CustDiscGrp := PriceCalcBuff."NEBJ Cust. Disc. Grp.";
        CompaignNo := '';
        ShowAll := false;

        FromPriceList.SetFilter("Ending Date", '%1|>=%2', 0D, PriceCalcBuff."Document Date");
        FromPriceList.SetFilter("Variant Code", '%1|%2', PriceCalcBuff."Variant Code", '');
        if not ShowAll then begin
            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
            FromPriceList.SetFilter("Currency Code", '%1|%2', PriceCalcBuff."Currency Code", '');
            if PriceCalcBuff."Unit of Measure Code" <> '' then
                FromPriceList.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuff."Unit of Measure Code", '');
        end;
        TempPriceListLine.Reset();
        TempPriceListLine.DeleteAll();
        for FromPriceList."Source Type" := FromPriceList."Source Type"::"All Customers" to FromPriceList."Source Type"::Campaign do
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = ''))) then begin
                if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") then
                    continue;
                InclCampain := false;
                FromPriceList.SetRange("Source Type", FromPriceList."Source Type");
                case FromPriceList."Source Type" of
                    FromPriceList."Source Type"::"All Customers":
                        FromPriceList.SetRange("Assign-to No.");
                    FromPriceList."Source Type"::Customer:
                        FromPriceList.SetRange("Assign-to No.", CustNo);
                    FromPriceList."Source Type"::"Customer Disc. Group":
                        FromPriceList.SetRange("Assign-to No.", CustDiscGrp);
                    FromPriceList."Source Type"::Campaign:
                        FromPriceList.SetRange("Assign-to No.", CompaignNo);
                end;
                repeat
                    FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
                    FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                    if not ShowAll then begin
                        FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
                        if FromPriceList.Count = 0 then
                            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
                    end;
                    CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group 2" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 2");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if PriceCalcBuff."Asset Type" = PriceCalcBuff."Asset Type"::"Item DisCount Group 3" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"Item DisCount Group 3");
                        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;

                    if Item.Get(ItemNo) then;
                    if not Item."Disable All Item DisCount" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::" ");
                        FromPriceList.SetRange("Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;
                until not InclCampain;
            end;

        FromPriceList.SetRange("Source Type", FromPriceList."Source Type"::"All Customers");
        FromPriceList.SetRange("Assign-to No.");
        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::Item);
        FromPriceList.SetRange("Asset No.", PriceCalcBuff."Asset No.");
        if not ShowAll then begin
            FromPriceList.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuff."Document Date");
            if FromPriceList.Count = 0 then
                FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
        end;
        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);

        TempPriceListLine.SetRange(EndUser, EndUser);
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            else
                TempPriceListLine.SetRange(EndUser, '');

        Cnt3 := FromPriceList.Count;
        Cnt4 := TempPriceListLine.Count;
    end; 

    local procedure CopySalesDiscToSalesLine(var FromPriceList: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromPriceList.FindSet() then
            repeat
                TempPriceListLine := FromPriceList;
                TempPriceListLine.Insert();
            until FromPriceList.Next() = 0;
    end;*/

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnFindSalesLineLineDiscOnBeforeCalcLineDisc', '', true, true)]
    procedure UpdateAfterUoMandQty(Qty: Decimal; QtyPerUOM: Decimal; var TempSalesLineDisCount: Record "Sales Line DisCount" temporary; var IsHandled: Boolean)
    begin
        QtyValue := Qty;
        QtyPerUOMValue := QtyPerUOM;
        NEBJCalcBestLineDisc(TempSalesLineDisCount);
        IsHandled := true;
    end;

    local procedure NEBJCalcBestLineDisc(var SalesLineDisc: Record "Sales Line DisCount")
    var
        BestSalesLineDisc: Record "Sales Line DisCount";
        BestSalesLineDisc2: Record "Sales Line DisCount";
        Cnt: Integer;
    begin
        Cnt := 0;
        SalesLineDisc.SetFilter("Starting Date", '<>%1', 0D);
        if SalesLineDisc.Count = 0 then
            SalesLineDisc.SetRange("Starting Date");
        if SalesLineDisc.FindSet() then
            repeat
                if IsInMinQty(SalesLineDisc."Unit of Measure Code", SalesLineDisc."Minimum Quantity") then
                    case true of
                        ((BestSalesLineDisc."Currency Code" = '') and (SalesLineDisc."Currency Code" <> '')) or
                        ((BestSalesLineDisc."Variant Code" = '') and (SalesLineDisc."Variant Code" <> '')):
                            BestSalesLineDisc := SalesLineDisc;
                        ((BestSalesLineDisc."Currency Code" = '') or (SalesLineDisc."Currency Code" <> '')) and
                        ((BestSalesLineDisc."Variant Code" = '') or (SalesLineDisc."Variant Code" <> '')):
                            if BestSalesLineDisc."Line DisCount %" < SalesLineDisc."Line DisCount %" then
                                BestSalesLineDisc := SalesLineDisc;
                    end;
                Cnt := Cnt + 1;
            until SalesLineDisc.Next()() = 0;
        SalesLineDisc := BestSalesLineDisc;
    end;

    local procedure IsInMinQty(UoMCode: code[10]; MinQty: Decimal): Boolean
    begin
        if UoMCode = '' then
            exit(MinQty <= QtyPerUOMValue * QtyValue);
        exit(MinQty <= QtyValue);
    end; */
    var
        QtyValue: Decimal;
        QtyPerUOMValue: Decimal;
}