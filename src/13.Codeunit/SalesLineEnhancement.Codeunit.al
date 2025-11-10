codeunit 50002 "Sales Line Enhancement"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnCopyFromItemOnAfterCheck', '', true, true)]
    procedure Ext_LotInsert(var SalesLine: Record "Sales Line"; Item: Record Item)
    var
        Temprature1: Text[20];
        Temprature2: Text[20];
        Temprature3: Text[20];
        Temprature4: Text[20];
        Text50001: label '保管温度が-70度または-80度の為、休日前の場合には出荷できませんので出荷日を休日後に変更してください。';
    begin
        SalesLine.StorageTemprature := Item.StorageTemp;
        Temprature1 := '-70℃';
        Temprature2 := '-70';
        Temprature3 := '-80℃';
        Temprature4 := '-80';
        IF ((Item.StorageTemp = Temprature1) or (Item.StorageTemp = Temprature2) or
            (Item.StorageTemp = Temprature3) or (Item.StorageTemp = Temprature4)) then
            Message(Text50001 + '(' + Item.StorageTemp + ')');
    end;


    [EventSubscriber(ObjectType::Table, DATABASE::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', true, true)]
    procedure OnAfterInitFromSalesLine(SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line")
    begin
        SalesShptLine.EndUser := SalesLine.EndUser;
        SalesShptLine."EU Description" := SalesLine."EU Description";
        SalesShptLine."EU Division 1" := SalesLine."EU Division 1";
        SalesShptLine."EU Division 2" := SalesLine."EU Division 2";
        SalesShptLine."EU Division 3" := SalesLine."EU Division 3";
        SalesShptLine."Description(Bikou)" := SalesLine."Description(Bikou)";
        SalesShptLine."StorageTemprature" := SalesLine."StorageTemprature";
        SalesShptLine."ExternaDocumentNo." := SalesLine."ExternaDocumentNo.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure CopyDirectShippingCodeToShipmentHeader(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        SalesShptHeader: Record "Sales Shipment Header";
    begin
        if SalesShptHeader.Get(SalesHeader."No.") then begin
            SalesShptHeader."Direct Shipping Code" := SalesHeader."Direct Shipping Code";
            SalesShptHeader.Modify();
        end;
    end;




    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
    local procedure CopyCustomFieldsAfterPostSalesLine(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
    var
        SalesInvLine: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";

    begin
        // --- Sales Invoice Line へのコピー ---
        if SalesInvHeader.Get(SalesLine."Document No.") then begin
            SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
            SalesInvLine.SetRange("Line No.", SalesLine."Line No.");
            if SalesInvLine.FindFirst() then begin
                SalesInvLine."EndUser" := SalesLine.EndUser;
                SalesInvLine."EU Description" := SalesLine."EU Description";
                SalesInvLine."Description(Bikou)" := SalesLine."Description(Bikou)";
                SalesInvLine."StorageTemprature" := SalesLine."StorageTemprature";
                SalesInvLine."EU Division 1" := SalesLine."EU Division 1";
                SalesInvLine."EU Division 2" := SalesLine."EU Division 2";
                SalesInvLine."EU Division 3" := SalesLine."EU Division 3";
                SalesInvLine.Modify();
            end;
        end;

        // --- Sales Cr.Memo Line へのコピー ---
        if SalesCrMemoHeader.Get(SalesLine."Document No.") then begin
            SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
            SalesCrMemoLine.SetRange("Line No.", SalesLine."Line No.");
            if SalesCrMemoLine.FindFirst() then begin
                SalesCrMemoLine."Description(Bikou)" := SalesLine."Description(Bikou)";
                SalesCrMemoLine."StorageTemprature" := SalesLine."StorageTemprature";
                SalesCrMemoLine."ExternaDocumentNo." := SalesLine."ExternaDocumentNo.";
                SalesCrMemoLine.Modify();
            end;
        end;
    end;


}
