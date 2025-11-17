tableextension 56505 "Lot No. Information Ext" extends "Lot No. Information"
{
    fields
    {
        field(50001; "First Receiving Date"; Date) { CaptionML = JPN = '初期入荷日'; }
        field(50002; "Inspection Passed Date"; Date) { CaptionML = JPN = 'アッセイデート'; }
        field(50003; "Expiration Date"; Date) { CaptionML = JPN = '有効期限日付'; } // This is flow field 
    }
}

