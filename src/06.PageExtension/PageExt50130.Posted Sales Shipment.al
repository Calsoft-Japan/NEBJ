pageextension 50130 "Posted Sales Shipment Ext" extends "Posted Sales Shipment"
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

