pageextension 50042 pageextension70000029 extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Contact")
        {
            field("Direct Shipping Code"; Rec."Direct Shipping Code")
            {
                ApplicationArea = All;
                Caption = '直送コード';
            }
            field("Delivery Note Reference"; Rec."Delivery Note Reference")
            {
                ApplicationArea = All;
                Caption = '納品書備考';
            }
        }

        addafter("Ship-to Contact")
        {
            field("Picking Advice"; Rec."Picking Advice")
            {
                ApplicationArea = All;
                Caption = 'Pic指示';
            }
        }
    }
}