tableextension 55600 "Fixed Asset Ext" extends "Fixed Asset"
{
    fields
    {
        field(50000; "Acquired Date"; Date)
        {
            Caption = '取得日';
        }

        field(50001; "Acquisition Cost"; Decimal)
        {
            Caption = '取得価額';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
    }
}