tableextension 50233 "Item Journal Batch Ext" extends "Item Journal Batch"
{
    fields
    {
        field(50000; "Default Gen. Bus. Posting Grp."; Code[20])
        {
            Caption = 'Default Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
    }
}
