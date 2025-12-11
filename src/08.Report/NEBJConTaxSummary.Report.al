report 50004 "NEBJ Consum. Tax Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\08.Report\NEBJConTaxSummary.rdlc';
    Caption = 'Consumption Tax Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("Gen. Posting Type", "VAT Bus. Posting Group", "VAT Prod. Posting Group", "G/L Account No.", "Posting Date")
                                where("Gen. Posting Type" = filter(Purchase | Sale));
            RequestFilterFields = "Posting Date";
            column(RepCapLbl; RepCapLbl) { }
            column(PageCapLbl; PageCapLbl) { }
            column(OutDateLbl; OutDateLbl) { }
            column(PostTypeLbl; PostTypeLbl) { }
            column(VATIdfLbl; VATIdfLbl) { }
            column(AccNoLbl; AccNoLbl) { }
            column(AccNameLbl; AccNameLbl) { }
            column(TotAmtLbl; TotAmtLbl) { }
            column(NonTaxAmtLbl; NonTaxAmtLbl) { }
            column(AmtIncVATLbl; AmtIncVATLbl) { }
            column(AmtExclVATLbl; AmtExclVATLbl) { }
            column(VATAmountLbl; VATAmountLbl) { }
            column(TotalLbl; TotalLbl) { }
            column(TotalTaxLbl; TotalTaxLbl) { }
            column(VATPerLbl; VATPerLbl) { }
            column(ActVATPerLbl; ActVATPerLbl) { }
            column(PeriodTxt; PeriodLbl + ': ' + DateFilter) { }
            column(GenPostType; "Gen. Posting Type") { }
            column(VATIdfTxt; VATPostSetup."VAT Identifier") { }
            column(VATPerTxt; VATPostSetup."VAT %") { DecimalPlaces = 0 : 2; }
            column(PerString; PercentLbl) { }
            column(VATPostGrps; '(' + "VAT Bus. Posting Group" + '/' + "VAT Prod. Posting Group" + ')') { }
            column(GLAccNo; "G/L Account No.") { }
            column(GLAccName; GLAccount.Name) { }
            column(TotAmount; Amount + "VAT Amount") { AutoFormatType = 1; }
            column(NonTaxAmt; NonTaxAmt) { AutoFormatType = 1; }
            column(AmtIncVAT; Amount + "VAT Amount") { AutoFormatType = 1; }
            column(AmtExclVAT; Amount) { AutoFormatType = 1; }
            column(VATAmount; "VAT Amount") { AutoFormatType = 1; }
            trigger OnAfterGetRecord()
            begin
                if GLAccount.Get("G/L Account No.") then;
                if VATPostSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then;
            end;
        }
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
    end;

    trigger OnPreReport()
    begin
        DateFilter := "G/L Entry".GetFilter("Posting Date");
    end;

    var
        GLAccount: Record "G/L Account";
        GLSetup: Record "General Ledger Setup";
        VATPostSetup: Record "VAT Posting Setup";
        DateFilter: Text[250];
        VATSetupTxt: Text[250];
        TotAmt: Decimal;
        NonTaxAmt: Decimal;
        AmtIncVAT: Decimal;
        AmtExclVAT: Decimal;
        VATAmount: Decimal;
        DontPrint: Boolean;
        RepCapLbl: label 'Consumption Tax Report';
        PageCapLbl: label 'Page';
        OutDateLbl: Label 'Output Date';
        PeriodLbl: Label 'Period';
        PostTypeLbl: Label 'Gen. Posting Type';
        VATIdfLbl: Label 'VAT Identifier';
        AccNoLbl: label 'Account No.';
        AccNameLbl: label 'Account Name';
        VatGroupLbl: label 'VAT Posting Setup';
        TotAmtLbl: Label 'Total Amount';
        NonTaxAmtLbl: label 'Amt. Without Tax';
        AmtIncVATLbl: Label 'Amtount Inc. VAT';
        AmtExclVATLbl: Label 'Amount Excl. VAT';
        VATAmountLbl: Label 'VAT Amount';
        TotalLbl: Label 'Total';
        TotalTaxLbl: Label 'Total Tax';
        VATPerLbl: Label 'VAT %';
        ActVATPerLbl: Label 'Actual VAT %';
        PercentLbl: label '%', Locked = true;

    /* procedure CalcAmounts()
    begin
        NetAmount := 0;
        TaxAmount := 0;
        NonTaxAmt := 0;
        SaleTaxAmt := 0;
        PurchTaxAmt := 0;

        "G/L Account".SetRange("Gen. Posting Type Filter");
        "G/L Account".CalcFields("Amt. Inc. VAT");
        NetAmount := "G/L Account"."Amt. Inc. VAT";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::" ");
        "G/L Account".CalcFields("Amt. Excl. VAT", "VAT Amount");
        NonTaxAmt += "G/L Account"."Amt. Excl. VAT";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::Sale);
        "G/L Account".CalcFields("Amt. Excl. VAT", "VAT Amount");
        NonTaxAmt += "G/L Account"."Amt. Excl. VAT";
        SaleTaxAmt := "G/L Account"."VAT Amount";

        "G/L Account".SetRange("Gen. Posting Type Filter", "G/L Account"."Gen. Posting Type Filter"::Purchase);
        "G/L Account".CalcFields("Amt. Excl. VAT", "VAT Amount");
        NonTaxAmt += "G/L Account"."Amt. Excl. VAT";
        PurchTaxAmt := "G/L Account"."VAT Amount";

        PurchTaxAmt := AmountRounding(PurchTaxAmt);
        SaleTaxAmt := AmountRounding(SaleTaxAmt);
        NetAmount := AmountRounding(NetAmount);
        NonTaxAmt := AmountRounding(NonTaxAmt);

        TaxAmount := NetAmount - NonTaxAmt;
    end; */

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

