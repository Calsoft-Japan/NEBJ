pageextension 55601 "Fixed Asset List Ext" extends "Fixed Asset List"
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