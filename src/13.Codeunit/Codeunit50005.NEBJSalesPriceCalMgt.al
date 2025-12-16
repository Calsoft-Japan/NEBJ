codeunit 50005 "NEBJ Sales Price Cal. Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterFillBuffer', '', true, true)]
    local procedure NEBJOnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer" temporary; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    begin
        PriceCalculationBuffer."NEBJ Customer No." := SalesHeader."Bill-to Customer No.";
        PriceCalculationBuffer."NEBJ Contact No." := SalesHeader."Bill-to Contact";
        PriceCalculationBuffer."NEBJ Cust. Disc. Grp." := SalesHeader."Customer Disc. Group";
        PriceCalculationBuffer."NEBJ EndUser" := SalesLine.EndUser;
        PriceCalculationBuffer."NEBJ ShowAll" := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnApplyDisCountOnBeforeFillBestLine', '', true, true)]
    procedure NEBJFindSalesLineDisc(var TempPriceListLine: Record "Price List Line" temporary; var PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.")
    var
        Item: Record Item;
        FromSalesLineDisc: Record "Price List Line";
        PriceCalcBuffer: Record "Price Calculation Buffer";
    begin
        PriceCalculationBufferMgt.GetBuffer(PriceCalcBuffer);
        FromSalesLineDisc.SetFilter("ending Date", '%1|>=%2', 0D, PriceCalcBuffer."document Date");
        FromSalesLineDisc.SetFilter("Variant Code", '%1|%2', PriceCalcBuffer."Variant Code", '');
        if not PriceCalcBuffer."NEBJ ShowAll" then begin
            FromSalesLineDisc.SetRange("Starting Date", 0D, PriceCalcBuffer."document Date");
            FromSalesLineDisc.SetFilter("Currency Code", '%1|%2', PriceCalcBuffer."Currency Code", '');
            if PriceCalcBuffer."Unit of Measure Code" <> '' then
                FromSalesLineDisc.SetFilter("Unit of Measure Code", '%1|%2', PriceCalcBuffer."Unit of Measure Code", '');
        end;
        TempPriceListLine.Reset();
        TempPriceListLine.DeleteAll();
        for FromSalesLineDisc."Source Type" := FromSalesLineDisc."Source Type"::Customer to FromSalesLineDisc."Source Type"::Campaign do
            if (FromSalesLineDisc."Source Type" = FromSalesLineDisc."Source Type"::"All Customers") or
               ((FromSalesLineDisc."Source Type" = FromSalesLineDisc."Source Type"::Customer) and (PriceCalcBuffer."NEBJ Customer No." <> '')) or
               ((FromSalesLineDisc."Source Type" = FromSalesLineDisc."Source Type"::"Customer Disc. Group") and (PriceCalcBuffer."NEBJ Cust. Disc. Grp." <> '')) or
               ((FromSalesLineDisc."Source Type" = FromSalesLineDisc."Source Type"::Campaign) and
                not ((PriceCalcBuffer."NEBJ Customer No." = '') and (PriceCalcBuffer."NEBJ Contact No." = '')))
            then begin
                FromSalesLineDisc.SetRange("Source Type", FromSalesLineDisc."Source Type");
                case FromSalesLineDisc."Source Type" of
                    FromSalesLineDisc."Source Type"::"All Customers":
                        FromSalesLineDisc.SetRange("Assign-to No.");
                    FromSalesLineDisc."Source Type"::Customer:
                        FromSalesLineDisc.SetRange("Assign-to No.", PriceCalcBuffer."NEBJ Customer No.");
                    FromSalesLineDisc."Source Type"::"Customer Disc. Group":
                        FromSalesLineDisc.SetRange("Assign-to No.", PriceCalcBuffer."NEBJ Cust. Disc. Grp.");
                end;
                if FromSalesLineDisc.FindSet() then
                    repeat
                        if Item.Get(PriceCalcBuffer."Asset No.") then;
                        FromSalesLineDisc.SetRange("Asset Type", FromSalesLineDisc."Asset Type"::Item);
                        FromSalesLineDisc.SetRange("Asset No.", PriceCalcBuffer."Asset No.");
                        if not PriceCalcBuffer."NEBJ ShowAll" then begin
                            FromSalesLineDisc.SetFilter("Starting Date", '>%1&<=%2', 0D, PriceCalcBuffer."document Date");
                            if FromSalesLineDisc.Count = 0 then
                                FromSalesLineDisc.SetRange("Starting Date", 0D, PriceCalcBuffer."document Date");
                        end;
                        CopySalesDiscToSalesLine(FromSalesLineDisc, TempPriceListLine);
                        if PriceCalcBuffer."Asset Type" = PriceCalcBuffer."Asset Type"::"Item DisCount Group" then begin
                            FromSalesLineDisc.SetRange("Asset Type", FromSalesLineDisc."Asset Type"::"Item DisCount Group");
                            FromSalesLineDisc.SetRange("Asset No.", PriceCalcBuffer."Asset No.");
                            CopySalesDiscToSalesLine(FromSalesLineDisc, TempPriceListLine);
                        end;
                        if PriceCalcBuffer."Asset Type" = PriceCalcBuffer."Asset Type"::"Item DisCount Group 2" then begin
                            FromSalesLineDisc.SetRange("Asset Type", FromSalesLineDisc."Asset Type"::"Item DisCount Group 2");
                            FromSalesLineDisc.SetRange("Asset No.", PriceCalcBuffer."Asset No.");
                            CopySalesDiscToSalesLine(FromSalesLineDisc, TempPriceListLine);
                        end;
                        if PriceCalcBuffer."Asset Type" = PriceCalcBuffer."Asset Type"::"Item DisCount Group 3" then begin
                            FromSalesLineDisc.SetRange("Asset Type", FromSalesLineDisc."Asset Type"::"Item DisCount Group 3");
                            FromSalesLineDisc.SetRange("Asset No.", PriceCalcBuffer."Asset No.");
                            CopySalesDiscToSalesLine(FromSalesLineDisc, TempPriceListLine);
                        end;
                        if not Item."Disable All Item DisCount" then begin
                            FromSalesLineDisc.SetRange("Asset Type", FromSalesLineDisc."Asset Type"::" ");
                            FromSalesLineDisc.SetRange("Asset No.");
                            CopySalesDiscToSalesLine(FromSalesLineDisc, TempPriceListLine);
                        end;
                    until FromSalesLineDisc.Next() = 0;
            end;

        TempPriceListLine.SetRange(EndUser, PriceCalcBuffer."NEBJ EndUser");
        if TempPriceListLine.Count = 0 then
            if PriceCalcBuffer."NEBJ EndUser" = '' then
                TempPriceListLine.SetRange(EndUser)
            ELSE
                TempPriceListLine.SetRange(EndUser, '');
    end;

    local procedure CopySalesDiscToSalesLine(var FromSalesLineDisc: Record "Price List Line"; var TempPriceListLine: Record "Price List Line")
    begin
        if FromSalesLineDisc.FindSet() then
            repeat
                TempPriceListLine := FromSalesLineDisc;
                TempPriceListLine.Insert();
            until FromSalesLineDisc.Next() = 0;
    end;

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