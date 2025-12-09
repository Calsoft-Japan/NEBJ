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
        Text50002: Label '毒劇指定品/直送手配不可品';
    begin
        SalesLine.StorageTemprature := Item.StorageTemp;
        Temprature1 := '-70℃';
        Temprature2 := '-70';
        Temprature3 := '-80℃';
        Temprature4 := '-80';
        if ((Item.StorageTemp = Temprature1) or (Item.StorageTemp = Temprature2) or
            (Item.StorageTemp = Temprature3) or (Item.StorageTemp = Temprature4)) then
            Message(Text50001 + '(' + Item.StorageTemp + ')');

        if Item."Toxic-KBN" then
            Message(Text50002 + ' (Item No: ' + Item."No." + ')');
    end;

}

