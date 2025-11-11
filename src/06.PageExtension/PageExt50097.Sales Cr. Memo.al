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
                    RequestPage: Page "Sales Cr. Memo Report Request";
                begin
                    RequestPage.RunModal();
                end;
            }
        }
    }
}
