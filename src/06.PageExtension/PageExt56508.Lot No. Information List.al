pageextension 56508 "Lot No. Information List Ext" extends "Lot No. Information List"
{
    layout
    {
        addafter("Expired Inventory")
        {
            field("Inspection Passed Date"; Rec."Inspection Passed Date")
            {
                ApplicationArea = All;
            }

            field("First Receiving Date"; Rec."First Receiving Date")
            {
                ApplicationArea = All;
            }
        }
    }
}

