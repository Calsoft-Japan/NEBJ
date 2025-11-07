report 50001 "Sales Cr. Memo Confirmation"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Sales Credit Memo Confirmation';

    //RDLCLayout = '.\10.ReportLayout\SalesCreditMemoConfirmation_NEBJ.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST("Credit Memo"));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'オプション';
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = '対話ログ';
                        ApplicationArea = All;
                    }
                }
            }
        }

    }
    var
        LogInteraction: Boolean;
}