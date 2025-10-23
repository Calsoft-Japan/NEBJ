codeunit 50000 PurchOrderMgmt
{
    //[EventSubscriber(ObjectType::Table, DATABASE::"Purchase Line", 'Ext_LotInsert', '', true, true)]
    procedure Ext_LotInsert(var PurchLine: Record "Purchase Line")
    var
        Item: Record Item;
        ReservEntry: Record "Reservation Entry";
        RecRef: RecordRef;
        ReservMgmt: Codeunit "Reservation Management";
        //PurchLineResrv: Codeunit "Purch. Line-Reserve";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        CreateResvEntry: Codeunit "Create Reserv. Entry";
        DirEnum: Enum "Transfer Direction";
    begin
        if (PurchLine."Document Type" = PurchLine."Document Type"::Order) and
           (PurchLine.Type = PurchLine.Type::Item) and Item.Get(PurchLine."No.") then
            if Item."Item Tracking Code" = 'LOT' then begin
                Clear(ReservEntry);
                ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, true);
                RecRef.GetTable(PurchLine);
                //PurchLineResrv.FilterReservFor(ReservEntry, PurchLine);           //Test it properly
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);  //Test it properly
                ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);
                ReservEntry.SetRange("Source Ref. No.", PurchLine."Line No.");
                ReservEntry.SetFilter("Lot No.", '=%1', '');
                if ReservEntry.FindFirst() then begin
                    repeat
                        ReservEntry."Lot No." := 'A';
                        ReservEntry."Item Tracking" := ReservEntry."Item Tracking"::"Lot No.";
                        ReservEntry.Modify();
                    until ReservEntry.Next() = 0;
                end else begin
                    if PurchLine."Quantity (Base)" <> 0 then begin
                        //Test it properly
                        ReservEntry."Lot No." := 'A';
                        CreateResvEntry.CreateReservEntryFor(
                          Database::"Purchase Line", PurchLine."Document Type".AsInteger(),
                          PurchLine."Document No.", '', 0, PurchLine."Line No.", PurchLine."Qty. per Unit of Measure",
                           PurchLine.Quantity, PurchLine."Quantity (Base)", ReservEntry); //Test it properly
                        CreateResvEntry.CreateEntry(PurchLine."No.", PurchLine."Variant Code", PurchLine."Location Code",
                                                    PurchLine.Description, 0D, 0D, 0, ReservEntry."Reservation Status"::Surplus);
                        //Test it properly
                    end;
                end;
            end;
    end;

    //[EventSubscriber(ObjectType::Table, DATABASE::"Purchase Line", 'Ext_LotModify', '', true, true)]
    procedure Ext_LotModify(var PurchLine: Record "Purchase Line"; var xRecPurchLine: Record "Purchase Line")
    var
        Item: Record Item;
        ReservEntry: Record "Reservation Entry";
        RecRef: RecordRef;
        ReservMgmt: Codeunit "Reservation Management";
        //PurchLineResrv: Codeunit "Purch. Line-Reserve";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        CreateResvEntry: Codeunit "Create Reserv. Entry";
        DirEnum: Enum "Transfer Direction";
    begin
        //Test it properly
        if (PurchLine."Document Type" = PurchLine."Document Type"::Order) and
           (PurchLine.Type = PurchLine.Type::Item) and Item.Get(PurchLine."No.") then
            if Item."Item Tracking Code" = 'LOT' then begin
                Clear(ReservEntry);
                ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, true);
                //PurchLineResrv.FilterReservFor(ReservEntry, PurchLine); //Test it properly
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);  //Test it properly
                ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);
                ReservEntry.SetRange("Source Ref. No.", PurchLine."Line No.");
                ReservEntry.SetFilter("Lot No.", '=%1', '');
                if ReservEntry.FindFirst() then begin
                    repeat
                        ReservEntry."Lot No." := 'A';
                        ReservEntry.Positive := (ReservEntry."Quantity (Base)" > 0);
                        ReservEntry.Modify();
                    until ReservEntry.Next() = 0;
                end else begin
                    CreateResvEntry.CreateReservEntryFor(Database::"Purchase Line", PurchLine."Document Type".AsInteger(), PurchLine."Document No.", '', 0,
                               PurchLine."Line No.", PurchLine."Qty. per Unit of Measure", PurchLine.Quantity - xRecPurchLine.Quantity,
                               PurchLine."Quantity (Base)" - xRecPurchLine."Quantity (Base)", ReservEntry);//Test it properly
                    CreateResvEntry.CreateEntry(PurchLine."No.",
                                    PurchLine."Variant Code", PurchLine."Location Code",
                                    PurchLine.Description,
                                    0D,
                                    0D,
                                    0,
                                    ReservEntry."Reservation Status"::Surplus);
                end;
            end;
        //Test it properly
    end;
}