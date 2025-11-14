codeunit 50002 "Sales Enhancement"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnCopyFromItemOnAfterCheck', '', true, true)]
    procedure Ext_LotInsert(var SalesLine: Record "Sales Line"; Item: Record Item)
    var
        Temprature1: Text[20];
        Temprature2: Text[20];
        Temprature3: Text[20];
        Temprature4: Text[20];
        Text50001: Label '保管温度が-70度または-80度の為、休日前の場合には出荷できませんので出荷日を休日後に変更してください。';
    begin
        SalesLine.StorageTemprature := Item.StorageTemp;
        Temprature1 := '-70℃';
        Temprature2 := '-70';
        Temprature3 := '-80℃';
        Temprature4 := '-80';
        if ((Item.StorageTemp = Temprature1) or (Item.StorageTemp = Temprature2) or
            (Item.StorageTemp = Temprature3) or (Item.StorageTemp = Temprature4)) then
            Message(Text50001 + '(' + Item.StorageTemp + ')');
    end;

    /*
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
        local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
        begin
            SalesHeader.CalcFields("Direct Shipping Code");
        end;


        [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', true, true)]
        procedure CopyFieldsToShipmentLine(SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line")
        begin
            SalesShptLine.EndUser := SalesLine.EndUser;
            SalesShptLine."EU Description" := SalesLine."EU Description";
        end;

        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
        local procedure CopyFieldsToInvoiceLine(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
        var
            SalesInvHeader: Record "Sales Invoice Header";
            SalesInvLine: Record "Sales Invoice Line";
        begin
            SalesInvHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            if SalesInvHeader.FindSet() then
                repeat
                    SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
                    SalesInvLine.SetRange("Line No.", SalesLine."Line No.");
                    if SalesInvLine.FindFirst() then begin
                        SalesInvLine.EndUser := SalesLine.EndUser;
                        SalesInvLine.Description := SalesLine.Description;
                        SalesInvLine.StorageTemprature := SalesLine.StorageTemprature;
                        SalesInvLine."EU Description" := SalesLine."EU Description";
                        SalesInvLine."EU Division 1" := SalesLine."EU Division 1";
                        SalesInvLine."EU Division 2" := SalesLine."EU Division 2";
                        SalesInvLine."EU Division 3" := SalesLine."EU Division 3";
                        SalesInvLine.Modify(false);
                    end;
                until SalesInvHeader.Next() = 0;
        end;

        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
        local procedure CopyFieldsToCrMemoLine(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
        var
            SalesCrMemoHeader: Record "Sales Cr.Memo Header";
            SalesCrMemoLine: Record "Sales Cr.Memo Line";
        begin
            SalesCrMemoHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            if SalesCrMemoHeader.FindSet() then
                repeat
                    SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
                    SalesCrMemoLine.SetRange("Line No.", SalesLine."Line No.");
                    if SalesCrMemoLine.FindFirst() then begin
                        SalesCrMemoLine.Description := SalesLine.Description;
                        SalesCrMemoLine.StorageTemprature := SalesLine.StorageTemprature;
                        SalesCrMemoLine."ExternaDocumentNo." := SalesLine."ExternaDocumentNo.";
                        SalesCrMemoLine.Modify(false);
                    end;
                until SalesCrMemoHeader.Next() = 0;
        end;

    */
}

