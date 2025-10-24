codeunit 50002 "Sales Line Enhancement"
{
    [EventSubscriber(ObjectType::Table, DATABASE::"Sales Line", 'OnCopyFromItemOnAfterCheck', '', true, true)]
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
        IF ((Item.StorageTemp = Temprature1) OR (Item.StorageTemp = Temprature2) OR
            (Item.StorageTemp = Temprature3) OR (Item.StorageTemp = Temprature4)) THEN BEGIN
            MESSAGE(Text50001 + '(' + Item.StorageTemp + ')');
        END;
    end;
}
