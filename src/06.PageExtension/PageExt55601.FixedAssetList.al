pageextension 55600 "Fixed Asset Card Ext" extends "Fixed Asset Card"
{
    layout
    {
        addafter("Acquired")
        {
            field("Acquisition Date"; Rec."Acquisition Date")
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