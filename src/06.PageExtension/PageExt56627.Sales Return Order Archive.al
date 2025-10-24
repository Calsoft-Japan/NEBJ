pageextension 56627 "SalesReturnOrderArchiveExt" extends "Sales Return Order Archive"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Direct Shipping Code"; Rec."Direct Shipping Code")
            {
                ApplicationArea = All;
                Caption = '直送コード';
            }
            field("Delivery Time"; Rec."Delivery Time")
            {
                ApplicationArea = All;
                Caption = '納品先配達時間指定';
            }
            field("Picking Advice"; Rec."Picking Advice")
            {
                ApplicationArea = All;
                Caption = 'Pic指示';
            }
            field("Delivery Note Reference"; Rec."Delivery Note Reference")
            {
                ApplicationArea = All;
                Caption = '納品書備考 ';
            }
        }
    }
}

