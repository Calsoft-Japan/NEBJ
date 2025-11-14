report 50001 "NEBJ Sales Cr. Memo Conf."
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Sales Credit Memo Confirmation';
    PreviewMode = PrintLayout;

    DefaultLayout = RDLC;
    RDLCLayout = 'src\10.ReportLayout\SalesCreditMemoConfirmation_NEBJ.rdlc';

    dataset
    {
        dataitem(SH; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = CONST("Credit Memo"));

            RequestFilterFields = "Document Type", "No.", "Bill-to Customer No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Credit Memos';

            // Header columns
            column(No_SalesHdr; "No.") { }
            column(DocumentDate; "Document Date") { }
            column(BillToName; "Bill-to Name") { }
            column(BillToName2; "Bill-to Name 2") { }
            column(BillToAddress; "Bill-to Address") { }
            column(BillToAddress2; "Bill-to Address 2") { }
            column(BillToPostCode; "Bill-to Post Code") { }
            column(BillToCity; "Bill-to City") { }
            column(BillToCustomerNo; "Bill-to Customer No.") { }
            column(Direct_Shipping_Code; "Direct Shipping Code") { }
            column(PostingDate; "Posting Date") { }
            column(CurrencyCode; "Currency Code") { }

            // Company Information
            column(CompanyName; CompanyInfo."Name") { }
            column(CompanyAddress; CompanyInfo."Address") { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyCity; CompanyInfo."City") { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyFaxNo; CompanyInfo."Fax No.") { }
            column(CompanyPhoneNo; CompanyInfo."Phone No.") { }

            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(ItemNo_Line; "No.") { }
                column(Document_No_; "Document No.") { }
                column(Description_Line; Description) { }
                column(EU_Description; "EU Description") { }
                column(Bikou_Description; "Description(Bikou)") { }
                column(EU_Division_1; "EU Division 1") { }
                column(Quantity_Line; Quantity) { }
                column(UnitPrice; "Unit Price") { }
                column(LineDiscountPercent_Line; "Line Discount %") { }
                column(AmountIncludingVAT_Line; "Amount Including VAT") { }
                column(LineAmountExclVAT; "Line Amount") { }
                column(NetUnitPrice; NetUnitPriceTxt) { }
                column(StorageTemprature; "StorageTemprature") { }
                column(ExternalDocumentNo; "ExternaDocumentNo.") { }
                column(TotalAmountExclVAT; Amount) { }
                column(LineTypeTxt; Format(Type)) { }  // returns "Comment", "Item", etc.
                column(TypeInt; Type) { }// returns integer value of Type enum


                trigger OnAfterGetRecord()
                begin
                    // --- Calculate Net Unit Price (Line Amount Excl. Tax / Quantity) ---
                    if Quantity <> 0 then
                        NetUnitPriceTxt := ("Line"."Line Amount" / "Line".Quantity)
                    else
                        NetUnitPriceTxt := 0;

                    // --- Assign Line Amount Excl. VAT to GetLineAmountExclVATTxt ---
                    //GetLineAmountExclVATTxt := Amount;
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = true;
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
        NetUnitPriceTxt: Decimal;
        CompanyInfo: Record "Company Information";
        LogInteraction: Boolean;

    trigger OnPreReport()
    begin
        // Initialize Company Information
        CompanyInfo.Get();
    end;
}
