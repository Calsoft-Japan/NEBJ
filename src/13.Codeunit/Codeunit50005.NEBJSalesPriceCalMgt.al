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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', EndUser, true, true)]
    local procedure SalesLineEndUserOnValidate(var Rec: Record "Sales Line")
    var
        PriceCalculation: Interface "Price Calculation";
    begin
        Rec.UpdateUnitPriceByField(0);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnBeforeFindLines', '', true, true)]
    procedure NEBJFindSalesLineDisc(var IsHandled: Boolean; var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.";
                                        var TempPriceListLine: Record "Price List Line" temporary;
                                        AmountType: Enum "Price Amount Type"; ShowAll: Boolean; var FoundLines: Boolean)
    var
        Item: Record Item;
        TempPriceSource: Record "Price Source";
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
        SourceTypeList: list of [Enum "Price Source Type"];
        SourceType: Enum "Price Source Type";
    begin
        if AmountType = AmountType::Price then
            exit;

        PriceCalculationBufferMgt.GetSources(TempPriceSource);
        TempPriceSource.SetFilter("Source Type", '%1..%2|%3', TempPriceSource."Source Type"::"All Customers",
                                  TempPriceSource."Source Type"::"Customer Disc. Group", TempPriceSource."Source Type"::Campaign);
        if not TempPriceSource.findset() then
            exit;

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
        Item.SetLoadFields("Disable All Item Discount");
        if Item.Get(ItemNo) then;

        TempPriceListLine.Reset();
        TempPriceListLine.DeleteAll();

        SourceTypeList.Add(FromPriceList."Source Type"::"Customer");
        SourceTypeList.Add(FromPriceList."Source Type"::"All Customers");
        SourceTypeList.Add(FromPriceList."Source Type"::"Customer Disc. Group");
        SourceTypeList.Add(FromPriceList."Source Type"::Campaign);

        FromPriceList.SetFilter("Ending Date", '%1|>=%2', 0D, PriceCalcBuff."Document Date");
        FromPriceList.SetFilter("Variant Code", '%1|%2', PriceCalcBuff."Variant Code", '');
        if not ShowAll then begin
            FromPriceList.SetRange("Starting Date", 0D, PriceCalcBuff."Document Date");
            FromPriceList.SetFilter("Currency Code", '%1|%2', PriceCalcBuff."Currency Code", '');
            if PriceCalcBuff."Unit of Measure Code" <> '' then
                FromPriceList.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuff."Unit of Measure Code", '');
        end;

        foreach sourceType in sourceTypeList do begin
            FromPriceList."Source Type" := SourceType;
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (CustNo <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (CustDiscGrp <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Campaign) and not ((CustNo = '') and (ContNo = ''))) then begin
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


                    if not Item."Disable All Item DisCount" then begin
                        FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::"All Items");
                        FromPriceList.SetRange("Asset No.");
                        CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                    end;
                until not InclCampain;
            end;
        end;
        TempPriceListLine.SetRange(EndUser, EndUser);
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            else
                TempPriceListLine.SetRange(EndUser, '');

        if TempPriceListLine.Count = 0 then
            exit;
        IsHandled := true;
        FoundLines := true;
    end;

    local procedure CopySalesDiscToSalesLine(var FromPriceList: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromPriceList.FindSet() then
            repeat
                TempPriceListLine := FromPriceList;
                TempPriceListLine.Insert();
            until FromPriceList.Next() = 0;
    end;

    var
        QtyValue: Decimal;
        QtyPerUOMValue: Decimal;
}