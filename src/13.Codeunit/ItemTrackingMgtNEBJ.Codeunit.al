codeunit 50001 ItemTrackingMgtNEBJ
{
    procedure ImportProcessingFlag()
    begin
        ImportProcess := true;
    end;

    procedure AssistEditLotSerialNo(VAR SalesLine: Record "Sales Line" temporary; NeedQuantity: Decimal): Boolean
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        ReservEntry3: Record "Reservation Entry";
        ReservEntry4: Record "Reservation Entry";
        TempReservEntry: Record "Reservation Entry" temporary;
        TempReservEntry2: Record "Reservation Entry" temporary;
        TempEntrySummary: Record "Entry Summary" temporary;
        LastEntryNo: Integer;
        TotalQuantity: Decimal;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        ReserveMgt: Codeunit "Reservation Management";
        ReserveEngineMgt: Codeunit "Reservation Engine Mgt.";
        SalesLineRes: Codeunit "Sales Line-Reserve";
        delReservationEntry: Record "Reservation Entry";
        Window: Dialog;

    begin
        /* Window.OPEN(Text004);
        TempReservEntry.RESET;
        TempReservEntry.DELETEALL;
        TempEntrySummary.RESET;
        TempEntrySummary.DELETEALL;

        NeedQuantity := NeedQuantity * SalesLine."Qty. per Unit of Measure";

        ItemLedgEntry.RESET;
        ItemLedgEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Expiration Date", "Lot No.", "Serial No.");
        ItemLedgEntry.SETRANGE("Item No.", SalesLine."No.");
        ItemLedgEntry.SETRANGE(Positive, true);
        ItemLedgEntry.SETRANGE(Open, true);
        ItemLedgEntry.SETRANGE("Location Code", SalesLine."Location Code");
        ItemLedgEntry.SETFILTER("Lot No.", '<>%1', '');

        if ItemLedgEntry.FIND('-') then
            repeat
                TempReservEntry.SETRANGE("Lot No.", ItemLedgEntry."Lot No.");
                if not TempReservEntry.FIND('-') then begin
                    TempReservEntry.INIT;
                    TempReservEntry."Entry No." := -ItemLedgEntry."Entry No.";
                    TempReservEntry."Reservation Status" := TempReservEntry."Reservation Status"::Surplus;
                    TempReservEntry.Positive := ItemLedgEntry.Positive;
                    TempReservEntry."Item No." := ItemLedgEntry."Item No.";
                    TempReservEntry."Location Code" := ItemLedgEntry."Location Code";
                    TempReservEntry."Source Type" := DATABASE::"Item Ledger Entry";
                    TempReservEntry."Source Ref. No." := ItemLedgEntry."Entry No.";
                    TempReservEntry."Lot No." := ItemLedgEntry."Lot No.";
                    TempReservEntry."Expiration Date" := ItemLedgEntry."Expiration Date";
                    TempReservEntry."Expected Receipt Date" := 0D;
                    TempReservEntry."Item Ledger Entry No." := ItemLedgEntry."Entry No.";
                    TempReservEntry.INSERT;
                end;

                TempReservEntry."Quantity (Base)" += ItemLedgEntry."Remaining Quantity";
                TempReservEntry.MODIFY;
            until ItemLedgEntry.NEXT = 0;

        TempReservEntry.RESET;
        if TempReservEntry.FIND('-') then
            repeat
                TempEntrySummary.SETRANGE("Lot No.", TempReservEntry."Lot No.");
                if not TempEntrySummary.FIND('-') then begin
                    TempEntrySummary.INIT;
                    TempEntrySummary."Entry No." := LastEntryNo + 1;
                    LastEntryNo := TempEntrySummary."Entry No.";
                    TempEntrySummary."Table ID" := TempReservEntry."Source Type";
                    TempEntrySummary."Summary Type" := '';
                    TempEntrySummary."Lot No." := TempReservEntry."Lot No.";
                    TempEntrySummary.INSERT;
                end;

                TempEntrySummary."Expiration Date" := TempReservEntry."Expiration Date";
                TempEntrySummary."Total Quantity" += TempReservEntry."Quantity (Base)";

                ReservEntry.RESET;
                ReservEntry.SETCURRENTKEY("Item No.", "Variant Code", "Location Code", "Reservation Status");
                ReservEntry.SETRANGE("Item No.", SalesLine."No.");
                ReservEntry.SETRANGE("Location Code", SalesLine."Location Code");
                ReservEntry.SETRANGE("Lot No.", TempReservEntry."Lot No.");
                ReservEntry.SETFILTER("Quantity (Base)", '<0');
                ReservEntry2.COPYFILTERS(ReservEntry);
                ReservEntry.SETFILTER("Source ID", '<>%1', SalesLine."Document No.");
                ReservEntry2.SETRANGE("Source ID", SalesLine."Document No.");
                ReservEntry2.SETFILTER("Source Ref. No.", '<>%1', SalesLine."Line No.");

                if ReservEntry.FIND('-') then
                    repeat
                        TempEntrySummary."Total Requested Quantity" -= ReservEntry."Quantity (Base)";
                    until ReservEntry.NEXT = 0;
                if ReservEntry2.FIND('-') then
                    repeat
                        TempEntrySummary."Total Requested Quantity" -= ReservEntry2."Quantity (Base)";
                    until ReservEntry2.NEXT = 0;

                TempEntrySummary."Total Available Quantity" := TempEntrySummary."Total Quantity" - TempEntrySummary."Total Requested Quantity";
                TempEntrySummary."Item Ledger Entry No." := TempReservEntry."Item Ledger Entry No.";
                TempEntrySummary.MODIFY;
            until TempReservEntry.NEXT = 0;

        TempEntrySummary.RESET;
        Window.CLOSE;

        //QuantityCheck
        TempEntrySummary.SETFILTER("Total Available Quantity", '>0');
        TempEntrySummary.SETCURRENTKEY("Expiration Date", "Item Ledger Entry No.");

        //PBCS04.01: BEGIN
        delReservationEntry.RESET;
        delReservationEntry.SETRANGE("Item No.", SalesLine."No.");
        delReservationEntry.SETRANGE("Location Code", SalesLine."Location Code");
        delReservationEntry.SETRANGE("Source ID", SalesLine."Document No.");
        delReservationEntry.SETRANGE("Source Ref. No.", SalesLine."Line No.");
        delReservationEntry.SETFILTER("Lot No.", '=%1', '');
        delReservationEntry.DELETEALL;
        //PBCS04.01: END

        TotalQuantity := 0;
        if TempEntrySummary.FIND('-') then
            repeat
                TotalQuantity += TempEntrySummary."Total Available Quantity";
            until TempEntrySummary.NEXT = 0;

        if TotalQuantity < NeedQuantity then begin
            if TempEntrySummary.FIND('-') then begin
                MESSAGE(Text013, NeedQuantity - TotalQuantity);
                repeat
                    ReservEntry3.RESET;
                    ReservEntry3.SETCURRENTKEY("Item No.", "Variant Code", "Location Code", "Reservation Status");
                    ReservEntry3.SETRANGE("Item No.", SalesLine."No.");
                    ReservEntry3.SETRANGE("Location Code", SalesLine."Location Code");
                    ReservEntry3.SETRANGE("Lot No.", TempEntrySummary."Lot No.");
                    ReservEntry3.SETRANGE("Source ID", SalesLine."Document No.");
                    ReservEntry3.SETRANGE("Source Ref. No.", SalesLine."Line No.");
                    ReservEntry3.SETFILTER("Quantity (Base)", '<0');
                    if ReservEntry3.FIND('-') then
                        repeat
                            if ReservEntry4.GET(ReservEntry3."Entry No.", true) then
                                ReservEntry4.DELETE;
                            ReservEntry3.DELETE;
                        until ReservEntry3.NEXT = 0;
                    CreateReservEntry.CreateReservEntryFor(
                        DATABASE::"Sales Line",
                        SalesLine."Document Type",
                        SalesLine."Document No.",
                        '',
                        0,
                        SalesLine."Line No.",
                        SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity" / SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity", //PBCWEST2015mod
                        '',
                        TempEntrySummary."Lot No.");
                    CreateReservEntry.CreateEntry(SalesLine."No.",
                                                    SalesLine."Variant Code",
                                                    SalesLine."Location Code",
                                                    SalesLine.Description,
                                                    0D, SalesLine."Shipment Date", 0,
                                                    TempReservEntry."Reservation Status"::Surplus);
                until TempEntrySummary.NEXT = 0;
            end else
                MESSAGE(Text016);
        end else begin
            if not ImportProcess then  //PBCS05.01: ADD
                MESSAGE(Text014);
            if TempEntrySummary.FIND('-') then begin
                repeat
                    if TempEntrySummary."Total Available Quantity" >= NeedQuantity then begin
                        ReservEntry3.RESET;
                        ReservEntry3.SETCURRENTKEY("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        ReservEntry3.SETRANGE("Item No.", SalesLine."No.");
                        ReservEntry3.SETRANGE("Location Code", SalesLine."Location Code");
                        ReservEntry3.SETRANGE("Lot No.", TempEntrySummary."Lot No.");
                        ReservEntry3.SETRANGE("Source ID", SalesLine."Document No.");
                        ReservEntry3.SETRANGE("Source Ref. No.", SalesLine."Line No.");
                        ReservEntry3.SETFILTER("Quantity (Base)", '<0');
                        if ReservEntry3.FIND('-') then
                            repeat
                                if ReservEntry4.GET(ReservEntry3."Entry No.", true) then
                                    ReservEntry4.DELETE;
                                ReservEntry3.DELETE;
                            until ReservEntry3.NEXT = 0;
                        CreateReservEntry.CreateReservEntryFor(
                        DATABASE::"Sales Line",
                        SalesLine."Document Type",
                        SalesLine."Document No.",
                        '',
                        0,
                        SalesLine."Line No.",
                        SalesLine."Qty. per Unit of Measure",
                        NeedQuantity / SalesLine."Qty. per Unit of Measure",
                        NeedQuantity, //PBCWEST2015mod
                        '',
                        TempEntrySummary."Lot No.");
                        CreateReservEntry.CreateEntry(SalesLine."No.",
                                                    SalesLine."Variant Code",
                                                    SalesLine."Location Code",
                                                    SalesLine.Description,
                                                    0D, SalesLine."Shipment Date", 0,
                                                    TempReservEntry."Reservation Status"::Surplus);
                        exit;
                    end else begin
                        NeedQuantity := NeedQuantity - TempEntrySummary."Total Available Quantity";
                        ReservEntry3.RESET;
                        ReservEntry3.SETCURRENTKEY("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        ReservEntry3.SETRANGE("Item No.", SalesLine."No.");
                        ReservEntry3.SETRANGE("Location Code", SalesLine."Location Code");
                        ReservEntry3.SETRANGE("Lot No.", TempEntrySummary."Lot No.");
                        ReservEntry3.SETRANGE("Source ID", SalesLine."Document No.");
                        ReservEntry3.SETRANGE("Source Ref. No.", SalesLine."Line No.");
                        ReservEntry3.SETFILTER("Quantity (Base)", '<0');
                        if ReservEntry3.FIND('-') then
                            repeat
                                if ReservEntry4.GET(ReservEntry3."Entry No.", true) then
                                    ReservEntry4.DELETE;
                                ReservEntry3.DELETE;
                            until ReservEntry3.NEXT = 0;
                        CreateReservEntry.CreateReservEntryFor(
                        DATABASE::"Sales Line",
                        SalesLine."Document Type",
                        SalesLine."Document No.",
                        '',
                        0,
                        SalesLine."Line No.",
                        SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity" / SalesLine."Qty. per Unit of Measure",
                        TempEntrySummary."Total Available Quantity",      
                        '',
                        TempEntrySummary."Lot No.");
                        CreateReservEntry.CreateEntry(SalesLine."No.",
                                                    SalesLine."Variant Code",
                                                    SalesLine."Location Code",
                                                    SalesLine.Description,
                                                    0D, SalesLine."Shipment Date", 0,
                                                    TempReservEntry."Reservation Status"::Surplus);
                    end;
                until TempEntrySummary.NEXT = 0;
            end;
        end; */
    end;

    var
        ImportProcess: Boolean;
        Text004: Label 'Counting records...';
        Text013: Label 'Lot No. is assigned, but still lack %1!';
        Text014: Label 'Lot information has been successfully applied!';
        Text015: Label 'There is already shipped quantity, please assign the Lot No. manually!';
        Text016: Label 'There is no available stock to assign!';
}