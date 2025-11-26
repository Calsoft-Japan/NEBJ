report 50003 "NEBJ Detail Trial Balance"
{
    // Copied from report 4: "Detail Trial Balance"
    DefaultLayout = RDLC;
    RDLCLayout = 'src\08.Report\NEBJDetailTrialBalance.rdlc';
    AdditionalSearchTerms = 'payment due,order status';
    ApplicationArea = Basic, Suite;
    Caption = 'NEBJ Detail Trial Balance';
    PreviewMode = PrintLayout;
    UsageCategory = None;
    DataAccessIntent = ReadOnly;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = where("Account Type" = const(Posting));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Income/Balance", "Debit/Credit", "Date Filter";
            column(RepCaption; DetailTrialBalCaptionLbl) { }
            column(PageCaption; PageCaptionLbl) { }
            column(BalanceLbl; BalanceCaptionLbl) { }
            column(PeriodLbl; PeriodCaptionLbl) { }
            column(OnlyCorrectionLbl; OnlyCorrectionsCaptionLbl) { }
            column(NetChangeLbl; NetChangeCaptionLbl) { }
            column(DrAmtLbl; GLEntryDebitAmtCaptionLbl) { }
            column(CrAmtLbl; GLEntryCreditAmtCaptionLbl) { }
            column(GLBalLbl; GLBalCaptionLbl) { }
            column(AddCurrAmtLbl; AddCurrAmtLbl) { }
            column(BalAccNoLbl; BalAccNoLbl) { }
            column(BalAccNameLbl; BalAccNameLbl) { }
            column(PeriodDateFilter; StrSubstNo(Text000, GLDateFilter)) { }
            column(CompanyName; COMPANYPROPERTY.DisplayName()) { }
            column(ExcludeBalanceOnly; ExcludeBalanceOnly) { }
            column(PrintReversedEntries; PrintReversedEntries) { }
            column(PageGroupNo; PageGroupNo) { }
            column(PrintOnlyOnePerPage; PrintOnlyOnePerPage) { }
            column(PrintClosingEntries; PrintClosingEntries) { }
            column(PrintOnlyCorrections; PrintOnlyCorrections) { }
            column(GLAccTblCaption; TableCaption + ': ' + GLFilter) { }
            column(GLFilter; GLFilter) { }
            column(GLAccNo; "No.") { }
            column(EmptyString; '') { }
            dataitem(PageCounter; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(GLAccName; "G/L Account".Name) { }
                column(StartBalance; StartBalance) { AutoFormatType = 1; }
                column(StartBalAddCurr; StartBalAddCurr) { AutoFormatType = 1; }
                dataitem("G/L Entry"; "G/L Entry")
                {
                    DataItemLink = "G/L Account No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Business Unit Code" = field("Business Unit Filter"), "Dimension Set ID" = field("Dimension Set ID Filter");
                    DataItemLinkReference = "G/L Account";
                    DataItemTableView = sorting("G/L Account No.", "Posting Date");
                    column(VATAmt_GLEntry; "VAT Amount") { IncludeCaption = true; }
                    column(DrAmt; "Debit Amount") { }
                    column(CrAmt; "Credit Amount") { }
                    column(PostDate; Format("Posting Date")) { }
                    column(DocNo; "Document No.") { }
                    column(BalAccNo; "Bal. Account No.") { }
                    column(BalAccName; BalAccName) { }
                    column(ExtDocNo; "External Document No.") { IncludeCaption = true; }
                    column(EntryDesc; Description) { }
                    column(GLBalance; GLBalance) { AutoFormatType = 1; }
                    column(EntryNo; "Entry No.") { }
                    column(CloseEntry; ClosingEntry) { }
                    column(Reversed; Reversed) { }
                    column(GLBalAddCurr; GLBalAddCurr) { AutoFormatType = 1; }
                    column(DrAmt_AddCurr; "Add.-Currency Debit Amount") { }
                    column(CrAmt_AddCurr; "Add.-Currency Credit Amount") { }
                    trigger OnAfterGetRecord()
                    var
                        Vendor: Record Vendor;
                        Customer: Record Customer;
                        Employee: Record Employee;
                        GLAccount: Record "G/L Account";
                        BankAccount: Record "Bank Account";
                    begin
                        if PrintOnlyCorrections then
                            if not (("Debit Amount" < 0) or ("Credit Amount" < 0)) then
                                CurrReport.Skip();
                        if not PrintReversedEntries and Reversed then
                            CurrReport.Skip();

                        Clear(BalAccName);
                        case "Bal. Account Type" of
                            "Bal. Account Type"::"G/L Account":
                                begin
                                    if GLAccount.Get("Bal. Account No.") then
                                        BalAccName := GLAccount.Name;
                                end;
                            "Bal. Account Type"::Customer:
                                begin
                                    if Customer.Get("Bal. Account No.") then
                                        BalAccName := Customer.Name;
                                end;
                            "Bal. Account Type"::"Bank Account":
                                begin
                                    if BankAccount.Get("Bal. Account No.") then
                                        BalAccName := BankAccount.Name;
                                end;
                            "Bal. Account Type"::Vendor:
                                begin
                                    if Vendor.Get("Bal. Account No.") then
                                        BalAccName := Vendor.Name;
                                end;
                            "Bal. Account Type"::Employee:
                                begin
                                    if Employee.Get("Bal. Account No.") then
                                        BalAccName := Employee.FullName();
                                end;
                        end;

                        GLBalance := GLBalance + Amount;
                        GLBalAddCurr := GLBalAddCurr + "Additional-Currency Amount";
                        if ("Posting Date" = ClosingDate("Posting Date")) and
                           not PrintClosingEntries
                        then begin
                            "Debit Amount" := 0;
                            "Credit Amount" := 0;
                            "Add.-Currency Debit Amount" := 0;
                            "Add.-Currency Credit Amount" := 0;
                        end;

                        if "Posting Date" = ClosingDate("Posting Date") then
                            ClosingEntry := true
                        else
                            ClosingEntry := false;

                        NumberOfGLEntryLines += 1;
                    end;

                    trigger OnPreDataItem()
                    begin
                        GLBalance := StartBalance;
                        GLBalAddCurr := StartBalAddCurr;

                        OnAfterOnPreDataItemGLEntry("G/L Entry");
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    CurrReport.PrintOnlyIfDetail := ExcludeBalanceOnly or (StartBalance = 0);
                end;
            }

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
                Date: Record Date;
            begin
                StartBalance := 0;
                StartBalAddCurr := 0;
                if GLDateFilter <> '' then begin
                    Date.SetRange("Period Type", Date."Period Type"::Date);
                    Date.SetFilter("Period Start", GLDateFilter);
                    if Date.FindFirst() then begin
                        SetRange("Date Filter", 0D, ClosingDate(Date."Period Start" - 1));
                        CalcFields("Net Change");
                        CalcFields("Additional-Currency Net Change");
                        StartBalance := "Net Change";
                        StartBalAddCurr := "Additional-Currency Net Change";
                        SetFilter("Date Filter", GLDateFilter);
                    end;
                end;

                if PrintOnlyOnePerPage then begin
                    GLEntry.Reset();
                    GLEntry.SetRange("G/L Account No.", "No.");
                    if GLEntry.IsEmpty = false then
                        //if CurrReport.PrintOnlyIfDetail and (not GLEntry.IsEmpty()) then
                            PageGroupNo := PageGroupNo + 1;
                end;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        AboutTitle = 'About Detail Trial Balance';
        AboutText = 'View bank account balances at the end of the period, including the opening balance, each transaction within the period, and the closing balance grouped by bank. View a running balance and reconciled entries.';

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NewPageperGLAcc; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Page per G/L Acc.';
                        ToolTip = 'Specifies if each G/L account information is printed on a new page if you have chosen two or more G/L accounts to be included in the report.';
                    }
                    field(ExcludeGLAccsHaveBalanceOnly; ExcludeBalanceOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Exclude G/L Accs. That Have a Balance Only';
                        MultiLine = true;
                        ToolTip = 'Specifies if you do not want the report to include entries for G/L accounts that have a balance but do not have a net change during the selected time period.';
                    }
                    field(InclClosingEntriesWithinPeriod; PrintClosingEntries)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Closing Entries Within the Period';
                        MultiLine = true;
                        ToolTip = 'Specifies if you want the report to include closing entries. This is useful if the report covers an entire fiscal year. Closing entries are listed on a fictitious date between the last day of one fiscal year and the first day of the next one. They have a C before the date, such as C123194. If you do not select this field, no closing entries are shown.';
                    }
                    field(IncludeReversedEntries; PrintReversedEntries)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Reversed Entries';
                        ToolTip = 'Specifies if you want to include reversed entries in the report.';
                    }
                    field(PrintCorrectionsOnly; PrintOnlyCorrections)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Corrections Only';
                        ToolTip = 'Specifies if you want the report to show only the entries that have been reversed and their matching correcting entries.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        PostingDateCaption = 'Posting Date';
        DocNoCaption = 'Document No.';
        DescCaption = 'Description';
        VATAmtCaption = 'VAT Amount';
        EntryNoCaption = 'Entry No.';
    }

    trigger OnPreReport()
    begin
        StartDateTime := CurrentDateTime();
        GLFilter := "G/L Account".GetFilters();
        GLDateFilter := "G/L Account".GetFilter("Date Filter");

        OnAfterOnPreReport("G/L Account", ExcludeBalanceOnly);
    end;

    trigger OnPostReport()
    begin
        FinishDateTime := CurrentDateTime();
        LogReportTelemetry(StartDateTime, FinishDateTime, NumberOfGLEntryLines);
    end;

    var
        BalAccName: Text[100];
        GLDateFilter: Text;
        GLBalance: Decimal;
        StartBalance: Decimal;
        GLBalAddCurr: Decimal;
        StartBalAddCurr: Decimal;
        PrintOnlyOnePerPage: Boolean;
        ExcludeBalanceOnly: Boolean;
        PrintClosingEntries: Boolean;
        PrintOnlyCorrections: Boolean;
        PrintReversedEntries: Boolean;
        PageGroupNo: Integer;
        ClosingEntry: Boolean;
        Text000: Label 'Period: %1';
        PageCaptionLbl: Label 'Page';
        DetailTrialBalCaptionLbl: Label 'Detail Trial Balance';
        BalanceCaptionLbl: Label 'This also includes general ledger accounts that only have a balance.';
        PeriodCaptionLbl: Label 'This report also includes closing entries within the period.';
        OnlyCorrectionsCaptionLbl: Label 'Only corrections are included.';
        NetChangeCaptionLbl: Label 'Net Change';
        GLEntryDebitAmtCaptionLbl: Label 'Debit';
        GLEntryCreditAmtCaptionLbl: Label 'Credit';
        GLBalCaptionLbl: Label 'Balance';
        AddCurrAmtLbl: Label 'Net Change (Add-Currency)';
        BalAccNoLbl: Label 'Bal. Account No.';
        BalAccNameLbl: Label 'Bal. Account Name';
        TelemetryCategoryTxt: Label 'Report', Locked = true;
        DetailedTrialBalanceReportGeneratedTxt: Label 'Detail Trial Balance report generated.', Locked = true;

    protected var
        GLFilter: Text;
        NumberOfGLEntryLines: Integer;
        StartDateTime: DateTime;
        FinishDateTime: DateTime;

    procedure InitializeRequest(NewPrintOnlyOnePerPage: Boolean; NewExcludeBalanceOnly: Boolean; NewPrintClosingEntries: Boolean; NewPrintReversedEntries: Boolean; NewPrintOnlyCorrections: Boolean)
    begin
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
        ExcludeBalanceOnly := NewExcludeBalanceOnly;
        PrintClosingEntries := NewPrintClosingEntries;
        PrintReversedEntries := NewPrintReversedEntries;
        PrintOnlyCorrections := NewPrintOnlyCorrections;
    end;

    local procedure LogReportTelemetry(StartDateTime: DateTime; FinishDateTime: DateTime; NumberOfLines: Integer)
    var
        Dimensions: Dictionary of [Text, Text];
        ReportDuration: BigInteger;
    begin
        ReportDuration := FinishDateTime - StartDateTime;
        Dimensions.Add('Category', TelemetryCategoryTxt);
        Dimensions.Add('ReportStartTime', Format(StartDateTime, 0, 9));
        Dimensions.Add('ReportFinishTime', Format(FinishDateTime, 0, 9));
        Dimensions.Add('ReportDuration', Format(ReportDuration));
        Dimensions.Add('NumberOfLines', Format(NumberOfLines));
        Session.LogMessage('0000FJL', DetailedTrialBalanceReportGeneratedTxt, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, Dimensions);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnPreDataItemGLEntry(var GLEntry: Record "G/L Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnPreReport(var GLAccount: Record "G/L Account"; var ExcludeBalanceOnly: Boolean)
    begin
    end;
}