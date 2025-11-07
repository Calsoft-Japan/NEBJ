pageextension 50097 "Sales Credit Memo Ext" extends "Sales Credit Memo"
{
    actions
    {
        addlast(Reporting)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SalesCrMemoHdr: Record "Sales Cr.Memo Header";
                begin
                    CurrPage.SetSelectionFilter(SalesCrMemoHdr);
                    Report.RunModal(50001, true, true, SalesCrMemoHdr);
                end;
            }
        }
    }
}
