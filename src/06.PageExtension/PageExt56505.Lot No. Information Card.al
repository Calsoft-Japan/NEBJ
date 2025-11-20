pageextension 56505 "Lot No. Information Card Ext" extends "Lot No. Information Card"
{

    layout
    {
        addafter("Certificate Number")
        {
            field("First Receiving Date"; Rec."First Receiving Date")
            {
                ApplicationArea = All;
            }
            field("Inspection Passed Date"; Rec."Inspection Passed Date")
            {
                ApplicationArea = All;
            }
            field("Expiration Date"; Rec."Expiration Date")
            {
                ApplicationArea = All;
            }
        }
    }
}

