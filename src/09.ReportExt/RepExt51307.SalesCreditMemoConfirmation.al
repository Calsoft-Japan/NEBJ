reportextension 51307 "SalesCreditMemoConfExt" extends "Standard Sales - Credit Memo"

{
    //RDLCLayout = 'src\10.ReportLayout\SalesCreditMemoConfirmation_NEBJ.rdlc';

    dataset
    {
        add("Header")
        {
            column(No_SalesHdr; "No.") { }
            column(BillToName; "Bill-to Name") { }
            column(BillToName2; "Bill-to Name 2") { }
            column(BillToAddress; "Bill-to Address") { }
            column(BillToAddress2; "Bill-to Address 2") { }
            column(BillToPostCode; "Bill-to Post Code") { }
            column(BillToCity; "Bill-to City") { }
            column(BillToCustomerNo; "Bill-to Customer No.") { }
            column(Direct_Shipping_Code; "Direct Shipping Code") { }
            column(PostingDate; "Posting Date") { }

            // Company Information
            column(CompanyName; CompanyInfo."Name") { }
            column(CompanyAddress; CompanyInfo."Address") { }
            column(CompanyCity; CompanyInfo."City") { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyFaxNo; CompanyInfo."Fax No.") { }
        }
        add(Line)
        {
            column(NetUnitPrice; NetUnitPriceTxt) { }
            column(StorageTemprature; "StorageTemprature") { }
            column(GetLineAmountExclVAT; GetLineAmountExclVATTxt) { }
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                // --- Calculate Net Unit Price (Line Amount Excl. Tax / Quantity) ---
                if "Line".Quantity <> 0 then
                    NetUnitPriceTxt := ("Line".Amount / "Line".Quantity)
                else
                    NetUnitPriceTxt := 0;

                // --- Assign Line Amount Excl. VAT to GetLineAmountExclVATTxt ---
                GetLineAmountExclVATTxt := "Line".Amount;
            end;
        }
    }
    var
        NetUnitPriceTxt: Decimal;
        GetLineAmountExclVATTxt: Decimal;
}
