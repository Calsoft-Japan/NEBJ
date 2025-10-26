codeunit 50001 ItemTrackingMgtNEBJ
{
    procedure ImportProcessingFlag()
    begin
        ImportProcess := true;
    end;

    procedure AssistEditLotSerialNo(var SalesLine: Record "Sales Line" temporary; NeedQty: Decimal): Boolean
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        ReservEntry3: Record "Reservation Entry";
        ReservEntry4: Record "Reservation Entry";
        DelReservEntry: Record "Reservation Entry";
        TempReservEntry: Record "Reservation Entry" temporary;
        TempReservEntry2: Record "Reservation Entry" temporary;
        TempEntrySummary: Record "Entry Summary" temporary;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        Window: Dialog;
        LastEntryNo: Integer;
        TotalQuantity: Decimal;
    begin
        Window.Open(Text004);
        TempReservEntry.Reset();
        TempReservEntry.DeleteAll();
        TempEntrySummary.Reset();
        TempEntrySummary.DeleteAll();

        NeedQty := NeedQty * SalesLine."Qty. per Unit of Measure";

        ItemLedgEntry.Reset();
        ItemLedgEntry.SetCurrentKey("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
        ItemLedgEntry.SetRange("Item No.", SalesLine."No.");
        ItemLedgEntry.SetRange(Positive, true);
        ItemLedgEntry.SetRange(Open, true);
        ItemLedgEntry.SetRange("Location Code", SalesLine."Location Code");
        ItemLedgEntry.SetFilter("Lot No.", '<>%1', '');
        if ItemLedgEntry.FindSet() then
            repeat
                TempReservEntry.SetRange("Lot No.", ItemLedgEntry."Lot No.");
                if not TempReservEntry.FindFirst() then begin
                    TempReservEntry.Init();
                    TempReservEntry."Entry No." := -ItemLedgEntry."Entry No.";
                    TempReservEntry."Reservation Status" := TempReservEntry."Reservation Status"::Surplus;
                    TempReservEntry.Positive := ItemLedgEntry.Positive;
                    TempReservEntry."Item No." := ItemLedgEntry."Item No.";
                    TempReservEntry."Location Code" := ItemLedgEntry."Location Code";
                    TempReservEntry."Source Type" := Database::"Item Ledger Entry";
                    TempReservEntry."Source Ref. No." := ItemLedgEntry."Entry No.";
                    TempReservEntry."Lot No." := ItemLedgEntry."Lot No.";
                    TempReservEntry."Expiration Date" := ItemLedgEntry."Expiration Date";
                    TempReservEntry."Expected Receipt Date" := 0D;
                    TempReservEntry."Item Ledger Entry No." := ItemLedgEntry."Entry No.";
                    TempReservEntry.Insert();
                end;

                TempReservEntry."Quantity (Base)" += ItemLedgEntry."Remaining Quantity";
                TempReservEntry.Modify();
            until ItemLedgEntry.Next() = 0;
        TempReservEntry.Reset();
        if TempReservEntry.FindSet() then
            repeat
                TempEntrySummary.SetRange("Lot No.", TempReservEntry."Lot No.");
                if not TempEntrySummary.FindFirst() then begin
                    TempEntrySummary.Init();
                    TempEntrySummary."Entry No." := LastEntryNo + 1;
                    LastEntryNo := TempEntrySummary."Entry No.";
                    TempEntrySummary."Table ID" := TempReservEntry."Source Type";
                    TempEntrySummary."Summary Type" := '';
                    TempEntrySummary."Lot No." := TempReservEntry."Lot No.";
                    TempEntrySummary.Insert();
                end;
                TempEntrySummary."Expiration Date" := TempReservEntry."Expiration Date";
                TempEntrySummary."Total Quantity" += TempReservEntry."Quantity (Base)";

                ReservEntry.Reset();
                ReservEntry.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Reservation Status");
                ReservEntry.SetRange("Item No.", SalesLine."No.");
                ReservEntry.SetRange("Location Code", SalesLine."Location Code");
                ReservEntry.SetRange("Lot No.", TempReservEntry."Lot No.");
                ReservEntry.SetFilter("Quantity (Base)", '<0');
                ReservEntry2.CopyFilters(ReservEntry);
                ReservEntry.SetFilter("Source ID", '<>%1', SalesLine."Document No.");
                ReservEntry2.SetRange("Source ID", SalesLine."Document No.");
                ReservEntry2.SetFilter("Source Ref. No.", '<>%1', SalesLine."Line No.");
                if ReservEntry.FindSet() then
                    repeat
                        TempEntrySummary."Total Requested Quantity" -= ReservEntry."Quantity (Base)";
                    until ReservEntry.Next() = 0;
                if ReservEntry2.FindSet() then
                    repeat
                        TempEntrySummary."Total Requested Quantity" -= ReservEntry2."Quantity (Base)";
                    until ReservEntry2.Next() = 0;

                TempEntrySummary."Total Available Quantity" := TempEntrySummary."Total Quantity" - TempEntrySummary."Total Requested Quantity";
                TempEntrySummary."Item Ledger Entry No." := TempReservEntry."Item Ledger Entry No.";
                TempEntrySummary.Modify();
            until TempReservEntry.Next() = 0;

        TempEntrySummary.Reset();
        Window.Close();

        //QuantityCheck
        TempEntrySummary.SetFilter("Total Available Quantity", '>0');
        TempEntrySummary.SetCurrentKey("Expiration Date", "Item Ledger Entry No.");

        DelReservEntry.Reset();
        DelReservEntry.SetRange("Item No.", SalesLine."No.");
        DelReservEntry.SetRange("Location Code", SalesLine."Location Code");
        DelReservEntry.SetRange("Source ID", SalesLine."Document No.");
        DelReservEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
        DelReservEntry.SetFilter("Lot No.", '=%1', '');
        DelReservEntry.DeleteAll();

        TotalQuantity := 0;
        if TempEntrySummary.FindSet() then
            repeat
                TotalQuantity += TempEntrySummary."Total Available Quantity";
            until TempEntrySummary.Next() = 0;

        if TotalQuantity < NeedQty then begin
            if TempEntrySummary.FindSet() then begin
                Message(Text013, NeedQty - TotalQuantity);
                repeat
                    ReservEntry3.Reset();
                    ReservEntry3.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Reservation Status");
                    ReservEntry3.SetRange("Item No.", SalesLine."No.");
                    ReservEntry3.SetRange("Location Code", SalesLine."Location Code");
                    ReservEntry3.SetRange("Lot No.", TempEntrySummary."Lot No.");
                    ReservEntry3.SetRange("Source ID", SalesLine."Document No.");
                    ReservEntry3.SetRange("Source Ref. No.", SalesLine."Line No.");
                    ReservEntry3.SetFilter("Quantity (Base)", '<0');
                    if ReservEntry3.FindSet() then
                        repeat
                            if ReservEntry4.Get(ReservEntry3."Entry No.", true) then
                                ReservEntry4.Delete();
                            ReservEntry3.Delete();
                        until ReservEntry3.Next() = 0;
                    CreateReservEntry.CreateReservEntryFor(
                        Database::"Sales Line",
                        SalesLine."Document Type".AsInteger(),
                        SalesLine."Document No.", '', 0,
                        SalesLine."Line No.",
                        SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity" / SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity",
                        ReservEntry3);
                    CreateReservEntry.CreateEntry(
                        SalesLine."No.",
                        SalesLine."Variant Code",
                        SalesLine."Location Code",
                        SalesLine.Description, 0D,
                        SalesLine."Shipment Date", 0,
                        TempReservEntry."Reservation Status"::Surplus);
                until TempEntrySummary.Next() = 0;
            end else
                Message(Text016);
        end else begin
            if not ImportProcess then
                Message(Text014);
            if TempEntrySummary.FindSet() then begin
                repeat
                    if TempEntrySummary."Total Available Quantity" >= NeedQty then begin
                        ReservEntry3.Reset();
                        ReservEntry3.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        ReservEntry3.SetRange("Item No.", SalesLine."No.");
                        ReservEntry3.SetRange("Location Code", SalesLine."Location Code");
                        ReservEntry3.SetRange("Lot No.", TempEntrySummary."Lot No.");
                        ReservEntry3.SetRange("Source ID", SalesLine."Document No.");
                        ReservEntry3.SetRange("Source Ref. No.", SalesLine."Line No.");
                        ReservEntry3.SetFilter("Quantity (Base)", '<0');
                        if ReservEntry3.FindSet() then
                            repeat
                                if ReservEntry4.Get(ReservEntry3."Entry No.", true) then
                                    ReservEntry4.Delete();
                                ReservEntry3.Delete();
                            until ReservEntry3.Next() = 0;
                        CreateReservEntry.CreateReservEntryFor(
                            Database::"Sales Line",
                            SalesLine."Document Type".AsInteger(),
                            SalesLine."Document No.", '', 0,
                            SalesLine."Line No.",
                            SalesLine."Qty. per Unit of Measure",
                            NeedQty / SalesLine."Qty. per Unit of Measure",
                            NeedQty, ReservEntry3);

                        CreateReservEntry.CreateEntry(
                            SalesLine."No.",
                            SalesLine."Variant Code",
                            SalesLine."Location Code",
                            SalesLine.Description, 0D,
                            SalesLine."Shipment Date", 0,
                            TempReservEntry."Reservation Status"::Surplus);
                        exit;
                    end else begin
                        NeedQty := NeedQty - TempEntrySummary."Total Available Quantity";
                        ReservEntry3.Reset();
                        ReservEntry3.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        ReservEntry3.SetRange("Item No.", SalesLine."No.");
                        ReservEntry3.SetRange("Location Code", SalesLine."Location Code");
                        ReservEntry3.SetRange("Lot No.", TempEntrySummary."Lot No.");
                        ReservEntry3.SetRange("Source ID", SalesLine."Document No.");
                        ReservEntry3.SetRange("Source Ref. No.", SalesLine."Line No.");
                        ReservEntry3.SetFilter("Quantity (Base)", '<0');
                        if ReservEntry3.FindSet() then
                            repeat
                                if ReservEntry4.Get(ReservEntry3."Entry No.", true) then
                                    ReservEntry4.Delete();
                                ReservEntry3.Delete();
                            until ReservEntry3.Next() = 0;
                        CreateReservEntry.CreateReservEntryFor(
                            Database::"Sales Line",
                            SalesLine."Document Type".AsInteger(),
                            SalesLine."Document No.", '', 0,
                            SalesLine."Line No.",
                            SalesLine."Qty. per Unit of Measure",
                            TempEntrySummary."Total Available Quantity" / SalesLine."Qty. per Unit of Measure",
                            TempEntrySummary."Total Available Quantity", ReservEntry3);

                        CreateReservEntry.CreateEntry(
                            SalesLine."No.",
                            SalesLine."Variant Code",
                            SalesLine."Location Code",
                            SalesLine.Description, 0D,
                            SalesLine."Shipment Date", 0,
                            TempReservEntry."Reservation Status"::Surplus);
                    end;
                until TempEntrySummary.Next() = 0;
            end;
        end;
    end;

    var
        ImportProcess: Boolean;
        Text004: Label 'Counting records...';
        Text013: Label 'Lot No. is assigned, but still lack %1!';
        Text014: Label 'Lot information has been successfully applied!';
        Text015: Label 'There is already shipped quantity, please assign the Lot No. manually!';
        Text016: Label 'There is no available stock to assign!';
}