pageextension 50262 "Item Journal Batches Ext" extends "Item Journal Batches"
{
    layout
    {
        addafter("Reason Code")
        {
            field("Default Gen. Bus. Posting Grp."; Rec."Default Gen. Bus. Posting Grp.")
            {
                ApplicationArea = All;
            }
        }
    }
}