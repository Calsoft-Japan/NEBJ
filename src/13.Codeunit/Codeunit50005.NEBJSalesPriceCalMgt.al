codeunit 50005 "NEBJ Sales Price Cal. Mgt."
{
    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterFillBuffer', '', true, true)]
    local procedure NEBJOnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer" temporary; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    begin
        PriceCalculationBuffer."NEBJ Customer No." := SalesHeader."Bill-to Customer No.";
        PriceCalculationBuffer."NEBJ Contact No." := SalesHeader."Bill-to Contact";
        PriceCalculationBuffer."NEBJ Cust. Disc. Grp." := SalesHeader."Customer Disc. Group";
        PriceCalculationBuffer."NEBJ EndUser" := SalesLine.EndUser;
        //PriceCalculationBuffer."NEBJ ShowAll" := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnApplyDisCountOnBeforeFillBestLine', '', true, true)]
    procedure NEBJFindSalesLineDisc(var TempPriceListLine: Record "Price List Line" temporary; var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.")
    var
        Item: Record Item;
        FromPriceList: Record "Price List Line";
        PriceCalcBuff: Record "Price Calculation Buffer";
        ShowAll: Boolean;
    begin
        ShowAll := true;
        PriceCalculationBufferMgt.GetBuffer(PriceCalcBuff);
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
        for FromPriceList."Source Type" := FromPriceList."Source Type"::Customer to FromPriceList."Source Type"::Contact do
            if (FromPriceList."Source Type" = FromPriceList."Source Type"::"All Customers") or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Customer) and (PriceCalcBuff."NEBJ Customer No." <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::"Customer Disc. Group") and (PriceCalcBuff."NEBJ Cust. Disc. Grp." <> '')) or
               ((FromPriceList."Source Type" = FromPriceList."Source Type"::Contact) and
                not ((PriceCalcBuff."NEBJ Customer No." = '') and (PriceCalcBuff."NEBJ Contact No." = '')))
            then begin
                FromPriceList.SetRange("Source Type", FromPriceList."Source Type");
                case FromPriceList."Source Type" of
                    FromPriceList."Source Type"::"All Customers":
                        FromPriceList.SetRange("Assign-to No.");
                    FromPriceList."Source Type"::Customer:
                        FromPriceList.SetRange("Assign-to No.", PriceCalcBuff."NEBJ Customer No.");
                    FromPriceList."Source Type"::"Customer Disc. Group":
                        FromPriceList.SetRange("Assign-to No.", PriceCalcBuff."NEBJ Cust. Disc. Grp.");
                end;
                if FromPriceList.FindSet() then
                    repeat
                        if Item.Get(PriceCalcBuff."Asset No.") then;
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
                        if not Item."Disable All Item DisCount" then begin
                            FromPriceList.SetRange("Asset Type", FromPriceList."Asset Type"::" ");
                            FromPriceList.SetRange("Asset No.");
                            CopySalesDiscToSalesLine(FromPriceList, TempPriceListLine);
                        end;
                    until FromPriceList.Next() = 0;
            end;

        TempPriceListLine.SetRange(EndUser, PriceCalcBuff."NEBJ EndUser");
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuff."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            ELSE
                TempPriceListLine.SetRange(EndUser, '');
    end;

    local procedure CopySalesDiscToSalesLine(var FromPriceList: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromPriceList.FindSet() then
            repeat
                TempPriceListLine := FromPriceList;
                TempPriceListLine.Insert();
            until FromPriceList.Next() = 0;
    end; */

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