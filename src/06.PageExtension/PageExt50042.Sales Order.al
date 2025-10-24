pageextension 50042 "Sales Order Ext" extends "Sales Order"
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
    actions
    {
        addafter(GetRecurringSalesLines_Promoted)
        {
            actionref(SalesOrderImport_Promoted; SalesOrderImport) { }
        }
        addafter(GetRecurringSalesLines)
        {
            action(SalesOrderImport)
            {
                ApplicationArea = All;
                Caption = 'Import Sales Order';
                Image = Import;
                RunObject = Report "Sales Order Import";
            }
        }
    }
}