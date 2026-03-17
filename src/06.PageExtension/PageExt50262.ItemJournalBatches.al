pageextension 50062 "Item Journal Batches Ext" extends "Item Journal Batches"
{
    layout
    {
        addafter("Reason Code")
        {
            field("Default Gen. Bus. Posting Gr."; Rec."Default Gen. Bus. Posting Gr.")
            {
                ApplicationArea = All;
                Caption = '規定一般ビジネス転記グループ';
            }
        }
    }
}