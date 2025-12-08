pageextension 55600 "Fixed Asset Card Ext" extends "Fixed Asset Card"
{
    layout
    {
        addafter("Acquired")
        {
            field("Acquired Date"; Rec."Acquired Date")
            {
                ApplicationArea = All;
            }
            field("Acquisition Cost"; Rec."Acquisition Cost")
            {
                ApplicationArea = All;
            }
        }
    }
}