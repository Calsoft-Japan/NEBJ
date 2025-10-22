pageextension 50042 pageextension70000029 extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Contact")
        {
            field("Direct Shipping Code"; "Direct Shipping Code")
            {
                Caption = '直送コード';
            }
            field("Delivery Note Reference"; "Delivery Note Reference")
            {
                Caption = '納品書備考';
            }
        }

        addafter("Ship-to Contact")
        {
            field("Picking Advice"; "Picking Advice")
            {
                Caption = 'Pic指示';
            }
        }
    }
}