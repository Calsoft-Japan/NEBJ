codeunit 50005 "Sales Price Cal. Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Price Calc. Mgt.", 'OnFindSalesLineLineDiscOnBeforeCalcLineDisc', '', true, true)]
    procedure UpdateAfterUoMandQty(Qty: Decimal; QtyPerUOM: Decimal; var TempSalesLineDiscount: Record "Sales Line Discount" temporary; var IsHandled: Boolean)
    begin
        QtyValue := Qty;
        QtyPerUOMValue := QtyPerUOM;
        NEBJCalcBestLineDisc(TempSalesLineDiscount);
        IsHandled := true;
    end;

    local procedure NEBJCalcBestLineDisc(var SalesLineDisc: Record "Sales Line Discount")
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

    local procedure IsInMinQty(UoMCode: code[10]; MinQty: Decimal): Boolean
    begin
        if UoMCode = '' then
            exit(MinQty <= QtyPerUOMValue * QtyValue);
        exit(MinQty <= QtyValue);
    end;

    /* procedure EXT_FindSalesLineDisc(VAR ToSalesLineDisc: Record "Sales Line Discount"; CustNo: Code[20]; ContNo: Code[20]; CustDiscGrCode: Code[20]; CampaignNo: Code[20]; ItemNo: Code[20]; ItemDiscGrCode: Code[20]; VariantCode: Code[10]; UOM: code[10]; CurrencyCode: code[10]; StartingDate: Date; ShowAll: Boolean; p_EndUser: code[10]; P_Dealer1: code[10]; p_Dealer2: code[10]; p_Dealer3: code[10]; ItemDiscGrCode2: code[10]; ItemDiscGrCode3: code[10])
    var
        Item: record Item;
        FromSalesLineDisc: Record "Sales Line Discount";
        TempCampaignTargetGr: Record "Campaign Target Group" temporary;
        SalesPriceCalcMgt: codeunit "Sales Price Calc. Mgt.";
        InclCampaigns: Boolean;
    begin
        WITH FromSalesLineDisc DO BEGIN
            SETFILTER("Ending Date", '%1|>=%2', 0D, StartingDate);
            SETFILTER("Variant Code", '%1|%2', VariantCode, '');
            IF NOT ShowAll THEN BEGIN
                SETRANGE("Starting Date", 0D, StartingDate);
                SETFILTER("Currency Code", '%1|%2', CurrencyCode, '');
                IF UOM <> '' THEN
                    SETFILTER("Unit of Measure Code", '%1|%2', UOM, '');
            END;
            ToSalesLineDisc.RESET;
            ToSalesLineDisc.DELETEALL;
            FOR "Sales Type" := "Sales Type"::Customer TO "Sales Type"::Campaign DO
                IF ("Sales Type" = "Sales Type"::"All Customers") OR
                   (("Sales Type" = "Sales Type"::Customer) AND (CustNo <> '')) OR
                   (("Sales Type" = "Sales Type"::"Customer Disc. Group") AND (CustDiscGrCode <> '')) OR
                   (("Sales Type" = "Sales Type"::Campaign) AND
                    NOT ((CustNo = '') AND (ContNo = '') AND (CampaignNo = '')))
                THEN BEGIN
                    InclCampaigns := FALSE;
                    SETRANGE("Sales Type", "Sales Type");
                    CASE "Sales Type" OF
                        "Sales Type"::"All Customers":
                            SETRANGE("Sales Code");
                        "Sales Type"::Customer:
                            SETRANGE("Sales Code", CustNo);
                        "Sales Type"::"Customer Disc. Group":
                            SETRANGE("Sales Code", CustDiscGrCode);
                        "Sales Type"::Campaign:
                            BEGIN
                                InclCampaigns := SalesPriceCalcMgt.ActivatedCampaignExists(TempCampaignTargetGr, CustNo, ContNo, CampaignNo);
                                SETRANGE("Sales Code", TempCampaignTargetGr."Campaign No.");
                            END;
                    END;
                    REPEAT
                        SETRANGE(Type, Type::Item);
                        SETRANGE(Code, ItemNo);
                        IF NOT ShowAll THEN BEGIN
                            SETFILTER("Starting Date", '>%1&<=%2', 0D, StartingDate);
                            IF FromSalesLineDisc.COUNT = 0 THEN
                                SETRANGE("Starting Date", 0D, StartingDate);
                        END;
                        CopySalesDiscToSalesDisc2(FromSalesLineDisc, ToSalesLineDisc);
                        //Disc Group 1
                        IF ItemDiscGrCode <> '' THEN BEGIN
                            SETRANGE(Type, Type::"Item Discount Group 1");
                            SETRANGE(Code, ItemDiscGrCode);
                            //CopySalesDiscToSalesDisc    
                            CopySalesDiscToSalesDisc2(FromSalesLineDisc, ToSalesLineDisc);
                        END;
                        //Disc Group 2
                        IF ItemDiscGrCode2 <> '' THEN BEGIN
                            SETRANGE(Type, Type::"Item Disc. Group 2");
                            SETRANGE(Code, ItemDiscGrCode2);
                            CopySalesDiscToSalesDisc2(FromSalesLineDisc, ToSalesLineDisc);
                        END;
                        //Disc Group 3
                        IF ItemDiscGrCode3 <> '' THEN BEGIN
                            SETRANGE(Type, Type::"Item Disc. Group 3");
                            SETRANGE(Code, ItemDiscGrCode3);
                            CopySalesDiscToSalesDisc2(FromSalesLineDisc, ToSalesLineDisc);
                        END;

                        //All Item
                        IF NOT Item."Disable All Item Discount" THEN BEGIN
                            SETRANGE(Type, Type::"All Item");
                            SETRANGE(Code);
                            CopySalesDiscToSalesDisc2(FromSalesLineDisc, ToSalesLineDisc);
                        END;
                        //PBCS08.01 ADD END

                        IF InclCampaigns THEN BEGIN
                            InclCampaigns := TempCampaignTargetGr.NEXT <> 0;
                            SETRANGE("Sales Code", TempCampaignTargetGr."Campaign No.");
                        END;
                    UNTIL NOT InclCampaigns;
                END;
            ToSalesLineDisc.SETRANGE(EndUser, p_EndUser);
            IF ToSalesLineDisc.COUNT = 0 THEN
                IF p_EndUser = '' THEN
                    ToSalesLineDisc.SETRANGE(EndUser)
                ELSE
                    ToSalesLineDisc.SETRANGE(EndUser, '');
        END;
    end;

    local procedure CopySalesDiscToSalesDisc2(var FromSalesLineDisc: Record "Sales Line Discount"; var ToSalesLineDisc: Record "Sales Line Discount")
    begin
        IF FromSalesLineDisc.FINDSET THEN
            REPEAT
                ToSalesLineDisc := FromSalesLineDisc;
                ToSalesLineDisc.INSERT;
            UNTIL FromSalesLineDisc.NEXT = 0;
    end; */

    var
        QtyValue: Decimal;
        QtyPerUOMValue: Decimal;
}