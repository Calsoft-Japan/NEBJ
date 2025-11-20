pageextension 50097 "Sales Credit Memo" extends "Sales Credit Memo"
{
    actions
    {
        addlast(Processing)
        {
            action(Print)
            {
                Caption = 'Print';
                Ellipsis = true;
                Image = Print;
                ApplicationArea = All;

                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SH: Record "Sales Header";
                begin

                    CurrPage.SetSelectionFilter(SH);
                    Report.RunModal(50001, true, true, SH);

                end;
            }
        }
    }

}
