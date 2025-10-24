pageextension 59305 "Sales Order List Ext" extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Bill-to Name 2"; Rec."Bill-to Name 2")
            {
                ApplicationArea = All;
                Caption = '請求先名2';
            }
        }
    }

}

