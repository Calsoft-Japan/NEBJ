pageextension 50000 "Purch. Order Ext" extends "Purchase Order"
{
    actions
    {
        addafter(CopyDocument_Promoted)
        {
            actionref(ImportPurchOrder_Promoted; ImportPurchOrder) { }
        }
        addafter(CopyDocument)
        {
            action(ImportPurchOrder)
            {
                ApplicationArea = All;
                Caption = 'Import Purch. Order';
                Image = Import;
                RunObject = Page "Purchase Order Import";
            }
        }
    }
}