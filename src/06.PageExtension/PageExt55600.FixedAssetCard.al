pageextension 55601 "Fixed Asset List Ext" extends "Fixed Asset List"
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