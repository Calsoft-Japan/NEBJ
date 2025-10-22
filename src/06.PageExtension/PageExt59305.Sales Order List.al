pageextension 59305 pageextension70000172 extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Bill-to Name 2"; "Bill-to Name 2")
            {
                Caption = '請求先名2';
            }
        }
    }

}

