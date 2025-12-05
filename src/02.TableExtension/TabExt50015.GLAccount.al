tableextension 50015 "G/L Account Ext" extends "G/L Account"
{
    fields
    {
        field(50000; "Name 2"; Text[50]) { }
        field(50001; "Block Drill Down"; Boolean) { }
        field(50002; "Access Level"; Option) { OptionMembers = Common,Protected,Special; }
        field(50003; "Show FCY Amount"; Boolean) { Caption = 'Show FCY Amount'; } //For NEBJ Detail Trial Balance Report
        field(50004; "Gen. Posting Type Filter"; Enum "General Posting Type") //For NEBJ Consumption Tax Report
        {
            Caption = 'Gen. Posting Type Filter';
            FieldClass = FlowFilter;
        }
        field(50005; "VAT BPG Filter"; Code[20]) //For NEBJ Consumption Tax Report
        {
            Caption = 'VAT BPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(50006; "VAT PPG Filter"; Code[20]) //For NEBJ Consumption Tax Report
        {
            Caption = 'VAT PPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Product Posting Group".Code;
        }
        field(50007; "Tax Amount"; Decimal) //For NEBJ Consumption Tax Report
        {
            Caption = 'Tax Amoumt';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter"), "VAT Bus. Posting Group" = field("VAT BPG Filter"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(50008; "VAT Amount"; Decimal) //For NEBJ Consumption Tax Report
        {
            Caption = 'VAT Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry"."VAT Amount" where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter"), "VAT Bus. Posting Group" = field("VAT BPG Filter"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(50009; "NonTax Amount"; Decimal) //For NEBJ Consumption Tax Report
        {
            Caption = 'Non Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter"), "VAT Bus. Posting Group" = field("VAT BPG Filter"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter"), "VAT Amount" = const(0)));
        }
    }
}
