pageextension 50004 "G/L Account Card Ext" extends "G/L Account Card"
{
    layout
    {
        addafter("Exchange Rate Adjustment")
        {
            field("Show FCY Amount"; Rec."Show FCY Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}