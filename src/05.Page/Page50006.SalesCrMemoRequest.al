page 50006 "Sales Cr. Memo Report Request"
{
    Caption = 'Sales Credit Memo Report Request';
    PageType = Card;
    SourceTable = "Sales Cr.Memo Header";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Options)
            {
                field(LogInteraction; LogInteraction)
                {
                    Caption = 'Log Interaction';
                    ApplicationArea = All;
                }
            }
            group(Filters)
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ApplicationArea = All;
                trigger OnAction()
                var
                    CrMemoHdr: Record "Sales Cr.Memo Header";
                begin
                    CurrPage.SetSelectionFilter(CrMemoHdr);
                    if CrMemoHdr.IsEmpty() then
                        CrMemoHdr.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Standard Sales - Credit Memo", true, true, CrMemoHdr);
                end;
            }
        }
    }

    var
        LogInteraction: Boolean;
}
