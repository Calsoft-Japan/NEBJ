pageextension 50102 pageextension70000002 extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Direct Shipping Code"; "Direct Shipping Code")
            {
                Caption = '直送コード';
            }
        }
    }
}

