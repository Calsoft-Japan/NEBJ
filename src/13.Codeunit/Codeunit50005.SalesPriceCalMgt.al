/* codeunit 50005 "Sales Price Cal. Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, CODEUNIT::"Sales Price Calc. Mgt.", 'OnFindSalesLineLineDiscOnBeforeCalcLineDisc', '', true, true)]
    procedure UpdateAfterUoMandQty(Qty: Decimal; QtyPerUOM: Decimal; var TempSalesLineDiscount: Record "Sales Line Discount" temporary; var IsHandled: Boolean)
    begin
        QtyValue := Qty;
        QtyPerUOMValue := QtyPerUOM;
        CalcBestLineDisc2(TempSalesLineDiscount);
        IsHandled := true;
    end;

    local procedure CalcBestLineDisc2(var SalesLineDisc: Record "Sales Line Discount")
    var
        BestSalesLineDisc: Record "Sales Line Discount";
        BestSalesLineDisc2: Record "Sales Line Discount";
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
                            if BestSalesLineDisc."Line Discount %" < SalesLineDisc."Line Discount %" then
                                BestSalesLineDisc := SalesLineDisc;
                    end;
                Cnt := Cnt + 1;
            until SalesLineDisc.Next() = 0;
        SalesLineDisc := BestSalesLineDisc;
    end;

    local procedure IsInMinQty(UnitofMeasureCode: code[10]; MinQty: Decimal): Boolean
    begin
        if UnitofMeasureCode = '' then
            exit(MinQty <= QtyPerUOMValue * QtyValue);
        exit(MinQty <= QtyValue);
    end;

    var
        QtyValue: Decimal;
        QtyPerUOMValue: Decimal;

} */