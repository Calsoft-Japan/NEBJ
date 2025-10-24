pageextension 50130 pageextension70000002 extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Direct Shipping Code"; Rec."Direct Shipping Code")
            {
                ApplicationArea = All;
                Caption = '直送コード';
            }
        }
    }
}

