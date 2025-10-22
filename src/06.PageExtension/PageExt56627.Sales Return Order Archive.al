pageextension 56627 pageextension70000048 extends "Sales Return Order Archive"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Direct Shipping Code"; "Direct Shipping Code")
            {
                Caption = '直送コード';
            }
            field("Delivery Time"; "Delivery Time")
            {
                Caption = '納品先配達時間指定';
            }
            field("Picking Advice"; "Picking Advice")
            {
                Caption = 'Pic指示';
            }
            field("Delivery Note Reference"; "Delivery Note Reference")
            {
                Caption = '納品書備考 ';
            }
        }
    }
}

