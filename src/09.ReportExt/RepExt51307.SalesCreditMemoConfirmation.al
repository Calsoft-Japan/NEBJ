reportextension 51307 "SalesCreditMemoConfExt" extends "Standard Sales - Credit Memo"

{
    //RDLCLayout = 'src\10.ReportLayout\SalesCreditMemoConfirmation_NEBJ.rdlc';

    dataset
    {
        add("Header")
        {
            column(BillToName; "Bill-to Name") { }
            column(BillToName2; "Bill-to Name 2") { }
            column(BillToAddress; "Bill-to Address") { }
            column(BillToAddress2; "Bill-to Address 2") { }
            column(BillToPostCode; "Bill-to Post Code") { }
            column(BillToCity; "Bill-to City") { }
            column(BillToCustomerNo; "Bill-to Customer No.") { }
        }
    }
}
