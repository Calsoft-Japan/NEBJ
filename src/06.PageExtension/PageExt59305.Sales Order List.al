pageextension 59305 pageextension70000172 extends "Sales Order List"
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

