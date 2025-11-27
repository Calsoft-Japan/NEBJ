pageextension 50003 "Price List Lines Ext" extends "Price List Lines"
{
    layout
    {
        addafter("Product No.")
        {
            field(EndUser; Rec.EndUser)
            {
                ApplicationArea = All;
            }
        }
    }
}