codeunit 50066 "NEB JPCK_Functions"
{
    Permissions = tabledata "G/L Entry" = rm,
                  tabledata "Vendor Ledger Entry" = rm;

    trigger OnRun()
    begin
    end;

    var
    //PBCJPSetup: Record "PBCJP Setup";
    // UserSetup: Record "User Setup";
    //GlPar: Codeunit "NEB Global Parameters";
    /* FunctionNotUsedErr: Label 'This function cannot be used !';
    NoActivationErr: Label 'J-Pack cannot be used. No activation has been made. Please uninstall the extension package.';
    NoPermissionErr: Label 'J-Pack is activated. But you have no permission to use.';
    NoJPCKParIDErr: Label 'No JPCKParID for %1 !';
    YearTxt: TextConst JPN = '年', ENU = '/';
    MonthTxt: TextConst JPN = '月', ENU = '/';
    DayTxt: TextConst JPN = '日', ENU = ' ';
    DateExp_D: TextConst JPN = '日', ENU = 'D';
    DateExp_WD: TextConst JPN = '平日', ENU = 'WD';
    DateExp_W: TextConst JPN = '週', ENU = 'W';
    DateExp_M: TextConst JPN = '月', ENU = 'M';
    DateExp_Q: TextConst JPN = '四半期', ENU = 'Q';
    DateExp_Y: TextConst JPN = '年', ENU = 'Y';
    DateExp_C: TextConst JPN = '現在', ENU = 'C';
    SalespersonTxt: TextConst JPN = '担当者 :  ', ENU = 'SalesPerson :  ';
    PurchaserTxt: TextConst JPN = '担当者 :  ', ENU = 'Purchaser :  ';
    VatTxt: TextConst JPN = '消費税 ', ENU = 'VAT ';

procedure ShowJpckFuncNotUsed()
begin
    ERROR(FunctionNotUsedErr);
end; */
    /*
    procedure IsJPCKPermitted(): Boolean
    begin
        exit(PBCJPSetup.ReadPermission);
    end;

    procedure GetPBCJPSetup(var PBCJPSetup: Record "PBCJP Setup")
    var
        ActivationMgt: Codeunit "PBCJP Premium Activation Mgt";
    begin
        if ActivationMgt.IsActivationImplemented then
            if not ActivationMgt.IsActivatedDeep then
                Error(NoActivationErr);
        if not IsJPCKPermitted then
            Error(NoPermissionErr);
        PBCJPSetup.Reset;
        if not PBCJPSetup.Get then begin
            PBCJPSetup.Init;
            PBCJPSetup.Insert;
            ClearJPCKParameter;
        end;
    end;

    [Scope('Personalization')]
    procedure GetUnitOfMeasureText("Code": Code[10]; LanguageID: Integer) TranslatedText: Text[10]
    var
        Language: Record Language;
        UnitOfMeasure: Record "Unit of Measure";
        UnitOfMeasureTranslation: Record "Unit of Measure Translation";
    begin
        Language.RESET;
        Language.SETRANGE("Windows Language ID", LanguageID);
        Language.FINDFIRST;
        TranslatedText := '';
        if UnitOfMeasureTranslation.GET(Code, Language.Code) then
            TranslatedText := UnitOfMeasureTranslation.Description
        else begin
            if UnitOfMeasure.GET(Code) then
                TranslatedText := UnitOfMeasure.Description;
        end;
    end;

    [Scope('Personalization')]
    procedure GetDateText(Date: Date; LanguageID: Integer) DateText: Text
    var
        Language: Record Language;
    begin
        if LanguageID = 1041 then
            DateText := FORMAT(Date, 0, GetYMDFormatString)
        else
            DateText := FORMAT(Date, 0, '<Standard Format,7>');
    end;

    [Scope('Personalization')]
    procedure GetPaymentTerm("Code": Code[10]; LanguageID: Integer) PaymentTermName: Text
    var
        Language: Record Language;
        PaymentTerm: Record "Payment Terms";
        PaymentTermTranslation: Record "Payment Term Translation";
    begin
        Language.RESET;
        Language.SETRANGE("Windows Language ID", LanguageID);
        Language.FINDFIRST;
        if PaymentTermTranslation.GET(Code, Language.Code) then
            PaymentTermName := PaymentTermTranslation.Description
        else begin
            if PaymentTerm.GET(Code) then
                PaymentTermName := PaymentTerm.Description;
        end;
    end;

    procedure GetPaymentMethod("Code": Code[10]; LanguageID: Integer) PaymentMethodName: Text
    var
        Language: Record Language;
        PaymentMethod: Record "Payment Method";
        PaymentMethodTranslation: Record "Payment Method Translation";
    begin
        Language.RESET;
        Language.SETRANGE("Windows Language ID", LanguageID);
        Language.FINDFIRST;
        PaymentMethodName := '';
        if Code <> '' then
            if PaymentMethodTranslation.GET(Code, Language.Code) then
                PaymentMethodName := PaymentMethodTranslation.Description
            else
                if PaymentMethod.GET(Code) then
                    PaymentMethodName := PaymentMethod.Description;
    end;

    [Scope('Personalization')]
    procedure GetLocalCurrencyFilter(): Text
    begin
        GetPBCJPSetup(PBCJPSetup);
        if PBCJPSetup."Local Currency Code" <> '' then
            exit('''''|' + PBCJPSetup."Local Currency Code")
        else
            exit('''''');
    end;

    local procedure GetEraStructure(var EraAbbr: array[20] of Text[10]; var EraYear: array[20] of Date; var EraJText: array[20] of Text[20]; var EraEText: array[20] of Text[20]) EraDefault: Integer
    var
        ClassCodeLine: Record "PBCJP Class Code Table Line";
        ip: Integer;
        pos: Integer;
    begin
        if not PBCJPSetup.GET then
            exit;
        CLEAR(EraAbbr);
        CLEAR(EraYear);
        CLEAR(EraJText);
        CLEAR(EraEText);
        EraDefault := 0;
        ClassCodeLine.RESET;
        ClassCodeLine.SETCURRENTKEY("Display Order");
        ClassCodeLine.SETRANGE("Class Main", PBCJPSetup."Class Key for Era");
        ip := 0;
        if ClassCodeLine.FINDSET then
            repeat
                ip += 1;
                pos := STRPOS(ClassCodeLine."Class Sub", ':');
                if pos > 1 then begin
                    EraAbbr[ip] := COPYSTR(ClassCodeLine."Class Sub", 1, pos - 1);
                    EVALUATE(EraYear[ip], COPYSTR(ClassCodeLine."Class Sub", pos + 1));
                end;
                EraJText[ip] := ClassCodeLine."Class Description";
                EraEText[ip] := ClassCodeLine."Class Description Eng";
                if ClassCodeLine.Default then
                    EraDefault := ip;
            until ClassCodeLine.NEXT = 0;
    end;

    [Scope('Personalization')]
    procedure AD2EraDate(AD_Date: Date; EraType: Option Include,"No.",Abbreviation,"J-Text","E-Text"; var EraString: Text[20]) DateString: Text
    var
        Era_Abbr: array[20] of Text[10];
        Era_Year: array[20] of Date;
        Era_JText: array[20] of Text[20];
        Era_EText: array[20] of Text[20];
        Era_Default: Integer;
        EraNo: Integer;
        Found: Boolean;
        R_Deff: Integer;
        R_Year: Integer;
        R_Month: Integer;
        R_Day: Integer;
    begin
        Era_Default := GetEraStructure(Era_Abbr, Era_Year, Era_JText, Era_EText);
        EraNo := 0;
        Found := false;
        repeat
            EraNo += 1;
            if (AD_Date < Era_Year[EraNo]) or (Era_Year[EraNo] = 0D) then begin
                EraNo -= 1;
                Found := true;
            end;
        until Found or (EraNo > 20);
        EraString := '';
        DateString := '';
        if EraNo = 0 then
            exit;
        if Found and (Era_Year[EraNo] <> 0D) then begin
            R_Deff := DATE2DMY(Era_Year[EraNo], 3) - 1;
            R_Year := DATE2DMY(AD_Date, 3);
            R_Year -= R_Deff;
            R_Month := DATE2DMY(AD_Date, 2);
            R_Day := DATE2DMY(AD_Date, 1);
            DateString := FORMAT(R_Year, 2) + FORMAT(R_Month, 2) + FORMAT(R_Day, 2) + FORMAT(R_Year, 4);
            DateString := CONVERTSTR(DateString, ' ', '0');
            case EraType of
                EraType::Include:
                    DateString := Era_Abbr[EraNo] + DateString;
                EraType::"No.":
                    EraString := FORMAT(EraNo);
                EraType::Abbreviation:
                    EraString := Era_Abbr[EraNo];
                EraType::"J-Text":
                    EraString := Era_JText[EraNo];
                EraType::"E-Text":
                    EraString := Era_EText[EraNo];
            end;
        end;
    end;

    [Scope('Personalization')]
    procedure EraDate2AD(EraType: Option Include,"No.",Abbreviation,"J-Text","E-Text"; EraString: Text; DateString: Text) AD_Date: Date
    var
        Era_Abbr: array[20] of Text[10];
        Era_Year: array[20] of Date;
        Era_JText: array[20] of Text[20];
        Era_EText: array[20] of Text[20];
        Era_Default: Integer;
        EraNo: Integer;
        PosStr: Integer;
        Found: Boolean;
        R_Deff: Integer;
        R_Year: Integer;
        R_Month: Integer;
        R_Day: Integer;
        DateString2: Text;
        DateNotExistErr: TextConst JPN = 'この日付は存在しません！', ENU = 'The date specified does not exist !';
    begin
        Era_Default := GetEraStructure(Era_Abbr, Era_Year, Era_JText, Era_EText);
        EraNo := 0;
        Found := false;
        AD_Date := 0D;
        PosStr := 1;
        if EraType = EraType::"No." then begin
            if EVALUATE(EraNo, EraString) then
                Found := true;
        end else begin
            repeat
                EraNo += 1;
                case EraType of
                    EraType::Include:
                        begin
                            if STRPOS(DateString, Era_Abbr[EraNo]) = 1 then begin
                                PosStr := STRLEN(Era_Abbr[EraNo]) + 1;
                                Found := true;
                            end else
                                if EraNo = Era_Default then
                                    Found := true;
                        end;
                    EraType::Abbreviation:
                        begin
                            if EraString = Era_Abbr[EraNo] then
                                Found := true;
                        end;
                    EraType::"J-Text":
                        begin
                            if EraString = Era_JText[EraNo] then
                                Found := true;

                        end;
                    EraType::"E-Text":
                        begin
                            if UpperCase(EraString) = UpperCase(Era_EText[EraNo]) then
                                Found := true;
                        end;
                end;
            until Found or (EraNo = 20);
        end;
        if (EraNo = 0) or (EraNo >= 20) or (not Found) then
            exit;
        if not EVALUATE(R_Year, COPYSTR(DateString, PosStr, 2)) then
            Found := false;
        if not EVALUATE(R_Month, COPYSTR(DateString, PosStr + 2, 2)) then
            Found := false;
        if not EVALUATE(R_Day, COPYSTR(DateString, PosStr + 4, 2)) then
            Found := false;
        if Found then begin
            R_Year := DATE2DMY(Era_Year[EraNo], 3) + R_Year - 1;
            AD_Date := DMY2DATE(R_Day, R_Month, R_Year);
            if EraNo < 20 then
                if Era_Year[EraNo + 1] <> 0D then
                    if AD_Date >= Era_Year[EraNo + 1] then
                        ERROR(DateNotExistErr);
        end;
    end;

    [Scope('Personalization')]
    procedure GetAge(AgeDate: Date; BaseDate: Date) Age: Integer
    var
        A_Year: Integer;
        A_Month: Integer;
        A_Day: Integer;
        B_Year: Integer;
        B_Month: Integer;
        B_Day: Integer;
    begin
        A_Year := DATE2DMY(AgeDate, 3);
        A_Month := DATE2DMY(AgeDate, 2);
        A_Day := DATE2DMY(AgeDate, 1);
        B_Year := DATE2DMY(BaseDate, 3);
        B_Month := DATE2DMY(BaseDate, 2);
        B_Day := DATE2DMY(BaseDate, 1);
        Age := B_Year - A_Year;
        if (A_Month > B_Month) or
           ((A_Month = B_Month) and (A_Day > B_Day)) then
            Age -= 1;
    end;

    [Scope('Personalization')]
    procedure GetEraStartDate(EraNo: Integer): Date
    var
        Era_Abbr: array[20] of Text[10];
        Era_Year: array[20] of Date;
        Era_JText: array[20] of Text[20];
        Era_EText: array[20] of Text[20];
    begin
        GetEraStructure(Era_Abbr, Era_Year, Era_JText, Era_EText);
        exit(Era_Year[EraNo]);
    end;

    [Scope('Personalization')]
    procedure LookupEraDate(var AD_Date: Date; ReturnValue: Boolean)
    var
        vDate: Record Date;
        EraCalendar: Page "PBCJP Era Calendar";
    begin
        if not GUIALLOWED then
            exit;
        CLEAR(EraCalendar);
        EraCalendar.LOOKUPMODE(ReturnValue);
        EraCalendar.SetDate(AD_Date);
        if (EraCalendar.RUNMODAL = ACTION::LookupOK) and ReturnValue then begin
            EraCalendar.GETRECORD(vDate);
            AD_Date := vDate."Period Start";
        end;
    end;

    [Scope('Personalization')]
    procedure LookupBatchName(JnlTemplateName: Code[10]; JnlBatchName: Code[10]): Code[10]
    var
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
    begin
        if GenJnlTemplate.GET(JnlTemplateName) then begin
            GenJnlBatch.FILTERGROUP(2);
            GenJnlBatch.SETRANGE("Journal Template Name", JnlTemplateName);
            GenJnlBatch.SETRANGE("Template Type", GenJnlTemplate.Type);
            GenJnlBatch.FILTERGROUP(0);
            if PAGE.RUNMODAL(0, GenJnlBatch) = ACTION::LookupOK then
                exit(GenJnlBatch.Name)
            else
                exit('');
        end;
    end;

    [Scope('Personalization')]
    procedure GetDueDateExtCalc(): Boolean
    begin
        exit(GetJPCKParameter(PBCJPSetup.FieldNo("Use Extended Due Date Calc.")));
    end;

    [Scope('Personalization')]
    procedure CheckPNoteUsed(ShowMessage: Boolean): Boolean
    begin
        if not IsJPCKPermitted then
            Error(NoPermissionErr);
        GetPBCJPSetup(PBCJPSetup);
        if (not PBCJPSetup."Use Promissory Note") and ShowMessage then
            ShowJpckFuncNotUsed;
        exit(PBCJPSetup."Use Promissory Note");
    end;

    [Scope('Personalization')]
    procedure VATRoundingDirection(RoundingType: Option Nearest,Up,Down): Text
    begin
        case RoundingType of
            RoundingType::Nearest:
                exit('=');
            RoundingType::Up:
                exit('>');
            RoundingType::Down:
                exit('<');
        end;
    end;

    [Scope('Personalization')]
    procedure GetYMDFormatString(): Text
    begin
        exit('<Year4>' + YearTxt + '<Month,2>' + MonthTxt + '<Day,2>' + DayTxt);
    end;

    [Scope('Personalization')]
    procedure ConvertDateExpression(DateExpString: Text): Text;
    var
        FormulaString: DateFormula;
        TestString: Text;
    begin
        Evaluate(FormulaString, '<CM>');
        TestString := Format(formulaString);
        if TestString <> 'CM' then begin
            DateExpString := DateExpString.Replace('D', DateExp_D);
            DateExpString := DateExpString.Replace('WD', DateExp_WD);
            DateExpString := DateExpString.Replace('W', DateExp_W);
            DateExpString := DateExpString.Replace('M', DateExp_M);
            DateExpString := DateExpString.Replace('Q', DateExp_Q);
            DateExpString := DateExpString.Replace('Y', DateExp_Y);
            DateExpString := DateExpString.Replace('C', DateExp_C);
        end;
        exit(DateExpString);
    end;

    // PBCJP-ALL-000-140-06: BEGIN
    procedure GetSalespersonText(SalesPersonCode: Code[20]; Lang: Integer): Text
    var
        SalesPersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if SalesPersonPurchaser.Get(SalesPersonCode) then
            if Lang = 1041 then
                exit(SalespersonTxt + SalesPersonPurchaser.Name)
            else
                if SalesPersonPurchaser."PBCJP Name 2" <> '' then
                    exit(SalespersonTxt + SalesPersonPurchaser."PBCJP Name 2")
                else
                    exit(SalespersonTxt + SalesPersonPurchaser.Name)
        else
            exit('');
    end;

    procedure GetPurchaserText(PurchaserCode: Code[20]; Lang: Integer): Text
    var
        SalesPersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if SalesPersonPurchaser.Get(PurchaserCode) then
            if Lang = 1041 then
                exit(PurchaserTxt + SalesPersonPurchaser.Name)
            else
                if SalesPersonPurchaser."PBCJP Name 2" <> '' then
                    exit(PurchaserTxt + SalesPersonPurchaser."PBCJP Name 2")
                else
                    exit(PurchaserTxt + SalesPersonPurchaser.Name)
        else
            exit('');
    end;
    // PBCJP-ALL-000-140-06: END

    [Scope('Personalization')]
    procedure GetSalespersonString(): Text
    begin
        exit(SalespersonTxt);
    end;

    [Scope('Personalization')]
    procedure GetPurchaserString(): Text
    begin
        exit(PurchaserTxt);
    end;

    // PBCJP-ALL-000-140-01: BEGIN
    procedure GetAmountPrecisionFormat(CurrencyCOde: Code[10]): Text
    var
        GLSetup: Record "General Ledger Setup";
        Currency: Record Currency;
        FormatTxt: Label '<Precision,%1><Standard Format,0>', Locked = true;
    begin
        if CurrencyCOde <> '' then
            if Currency.Get(CurrencyCOde) then
                exit(StrSubstNo(FormatTxt, Currency."Amount Decimal Places"));
        GLSetup.Get();
        exit(StrSubstNo(FormatTxt, GLSetup."Amount Decimal Places"));
    end;
    // PBCJP-ALL-000-140-01: END

    [Scope('Personalization')]
    procedure GetVatString(): Text
    begin
        exit(VatTxt);
    end;

    procedure IsSuperUser(): Boolean
    var
        User: Record User;
        AccessControl: Record "Access Control";
    begin
        if User.IsEmpty then
            exit(true);
        AccessControl.SetRange("Role ID", 'SUPER');
        AccessControl.SetFilter("Company Name", '%1|%2', '', CompanyName);
        AccessControl.SetRange("User Security ID", UserSecurityId);
        exit(not AccessControl.IsEmpty);
    end;

    // procedure IsPBCJPSetupAllowed(): Boolean
    // begin
    //     if IsSuperUser then
    //         exit(true);
    //     if UserSetup.Get(UserId) then
    //         exit(UserSetup."PBCJP Allow PBCJP Setup");
    //     exit(false);
    // end;

    // procedure IsJPCKMenuAllowed(): Boolean
    // begin
    //     if IsSuperUser then
    //         exit(true);
    //     if UserSetup.Get(UserId) then
    //         exit(UserSetup."PBCJP Allow J-Pack Menu");
    //     exit(false);
    // end;

    local procedure ConvToJPCKParID(FieldID: Integer): Text
    var
        PBCJPSetup: Record "PBCJP Setup";
    begin
        case FieldID of
            PBCJPSetup.FieldNo("Use User Posting Control"):         // 120
                exit('PBCJP_PostControl');
            PBCJPSetup.FieldNo("Use Query on Close Control"):       // 121
                exit('PBCJP_QueryClose');
            PBCJPSetup.FieldNo("Compulsory Fields in Master"):      // 150
                exit('PBCJP_CompulField');
            PBCJPSetup.FieldNo("Use Extended Due Date Calc."):      // 160
                exit('PBCJP_ExtDueDate');
            PBCJPSetup.FieldNo("Use Posted Gen. Journal"):          // 1004
                exit('PBCJP_ArcGenJnl');
            PBCJPSetup.FieldNo("Use Posting Approval"):             // 1005
                exit('PBCJP_PostApprove');
            PBCJPSetup.FieldNo("Use G/L Account Security"):         // 1006
                exit('PBCJP_GLSecurity');
            PBCJPSetup.FieldNo("Copy Comment to G/L Entry"):        // 1014
                exit('PBCJP_GLComment');
            PBCJPSetup.FieldNo("Foreign Currency in G/L Entry"):    // 1015
                exit('PBCJP_FcyInGL');
            PBCJPSetup.FieldNo("Shortcut Dimension in G/L"):        // 1018
                exit('PBCJP_ShortDimGL');
            PBCJPSetup.FieldNo("Default Dim. for Gen. Journal"):    // 1019
                exit('PBCJP_DefDimGL');
            PBCJPSetup.FieldNo("Use Journal Collection"):           // 1020
                exit('PBCJP_CollectJnl');
            PBCJPSetup.FieldNo("Shortcut Dim. in Bank Ledger"):     // 1021
                exit('PBCJP_ShortDimBL');
            PBCJPSetup.FieldNo("Use Extended VAT Calc."):           // 1022
                exit('PBCJP_ExtVAT');
            PBCJPSetup.FieldNo("Use Reduced VAT Rate"):             // 1023
                exit('PBCJP_ReducedVAT');
            PBCJPSetup.FieldNo("Use Promissory Note"):              // 1200
                exit('PBCJP_PromNote');
            PBCJPSetup.FieldNo("Use Collective Invoice"):           // 1300
                exit('PBCJP_CollInvoice');
            PBCJPSetup.FieldNo("Shortcut Dim. in Cust. Ledger"):    // 2007
                exit('PBCJP_ShortDimCL');
            PBCJPSetup.FieldNo("Dim. fr. Appl. Sales Doc. Line"):   // 2008
                exit('PBCJP_DimSalesDoc');
            PBCJPSetup.FieldNo("Create Cust. from Contact Only"):   // 2013
                exit('PBCJP_CusFrContact');
            PBCJPSetup.FieldNo("Use Sell-to Customer Info."):       // 2014
                exit('PBCJP_SellToCusInfo');
            PBCJPSetup.FieldNo("Avoid Duplicate Get Shpt Lines"):   // 2015
                exit('PBCJP_NoDupShptLine');
            PBCJPSetup.FieldNo("Shortcut Dim. in Vendor Ledger"):   // 3004
                exit('PBCJP_ShortDimVL');
            PBCJPSetup.FieldNo("Dim. fr. Appl. Purch Doc. Line"):   // 3005
                exit('PBCJP_DimPurchDoc');
            PBCJPSetup.FieldNo("Shortcut Dim. in Employ. Ledg."):   // 3006
                exit('PBCJP_ShortDimEL');
            PBCJPSetup.FieldNo("Use Buy-from Vendor Info."):        // 3012
                exit('PBCJP_BuyFrVendInfo');
            PBCJPSetup.FieldNo("Avoid Duplicate Get Rcpt Lines"):   // 3013
                exit('PBCJP_NoDupRcptLine');
            PBCJPSetup.FieldNo("Use Posted Item Journal"):          // 4001
                exit('PBCJP_ArcItemJnl');
            PBCJPSetup.FieldNo("Shortcut Dim. in Item Ledger"):     // 4532
                exit('PBCJP_ShortDimIL');
            PBCJPSetup.FieldNo("Keep Descriptio in Item Ledger"):   // 4534
                exit('PBCJP_KeepDesIL');
            else
                Error(NoJPCKParIDErr, FieldID);
        end;
    end;

    procedure SetupJPCKParameter()
    begin
        if not PBCJPSetup.Get then begin
            PBCJPSetup.Init;
            PBCJPSetup.Insert;
        end;
        SetJPCKParameter(PBCJPSetup.FieldNo("Use User Posting Control"), PBCJPSetup."Use User Posting Control");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Query on Close Control"), PBCJPSetup."Use Query on Close Control");
        SetJPCKParameter(PBCJPSetup.FieldNo("Compulsory Fields in Master"), PBCJPSetup."Compulsory Fields in Master");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Extended Due Date Calc."), PBCJPSetup."Use Extended Due Date Calc.");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Posted Gen. Journal"), PBCJPSetup."Use Posted Gen. Journal");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Posting Approval"), PBCJPSetup."Use Posting Approval");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use G/L Account Security"), PBCJPSetup."Use G/L Account Security");
        SetJPCKParameter(PBCJPSetup.FieldNo("Copy Comment to G/L Entry"), PBCJPSetup."Copy Comment to G/L Entry");
        SetJPCKParameter(PBCJPSetup.FieldNo("Foreign Currency in G/L Entry"), PBCJPSetup."Foreign Currency in G/L Entry");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dimension in G/L"), PBCJPSetup."Shortcut Dimension in G/L");
        SetJPCKParameter(PBCJPSetup.FieldNo("Default Dim. for Gen. Journal"), PBCJPSetup."Default Dim. for Gen. Journal");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Journal Collection"), PBCJPSetup."Use Journal Collection");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dim. in Bank Ledger"), PBCJPSetup."Shortcut Dim. in Bank Ledger");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Extended VAT Calc."), PBCJPSetup."Use Extended VAT Calc.");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Reduced VAT Rate"), PBCJPSetup."Use Reduced VAT Rate");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Promissory Note"), PBCJPSetup."Use Promissory Note");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Collective Invoice"), PBCJPSetup."Use Collective Invoice");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dim. in Cust. Ledger"), PBCJPSetup."Shortcut Dim. in Cust. Ledger");
        SetJPCKParameter(PBCJPSetup.FieldNo("Dim. fr. Appl. Sales Doc. Line"), PBCJPSetup."Dim. fr. Appl. Sales Doc. Line");
        SetJPCKParameter(PBCJPSetup.FieldNo("Create Cust. from Contact Only"), PBCJPSetup."Create Cust. from Contact Only");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Sell-to Customer Info."), PBCJPSetup."Use Sell-to Customer Info.");
        SetJPCKParameter(PBCJPSetup.FieldNo("Avoid Duplicate Get Shpt Lines"), PBCJPSetup."Avoid Duplicate Get Shpt Lines");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dim. in Vendor Ledger"), PBCJPSetup."Shortcut Dim. in Vendor Ledger");
        SetJPCKParameter(PBCJPSetup.FieldNo("Dim. fr. Appl. Purch Doc. Line"), PBCJPSetup."Dim. fr. Appl. Purch Doc. Line");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dim. in Employ. Ledg."), PBCJPSetup."Shortcut Dim. in Employ. Ledg.");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Buy-from Vendor Info."), PBCJPSetup."Use Buy-from Vendor Info.");
        SetJPCKParameter(PBCJPSetup.FieldNo("Avoid Duplicate Get Rcpt Lines"), PBCJPSetup."Avoid Duplicate Get Rcpt Lines");
        SetJPCKParameter(PBCJPSetup.FieldNo("Use Posted Item Journal"), PBCJPSetup."Use Posted Item Journal");
        SetJPCKParameter(PBCJPSetup.FieldNo("Shortcut Dim. in Item Ledger"), PBCJPSetup."Shortcut Dim. in Item Ledger");
        SetJPCKParameter(PBCJPSetup.FieldNo("Keep Descriptio in Item Ledger"), PBCJPSetup."Keep Descriptio in Item Ledger");
    end;

    procedure ClearJPCKParameter()
    var
        ParID: Text;
    begin
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use User Posting Control"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Query on Close Control"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Compulsory Fields in Master"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Extended Due Date Calc."));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Posted Gen. Journal"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Posting Approval"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use G/L Account Security"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Copy Comment to G/L Entry"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Foreign Currency in G/L Entry"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dimension in G/L"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Default Dim. for Gen. Journal"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Journal Collection"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dim. in Bank Ledger"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Extended VAT Calc."));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Reduced VAT Rate"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Promissory Note"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Collective Invoice"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dim. in Cust. Ledger"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Dim. fr. Appl. Sales Doc. Line"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Create Cust. from Contact Only"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Sell-to Customer Info."));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Avoid Duplicate Get Shpt Lines"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dim. in Vendor Ledger"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Dim. fr. Appl. Purch Doc. Line"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dim. in Employ. Ledg."));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Buy-from Vendor Info."));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Avoid Duplicate Get Rcpt Lines"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Use Posted Item Journal"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Shortcut Dim. in Item Ledger"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
        ParID := ConvToJPCKParID(PBCJPSetup.FieldNo("Keep Descriptio in Item Ledger"));
        if IsolatedStorage.Contains(ParID, DataScope::Company) then
            IsolatedStorage.Delete(ParID, DataScope::Company);
    end;

    procedure SetJPCKParameter(FieldID: Integer; JPCKParameter: Boolean)
    var
        ParID: Text;
    begin
        ParID := ConvToJPCKParID(FieldID);
        if IsolatedStorage.Contains(ParID, DataScope::Company) then begin
            if not JPCKParameter then
                IsolatedStorage.Delete(ParID, DataScope::Company);
        end;
        if JPCKParameter then
            IsolatedStorage.Set(ParID, 'true', DataScope::Company);
    end;

    procedure GetJPCKParameter(FieldID: Integer): Boolean
    var
        ParID: Text;
    begin
        ParID := ConvToJPCKParID(FieldID);
        exit(IsolatedStorage.Contains(ParID, DataScope::Company));
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure TransferGLAddKeyFields(var Rec: Record "G/L Entry"; RunTrigger: Boolean)
    begin
        Rec."PBCJP R_Gen. Posting Type" := Rec."Gen. Posting Type";
        Rec."PBCJP R_VAT Bus. Posting Group" := Rec."VAT Bus. Posting Group";
        Rec."PBCJP R_VAT Prod. Posting Grp." := Rec."VAT Prod. Posting Group";
        Rec."PBCJP R_G/L Account No." := Rec."G/L Account No.";
        Rec."PBCJP R_Posting Date" := Rec."Posting Date";
        Rec.Modify;
    end;

    // PBCJP-ALL-000-140-02: BEGIN
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterModifyEvent', '', false, false)]
    local procedure TransferGLAddKeyFieldsOnModify(var Rec: Record "G/L Entry"; var xRec: Record "G/L Entry"; RunTrigger: Boolean)
    begin
        if (Rec."PBCJP R_Gen. Posting Type" <> Rec."Gen. Posting Type") or
           (Rec."PBCJP R_VAT Bus. Posting Group" <> Rec."VAT Bus. Posting Group") or
           (Rec."PBCJP R_VAT Prod. Posting Grp." <> Rec."VAT Prod. Posting Group") or
           (Rec."PBCJP R_G/L Account No." <> Rec."G/L Account No.") or
           (Rec."PBCJP R_Posting Date" <> Rec."Posting Date")
        then begin
            Rec."PBCJP R_Gen. Posting Type" := Rec."Gen. Posting Type";
            Rec."PBCJP R_VAT Bus. Posting Group" := Rec."VAT Bus. Posting Group";
            Rec."PBCJP R_VAT Prod. Posting Grp." := Rec."VAT Prod. Posting Group";
            Rec."PBCJP R_G/L Account No." := Rec."G/L Account No.";
            Rec."PBCJP R_Posting Date" := Rec."Posting Date";
            Rec.Modify();
        end;
    end;
    // PBCJP-ALL-000-140-02: END

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure TransferVLAddKeyFields(var Rec: Record "Vendor Ledger Entry"; RunTrigger: Boolean)
    begin
        Rec."PBCJP R_Open" := Rec.Open;
        Rec."PBCJP R_Vendor No." := Rec."Vendor No.";
        Rec."PBCJP R_Positive" := Rec.Positive;
        Rec."PBCJP R_Due Date" := Rec."Due Date";
        Rec."PBCJP R_Payment Method Code" := Rec."Payment Method Code";
        Rec.Modify;
    end;

    // PBCJP-ALL-000-140-02: BEGIN
    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterModifyEvent', '', false, false)]
    local procedure TransferVLAddKeyFieldsOnModify(var Rec: Record "Vendor Ledger Entry"; var xRec: Record "Vendor Ledger Entry"; RunTrigger: Boolean)
    begin
        if (Rec."PBCJP R_Open" <> Rec.Open) or
           (Rec."PBCJP R_Vendor No." <> Rec."Vendor No.") or
           (Rec."PBCJP R_Positive" <> Rec.Positive) or
           (Rec."PBCJP R_Due Date" <> Rec."Due Date") or
           (Rec."PBCJP R_Payment Method Code" <> Rec."Payment Method Code")
        then begin
            Rec."PBCJP R_Open" := Rec.Open;
            Rec."PBCJP R_Vendor No." := Rec."Vendor No.";
            Rec."PBCJP R_Positive" := Rec.Positive;
            Rec."PBCJP R_Due Date" := Rec."Due Date";
            Rec."PBCJP R_Payment Method Code" := Rec."Payment Method Code";
            Rec.Modify();
        end;
    end;
    // PBCJP-ALL-000-140-02: END

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company-Initialize", 'OnCompanyInitialize', '', false, false)]
    local procedure CreatePBCJPSetupOnCompanyInitialize()
    begin
        if not PBCJPSetup.Get then begin
            PBCJPSetup.Init;
            PBCJPSetup.Insert;
            ClearJPCKParameter;
        end;
    end; */
}