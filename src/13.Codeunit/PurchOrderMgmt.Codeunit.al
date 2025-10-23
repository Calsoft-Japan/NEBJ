codeunit 50000 PurchOrderMgmt
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInsertEvent', '', true, true)]
    procedure Ext_LotInsert(var Rec: Record "Purchase Line")
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
        if (Rec."Document Type" = Rec."Document Type"::Order) and
           (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then
            if Item."Item Tracking Code" = 'LOT' then begin
                Clear(ReservEntry);
                ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, true);
                RecRef.GetTable(Rec);
                //PurchLineResrv.FilterReservFor(ReservEntry, Rec);           //Test it properly
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);  //Test it properly
                ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);
                ReservEntry.SetRange("Source Ref. No.", Rec."Line No.");
                ReservEntry.SetFilter("Lot No.", '=%1', '');
                if ReservEntry.FindFirst() then begin
                    repeat
                        ReservEntry."Lot No." := 'A';
                        ReservEntry."Item Tracking" := ReservEntry."Item Tracking"::"Lot No.";
                        ReservEntry.Modify();
                    until ReservEntry.Next() = 0;
                end else begin
                    if Rec."Quantity (Base)" <> 0 then begin
                        //Test it properly
                        ReservEntry."Lot No." := 'A';
                        CreateResvEntry.CreateReservEntryFor(
                          Database::"Purchase Line", Rec."Document Type".AsInteger(),
                          Rec."Document No.", '', 0, Rec."Line No.", Rec."Qty. per Unit of Measure",
                           Rec.Quantity, Rec."Quantity (Base)", ReservEntry); //Test it properly
                        CreateResvEntry.CreateEntry(Rec."No.", Rec."Variant Code", Rec."Location Code",
                                                    Rec.Description, 0D, 0D, 0, ReservEntry."Reservation Status"::Surplus);
                        //Test it properly
                    end;
                end;
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', true, true)]
    procedure Ext_LotModify(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    //procedure Ext_LotModify(var Rec: Record "Purchase Line"; var xRecPurchLine: Record "Purchase Line")
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
        if (Rec."Document Type" = Rec."Document Type"::Order) and
           (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then
            if Item."Item Tracking Code" = 'LOT' then begin
                Clear(ReservEntry);
                ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, true);
                //PurchLineResrv.FilterReservFor(ReservEntry, Rec); //Test it properly
                ReservMgmt.FilterReservFor(RecRef, ReservEntry, DirEnum::Inbound);  //Test it properly
                ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Surplus);
                ReservEntry.SetRange("Source Ref. No.", Rec."Line No.");
                ReservEntry.SetFilter("Lot No.", '=%1', '');
                if ReservEntry.FindFirst() then begin
                    repeat
                        ReservEntry."Lot No." := 'A';
                        ReservEntry.Positive := (ReservEntry."Quantity (Base)" > 0);
                        ReservEntry.Modify();
                    until ReservEntry.Next() = 0;
                end else begin
                    CreateResvEntry.CreateReservEntryFor(Database::"Purchase Line", Rec."Document Type".AsInteger(), Rec."Document No.", '', 0,
                               Rec."Line No.", Rec."Qty. per Unit of Measure", Rec.Quantity - xRec.Quantity,
                               Rec."Quantity (Base)" - xRec."Quantity (Base)", ReservEntry);//Test it properly
                    CreateResvEntry.CreateEntry(Rec."No.",
                                    Rec."Variant Code", Rec."Location Code",
                                    Rec.Description,
                                    0D,
                                    0D,
                                    0,
                                    ReservEntry."Reservation Status"::Surplus);
                end;
            end;
        //Test it properly
    end;
}