report 50004 "NEBJ Consumpt Tax Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\08.Report\NEBJConsumptTaxSummary.rdlc';
    Caption = 'Consumption Tax Summary';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.") where("Account Type" = const(Posting));
            RequestFilterFields = "No.", "Date Filter", "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(RepCapLbl; RepCapLbl) { }
            column(PageCapLbl; PageCapLbl) { }
            column(RateCapLbl; RateCapLbl) { }
            column(AccNoCapLbl; AccNoCapLbl) { }
            column(NameCapLbl; NameCapLbl) { }
            column(VBPGCapLbl; VBPGCapLbl) { }
            column(VPPGCapLbl; VPPGCapLbl) { }
            column(NetAmtLbl; NetAmtLbl) { }
            column(TaxAmtLbl; TaxAmtLbl) { }
            column(NonTaxAmtLbl; NonTaxAmtLbl) { }
            column(SaleRcvdCTaxLbl; SaleRcvdCTaxLbl) { }
            column(SusPaidCTaxLbl; SusPaidCTaxLbl) { }
            column(CompanyInfo_Name; CompInfo.Name) { }
            column(DontPrint; DontPrint) { }
            column(RepGLFilters; GLAccCapLbl + ': ' + GLFilter) { }
            column(RepVATFilters; VatGroupLbl + ': ' + VATFilter) { }
            dataitem("VAT Posting Setup"; "VAT Posting Setup")
            {
                DataItemTableView = sorting("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                RequestFilterFields = "VAT Bus. Posting Group", "VAT Prod. Posting Group";
                column(GLAccNo; "G/L Account"."No.") { }
                column(GLAccName; AccDescription) { }
                column(GLVBPG; "VAT Bus. Posting Group") { }
                column(GLVPPG; "VAT Prod. Posting Group") { }
                column(NetAmt; NetAmount) { AutoFormatType = 1; }
                column(TaxAmt; TaxableAmount) { AutoFormatType = 1; }
                column(NonTaxAmt; NonTaxableAmount) { AutoFormatType = 1; }
                column(SalesTaxAmt; TaxAmountSale) { AutoFormatType = 1; }
                column(PurchTaxAmt; TaxAmountPurch) { AutoFormatType = 1; }
                column(TaxPer; "VAT Posting Setup"."VAT %") { DecimalPlaces = 0 : 2; }
                column(PerString; PercentLbl) { }
                trigger OnAfterGetRecord()
                begin
                    //"G/L Account".SETRANGE("Gen. Posting Type Filter TJP");
                    //"G/L Account".SETRANGE("VAT BPG Filter TJP", "VAT Posting Setup"."VAT Bus. Posting Group");
                    //"G/L Account".SETRANGE("VAT PPG Filter TJP", "VAT Posting Setup"."VAT Prod. Posting Group");
                    Calculate();
                    if (NetAmount = 0) and (TaxableAmount = 0) and (TaxAmountSale = 0) and
                       (TaxAmountPurch = 0) and (NonTaxableAmount = 0) and DontPrint then
                        CurrReport.Skip();
                end;
            }
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
                    Caption = 'Options';
                    field(DontPrint; DontPrint)
                    {
                        ApplicationArea = All;
                        Caption = 'No Zero Lines';
                        ToolTip = 'Specifies for exclude zero lines';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
        CompInfo.Get();
    end;

    trigger OnPreReport()
    begin
        GLFilter := copystr("G/L Account".GetFilters(), 1, MaxStrLen(GLFilter));
        VATFilter := copystr("VAT Posting Setup".GetFilters(), 1, MaxStrLen(VATFilter));
    end;

    var
        GLSetup: Record "General Ledger Setup";
        CompInfo: Record "Company Information";
        GLFilter: Text[250];
        AccDescription: Text[80];
        VATFilter: Text[250];
        NetAmount: Decimal;
        TaxableAmount: Decimal;
        NonTaxableAmount: Decimal;
        TaxAmountSale: Decimal;
        TaxAmountPurch: Decimal;
        "Tax%": Decimal;
        DontPrint: Boolean;
        RepCapLbl: label 'Consumption Tax Summary';
        GLAccCapLbl: label 'G/L Account';
        VatGroupLbl: label 'VAT Posting Setup';
        PageCapLbl: label 'Page';
        RateCapLbl: label 'Rate';
        AccNoCapLbl: label 'No.';
        NameCapLbl: label 'Name';
        VBPGCapLbl: label 'B U S';
        VPPGCapLbl: label 'P R O';
        NetAmtLbl: label 'Net Amount';
        TaxAmtLbl: label 'Tax Amt.';
        NonTaxAmtLbl: label 'NonTax Amt.';
        SaleRcvdCTaxLbl: label 'SaleRcvdCTax';
        SusPaidCTaxLbl: label 'SuspPaidCTax';
        PercentLbl: label '%';

    procedure Calculate()
    begin
        NetAmount := 0;
        TaxableAmount := 0;
        NonTaxableAmount := 0;
        TaxAmountSale := 0;
        TaxAmountPurch := 0;

        /* "G/L Account".SETRANGE("Gen. Posting Type Filter TJP");
        "G/L Account".CALCFIELDS("Amount (for Tax) TJP");
        NetAmount := "G/L Account"."Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::" ");
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::Sale);
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";
        TaxAmountSale := "G/L Account"."VAT Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::Purchase);
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";
        TaxAmountPurch := "G/L Account"."VAT Amount (for Tax) TJP"; */

        TaxAmountPurch := AmountRounding(TaxAmountPurch);
        TaxAmountSale := AmountRounding(TaxAmountSale);
        NetAmount := AmountRounding(NetAmount);
        NonTaxableAmount := AmountRounding(NonTaxableAmount);

        TaxableAmount := NetAmount - NonTaxableAmount;
        if TaxableAmount <> 0 then
            "Tax%" := Round((TaxAmountSale + TaxAmountPurch) / TaxableAmount * 100, 0.01, '=')
        else
            "Tax%" := 0;
    end;

    procedure AmountRounding(Amount: Decimal): Decimal
    var
        Direction: Text[2];
    begin
        case GLSetup."Inv. Rounding Type (LCY)" of
            GLSetup."Inv. Rounding Type (LCY)"::Up:
                Direction := '>';
            GLSetup."Inv. Rounding Type (LCY)"::Down:
                Direction := '<';
            else
                Direction := '=';
        end;
        exit(Round(Amount, GLSetup."Amount Rounding Precision", Direction));
    end;
}

