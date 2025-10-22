pageextension 50270 pageextension70000172 extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Bill-to Name 2"; "Bill-to Name 2")
            {
                CaptionML = JPN = '請求先名2';
            }
        }
    }

}

