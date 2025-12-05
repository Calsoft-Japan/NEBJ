report 50004 "NEBJ Consum. Tax Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\08.Report\NEBJConTaxSummary.rdlc';
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
            column(CompName; CompInfo.Name) { }
            column(DontPrint; DontPrint) { }
            column(RepGLFilters; GLAccCapLbl + ': ' + GLFilter) { }
            column(RepVATFilters; VatGroupLbl + ': ' + VATFilter) { }
            dataitem("VAT Posting Setup"; "VAT Posting Setup")
            {
                DataItemTableView = sorting("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                RequestFilterFields = "VAT Bus. Posting Group", "VAT Prod. Posting Group";
                column(GLAccNo; "G/L Account"."No.") { }
                column(GLAccName; "G/L Account".Name) { }
                column(GLVBPG; "VAT Bus. Posting Group") { }
                column(GLVPPG; "VAT Prod. Posting Group") { }
                column(NetAmt; NetAmount) { AutoFormatType = 1; }
                column(TaxAmt; TaxAmount) { AutoFormatType = 1; }
                column(NonTaxAmt; NonTaxAmt) { AutoFormatType = 1; }
                column(SalesTaxAmt; SaleTaxAmt) { AutoFormatType = 1; }
                column(PurchTaxAmt; PurchTaxAmt) { AutoFormatType = 1; }
                column(TaxPer; "VAT Posting Setup"."VAT %") { DecimalPlaces = 0 : 2; }
                column(PerString; PercentLbl) { }
                trigger OnAfterGetRecord()
                begin
                    "G/L Account".SetRange("Gen. Posting Type Filter");
                    "G/L Account".SetRange("VAT BPG Filter", "VAT Posting Setup"."VAT Bus. Posting Group");
                    "G/L Account".SetRange("VAT PPG Filter", "VAT Posting Setup"."VAT Prod. Posting Group");
                    CalcAmounts();
                    if (NetAmount = 0) and (TaxAmount = 0) and (SaleTaxAmt = 0) and
                       (PurchTaxAmt = 0) and (NonTaxAmt = 0) and DontPrint then
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
        GLFilter := CopyStr("G/L Account".GetFilters(), 1, MaxStrLen(GLFilter));
        VATFilter := CopyStr("VAT Posting Setup".GetFilters(), 1, MaxStrLen(VATFilter));
    end;

    var
        GLSetup: Record "General Ledger Setup";
        CompInfo: Record "Company Information";
        GLFilter: Text[250];
        AccDescription: Text[80];
        VATFilter: Text[250];
        NetAmount: Decimal;
        TaxAmount: Decimal;
        NonTaxAmt: Decimal;
        SaleTaxAmt: Decimal;
        PurchTaxAmt: Decimal;
        DontPrint: Boolean;
        RepCapLbl: label 'Consumption Tax Sheet';
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
        PercentLbl: label '%', Locked = true;

    procedure CalcAmounts()
    begin
        NetAmount := 0;
        TaxAmount := 0;
        NonTaxAmt := 0;
        SaleTaxAmt := 0;
        PurchTaxAmt := 0;

        "G/L Account".SetRange("Gen. Posting Type Filter");
        "G/L Account".CalcFields("Tax Amount");
        NetAmount := "G/L Account"."Tax Amount";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::" ");
        "G/L Account".CalcFields("NonTax Amount", "VAT Amount");
        NonTaxAmt += "G/L Account"."NonTax Amount";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::Sale);
        "G/L Account".CalcFields("NonTax Amount", "VAT Amount");
        NonTaxAmt += "G/L Account"."NonTax Amount";
        SaleTaxAmt := "G/L Account"."VAT Amount";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::Purchase);
        "G/L Account".CalcFields("NonTax Amount", "VAT Amount");
        NonTaxAmt += "G/L Account"."NonTax Amount";
        PurchTaxAmt := "G/L Account"."VAT Amount";

        PurchTaxAmt := AmountRounding(PurchTaxAmt);
        SaleTaxAmt := AmountRounding(SaleTaxAmt);
        NetAmount := AmountRounding(NetAmount);
        NonTaxAmt := AmountRounding(NonTaxAmt);

        TaxAmount := NetAmount - NonTaxAmt;
        /* if TaxAmount <> 0 then
            TaxPer := Round((SaleTaxAmt + PurchTaxAmt) / TaxAmount * 100, 0.01, '=')
        else
            TaxPer := 0; */
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

