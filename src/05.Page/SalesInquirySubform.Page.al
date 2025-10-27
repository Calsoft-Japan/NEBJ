/* page 50019 "NEBJ Sales Inquiry Subform"
{
    Caption = 'Line';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Sales Inquiry Line";
    SourceTableTemporary = true;
    layout
    {
        area(content)
        {
            repeater(Control1000000007)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Document No."; Rec."Document No.")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Order Status"; Rec."Order Status")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Sell-to Customer Name 2"; Rec."Customer Name 2")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Document Date"; Rec."Document Date")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Order Date"; Rec."Order Date")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                //ここから
                field("Currency Code"; Rec."Currency Code")
                {
                    Visible = ShowLine;
                }
                //conside begin
                field("Item No."; Rec."No.")
                {
                    Caption = '品目番号';
                    Visible = ShowLine;
                }
                field("Item Description"; Rec."Item Description")
                {
                    Visible = ShowLine;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = ShowLine;
                }
                field("Description"; Rec."Description")
                {
                    Visible = ShowLine;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Visible = ShowLine;
                }

                field("Unit of Measure"; Rec."Unit of MeasureExt")
                {
                    Visible = ShowLine;
                }

                field("Quantity"; Rec."Quantity")
                {
                    Visible = ShowLine;
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    Visible = ShowLine;
                    DecimalPlaces = 0 : 0;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    Visible = ShowLine;
                    DecimalPlaces = 0 : 0;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Visible = ShowLine;

                }

                field("EU Division 1"; Rec."EU Division 1")
                {
                    Visible = ShowLine;

                }
                field("EndUser"; Rec."EndUser")
                {
                    Visible = ShowLine;

                }
                field("EndUser Group Name"; Rec."EndUser Group Name")
                {
                    Visible = ShowLine;

                }
                field("EU Description"; Rec."EU Description")
                {
                    Visible = ShowLine;

                }
                field("Description(Bikou)"; Rec."Description(Bikou)")
                {
                    Visible = ShowLine;

                }
                field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
                {
                    Visible = ShowLine;

                }
                field("Amount"; Rec."Amount")
                {
                    Visible = ShowLine;

                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    Visible = ShowLine;

                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    Visible = ShowLine;

                }
                field("Product Group Description"; Rec."Product Group Description")
                {
                    Visible = ShowLine;

                }
                field("SerialNoType"; Rec."SerialNoType")
                {
                    Visible = ShowLine;

                }
                field("StorageTemprature"; Rec."StorageTemprature")
                {
                    Visible = ShowLine;

                }
                field("User ID"; Rec."User ID")
                {
                    Visible = ShowLine;

                }
                field("Customer Group Name"; "Customer Group Name")
                {
                    Visible = ShowLine;

                }
                field("ItemToxicKBN"; "ItemToxicKBN")
                {
                    Visible = ShowLine;

                }
                field("SalesYear"; "SalesYear")
                {
                    Visible = ShowLine;

                }
                field("SalesMonth"; "SalesMonth")
                {
                    Visible = ShowLine;

                }
                field("SalesQuater"; "SalesQuater")
                {
                    Visible = ShowLine;

                }
                //conside end
                field("Posting Description"; "Posting Description")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }

                field("Due Date"; "Due Date")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Line No."; "Line No.")
                {
                    Visible = ShowLine;
                }
                field(Type; Type)
                {
                    Visible = ShowLine;
                }
                field("Description 2"; "Description 2Ext")
                {
                    Visible = ShowLine;
                }
                field("Reserved Quantity"; "Reserved Quantity")
                {
                    Visible = ShowLine;
                }
                field("Qty. to Invoice"; "Qty. to Invoice")
                {
                    Visible = ShowLine;
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    Visible = ShowLine;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    Visible = ShowLine;
                }
                field("VAT %"; "VAT %")
                {
                    Visible = ShowLine;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    Visible = ShowLine;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = ShowLine;
                }
                field("Inv. Discount Amount"; "Inv. Discount Amount")
                {
                    Visible = ShowLine;
                }
                field("Profit %"; "Profit %")
                {
                    Visible = ShowLine;
                }
                field("Net Weight"; "Net Weight")
                {
                    Visible = ShowLine;
                }
                field("Gross Weight"; "Gross Weight")
                {
                    Visible = ShowLine;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Planned Delivery Date"; "Planned Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Planned Shipment Date"; "Planned Shipment Date")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 8 Code"; "Shortcut Dimension 8 Code")
                {
                    Visible = ShowLine;
                }
                field("Job No."; "Job No.")
                {
                    Visible = ShowLine;
                }
                field("Reason Code"; "Reason Code")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    Visible = ShowHeader;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    Visible = ShowLine;
                }

                //ここから2
                field("Variant Code"; "Variant Code")
                {
                    Visible = ShowLine;
                }
                field("Bin Code"; "Bin Code")
                {
                    Visible = ShowLine;
                }
                //CONSIDE BEGIN
                field("StorageTemprature2"; "StorageTemprature")
                {
                    Visible = ShowLine;

                }
                field("Item Category Code2"; "Item Category Code")
                {
                    Visible = ShowLine;

                }
                field("Product Group Code2"; "Product Group Code")
                {
                    Visible = ShowLine;
                }
                field("Customer Group"; "Customer Group")
                {
                    Visible = ShowLine;

                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Visible = ShowLine;
                }
                //ここから3
                field("EU Division 2"; "EU Division 2")
                {
                    Visible = ShowLine;

                }
                field("EU Division 3"; "EU Division 3")
                {
                    Visible = ShowLine;

                }
                field("EndUser Group"; "EndUser Group")
                {
                    Visible = ShowLine;

                }
                field("External Document No."; "External Document No.")
                {
                    Visible = ShowLine;
                }
                field("Qty. to Ship"; "Qty. to Ship")
                {
                    Visible = ShowLine;

                }
                field("Amount Including VAT - Amount"; "Amount Including VAT" - Amount)
                {
                    Caption = '消費税込金額-金額';
                    Visible = ShowLine;

                }
                field("Total Qty. (Base)"; "Total Qty. (Base)")
                {
                    Visible = false;
                }
                field("Total Amount (LCY)"; "Total Amount (LCY)")
                {
                    Visible = false;
                }
                field("Total Amount Incl. VAT (LCY)"; "Total Amount Incl. VAT (LCY)")
                {
                    Visible = false;
                }

                //conside mod BEGIN


                //conside mod END

            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        ShowHeader := TRUE;
        ShowLine := TRUE;
    end;

    trigger OnOpenPage();
    begin
        PBCJPSetup.GET;
        IF NOT PBCJPSetup."Use Sales Inquiry" THEN
            JPCKFunc.ShowJpckFuncNotUsed;
        GLSetup.GET;
    end;

    var
        PBCJPSetup: Record "PBCJP Setup";
        SalesInqLine: Record "PBCJP Sales Inquiry Line" temporary;//pbcwest1
        SalesHdr: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesInvHdr: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        GLSetup: Record "General Ledger Setup";
        CurrExchRate: Record "Currency Exchange Rate";
        JPCKFunc: Codeunit "PBCJP JPCK_Functions";
        DimMgt: Codeunit "DimensionManagement";
        ShowHeader: Boolean;
        ShowLine: Boolean;
        SelltoCustomerFilter: Text;
        BilltoCustomerFilter: Text;
        PostingDateFilter: Text;
        OrderDateFilter: Text;
        GLAccFilter: Text;
        ItemFilter: Text;
        ResourceFilter: Text;
        FAFilter: Text;
        ItemChargeFilter: Text;
        ShowDummyLine: Boolean;
        NoFilterCount: Integer;
        TotalQty: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        SalesQuote: Boolean;
        SalesOrder: Boolean;
        SalesInvoice: Boolean;
        SalesCreditMemo: Boolean;
        SalesReturnOrder: Boolean;
        PostedSalesInvoice: Boolean;
        PostedSalesCrMemo: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        AmtRoundPrecision: Decimal;
        Text000: TextConst ENU = 'Please specify the search criteria.', JPN = '検索対象を指定して下さい。';

        TempExcelBuffer: Record "Excel Buffer" temporary;

    procedure ControlShowMode(ShowMode: Option "Header + Line","Header Only","Line Only");
    begin
        CASE ShowMode OF
            ShowMode::"Header + Line":
                BEGIN
                    ShowHeader := TRUE;
                    ShowLine := TRUE;
                END;
            ShowMode::"Header Only":
                BEGIN
                    ShowHeader := TRUE;
                    ShowLine := FALSE;
                END;
            ShowMode::"Line Only":
                BEGIN
                    ShowHeader := FALSE;
                    ShowLine := TRUE;
                END;
        END;
        CurrPage.UPDATE(FALSE);
    end;

    procedure SetIncludeTable(NewSalesQuote: Boolean; NewSalesOrder: Boolean; NewSalesInvoice: Boolean; NewSalesCrMemo: Boolean; NewSalesReturnOrder: Boolean; NewPostedSalesInvoice: Boolean; NewPostedSalesCrMemo: Boolean);
    begin
        SalesQuote := NewSalesQuote;
        SalesOrder := NewSalesOrder;
        SalesInvoice := NewSalesInvoice;
        SalesCreditMemo := NewSalesCrMemo;
        SalesReturnOrder := NewSalesReturnOrder;
        PostedSalesInvoice := NewPostedSalesInvoice;
        PostedSalesCrMemo := NewPostedSalesCrMemo;
    end;

    procedure SetHeaderFilter(NewSelltoCustomerFilter: Text; NewBilltoCustomerFilter: Text; NewPostingDateFilter: Text; NewOrderDateFilter: Text);
    begin
        SelltoCustomerFilter := NewSelltoCustomerFilter;
        BilltoCustomerFilter := NewBilltoCustomerFilter;
        PostingDateFilter := NewPostingDateFilter;
        OrderDateFilter := NewOrderDateFilter;
    end;

    procedure SetLineFilter(NewGLAccFilter: Text; NewItemFilter: Text; NewResourceFilter: Text; NewFAFilter: Text; NewItemChargeFilter: Text; NewShowDummyLine: Boolean);
    begin
        GLAccFilter := NewGLAccFilter;
        ItemFilter := NewItemFilter;
        ResourceFilter := NewResourceFilter;
        FAFilter := NewFAFilter;
        ItemChargeFilter := NewItemChargeFilter;
        ShowDummyLine := NewShowDummyLine;
    end;

    procedure ClearInquiryData(CurrGUID: Guid);
    begin
        RESET;
        SETRANGE(GUID, CurrGUID);
        IF NOT ISEMPTY THEN BEGIN
            IF COUNT = 1 THEN BEGIN
                "Line No." += 10000;
                INSERT;
            END;
            DELETEALL;
        END;
        CurrPage.UPDATE(FALSE);
    end;

    procedure GetTotalValue(var RtnTotalQty: Decimal; var RtnTotalAmount: Decimal; var RtnTotalAmountInclVAT: Decimal);
    begin
        RtnTotalQty := TotalQty;
        RtnTotalAmount := TotalAmount;
        RtnTotalAmountInclVAT := TotalAmountInclVAT;
    end;

    procedure GetRoundingPrecision(CurrencyCode: Code[10]): Decimal;
    var
        Currency: Record "Currency";
    begin
        IF CurrencyCode <> '' THEN
            IF Currency.GET(CurrencyCode) THEN
                IF Currency."Amount Rounding Precision" <> 0 THEN
                    EXIT(Currency."Amount Rounding Precision");
        IF GLSetup."Amount Rounding Precision" <> 0 THEN
            EXIT(GLSetup."Amount Rounding Precision")
        ELSE
            EXIT(0.01);
    end;

    procedure GetCDate(Date: Date): Date;
    begin
        IF Date <> 0D THEN
            EXIT(Date)
        ELSE
            EXIT(WORKDATE);
    end;

    procedure SetFixedFields(CurrGUID: Guid);
    begin
        GUID := CurrGUID;
        "Creation Date" := TODAY;
        "Shortcut Dimension 1" := GLSetup."Shortcut Dimension 1 Code";
        "Shortcut Dimension 2" := GLSetup."Shortcut Dimension 2 Code";
        "Shortcut Dimension 3" := GLSetup."Shortcut Dimension 3 Code";
        "Shortcut Dimension 4" := GLSetup."Shortcut Dimension 4 Code";
        "Shortcut Dimension 5" := GLSetup."Shortcut Dimension 5 Code";
        "Shortcut Dimension 6" := GLSetup."Shortcut Dimension 6 Code";
        "Shortcut Dimension 7" := GLSetup."Shortcut Dimension 7 Code";
        "Shortcut Dimension 8" := GLSetup."Shortcut Dimension 8 Code";
    end;

    procedure FindRecords(CurrGUID: Guid);
    begin
        RESET;
        SETRANGE(GUID, CurrGUID);
        DELETEALL;

        TotalQty := 0;
        TotalAmount := 0;
        TotalAmountInclVAT := 0;

        FindSalesRecord(CurrGUID);
        FindPostedSalesInvoice(CurrGUID);
        FindPostedSalesCrMemo(CurrGUID);

        IF FINDFIRST THEN;
        CurrPage.UPDATE(FALSE);
    end;

    procedure FindSalesRecord(CurrGUID: Guid);
    var
        SalesLine2: Record "Sales Line";
        DocFilter: Text;
        Found: Boolean;
        lrecCustomer: Record Customer;
        lrecCustomerType: Record "Customer Type";
        lrecItemCategory: Record "Item Category";
        lrecItem: Record Item;
    //lrecProductGroup : Record "Product Group";
    begin
        DocFilter := '';
        IF SalesQuote THEN
            DocFilter := 'Quote';
        IF SalesOrder THEN BEGIN
            IF DocFilter <> '' THEN
                DocFilter += '|';
            DocFilter += 'Order';
        END;
        IF SalesInvoice THEN BEGIN
            IF DocFilter <> '' THEN
                DocFilter += '|';
            DocFilter += 'Invoice';
        END;
        IF SalesCreditMemo THEN BEGIN
            IF DocFilter <> '' THEN
                DocFilter += '|';
            DocFilter += 'Credit Memo';
        END;
        IF SalesReturnOrder THEN BEGIN
            IF DocFilter <> '' THEN
                DocFilter += '|';
            DocFilter += 'Return Order';
        END;

        //PBCJP-TRD-002-070-01: BEGIN
        IF DocFilter = '' THEN
            IF (NOT PostedSalesInvoice) AND (NOT PostedSalesCrMemo) THEN BEGIN
                MESSAGE(Text000);
                EXIT;
            END;
        //IF DocFilter = '' THEN BEGIN
        //  IF (NOT PostedSalesInvoice) AND (NOT PostedSalesCrMemo) THEN
        //    MESSAGE(Text000);
        //  EXIT;
        //END;
        //PBCJP-TRD-002-070-01: END

        //PBCJP-TRD-002-070-02: BEGIN
        //IF DocFilter = '' THEN  //PBCJP-TRD-002-070-03
        //  EXIT;                 //PBCJP-TRD-002-070-03
        //PBCJP-TRD-002-070-02: END

        NoFilterCount := 0;
        IF GLAccFilter <> '' THEN
            NoFilterCount += 1;
        IF ItemFilter <> '' THEN
            NoFilterCount += 1;
        IF ResourceFilter <> '' THEN
            NoFilterCount += 1;
        IF FAFilter <> '' THEN
            NoFilterCount += 1;
        IF ItemChargeFilter <> '' THEN
            NoFilterCount += 1;

        //PBCJP-TRD-002-070-03: BEGIN
        IF DocFilter = '' THEN
            EXIT;
        //PBCJP-TRD-002-070-03: END

        SalesHdr.RESET;
        SalesLine.RESET;
        IF DocFilter <> '' THEN
            SalesHdr.SETFILTER("Document Type", DocFilter);
        IF SelltoCustomerFilter <> '' THEN
            SalesHdr.SETFILTER("Sell-to Customer No.", SelltoCustomerFilter);
        IF BilltoCustomerFilter <> '' THEN
            SalesHdr.SETFILTER("Bill-to Customer No.", BilltoCustomerFilter);
        IF PostingDateFilter <> '' THEN
            SalesHdr.SETFILTER("Posting Date", PostingDateFilter);
        IF OrderDateFilter <> '' THEN
            SalesHdr.SETFILTER("Order Date", OrderDateFilter);

        IF SalesHdr.FINDSET THEN
            REPEAT
                SalesHdr.CALCFIELDS(
                  Comment, Amount, "Amount Including VAT", "No. of Archived Versions",
                  "Shipped Not Invoiced", "Completely Shipped", "Late Order Shipping");
                SalesLine.SETRANGE("Document Type", SalesHdr."Document Type");
                SalesLine.SETRANGE("Document No.", SalesHdr."No.");
                IF NOT ShowDummyLine THEN
                    SalesLine.SETFILTER(Amount, '<>0');

                IF NoFilterCount = 1 THEN BEGIN
                    IF GLAccFilter <> '' THEN BEGIN
                        SalesLine.SETRANGE(Type, SalesLine.Type::"G/L Account");
                        SalesLine.SETFILTER("No.", GLAccFilter);
                    END;
                    IF ItemFilter <> '' THEN BEGIN
                        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                        SalesLine.SETFILTER("No.", ItemFilter);
                    END;
                    IF ResourceFilter <> '' THEN BEGIN
                        SalesLine.SETRANGE(Type, SalesLine.Type::Resource);
                        SalesLine.SETFILTER("No.", ResourceFilter);
                    END;
                    IF FAFilter <> '' THEN BEGIN
                        SalesLine.SETRANGE(Type, SalesLine.Type::"Fixed Asset");
                        SalesLine.SETFILTER("No.", FAFilter);
                    END;
                    IF ItemChargeFilter <> '' THEN BEGIN
                        SalesLine.SETRANGE(Type, SalesLine.Type::"Charge (Item)");
                        SalesLine.SETFILTER("No.", ItemChargeFilter);
                    END;
                END;

                IF SalesLine.FINDSET THEN
                    REPEAT
                        Found := FALSE;
                        IF NoFilterCount > 1 THEN BEGIN
                            IF (GLAccFilter <> '') AND
                               (SalesLine.Type = SalesLine.Type::"G/L Account") THEN BEGIN
                                SalesLine2.COPY(SalesLine);
                                SalesLine2.SETRANGE(Type, SalesLine2.Type::"G/L Account");
                                SalesLine2.FILTERGROUP(2);
                                SalesLine2.SETFILTER("No.", GLAccFilter);
                                SalesLine2.FILTERGROUP(0);
                                SalesLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemFilter <> '') AND
                               (SalesLine.Type = SalesLine.Type::Item) THEN BEGIN
                                SalesLine2.COPY(SalesLine);
                                SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                SalesLine2.FILTERGROUP(2);
                                SalesLine2.SETFILTER("No.", ItemFilter);
                                SalesLine2.FILTERGROUP(0);
                                SalesLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ResourceFilter <> '') AND
                               (SalesLine.Type = SalesLine.Type::Resource) THEN BEGIN
                                SalesLine2.COPY(SalesLine);
                                SalesLine2.SETRANGE(Type, SalesLine2.Type::Resource);
                                SalesLine2.FILTERGROUP(2);
                                SalesLine2.SETFILTER("No.", ResourceFilter);
                                SalesLine2.FILTERGROUP(0);
                                SalesLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (FAFilter <> '') AND
                               (SalesLine.Type = SalesLine.Type::"Fixed Asset") THEN BEGIN
                                SalesLine2.COPY(SalesLine);
                                SalesLine2.SETRANGE(Type, SalesLine2.Type::"Fixed Asset");
                                SalesLine2.FILTERGROUP(2);
                                SalesLine2.SETFILTER("No.", FAFilter);
                                SalesLine2.FILTERGROUP(0);
                                SalesLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemChargeFilter <> '') AND
                               (SalesLine.Type = SalesLine.Type::"Charge (Item)") THEN BEGIN
                                SalesLine2.COPY(SalesLine);
                                SalesLine2.SETRANGE(Type, SalesLine2.Type::"Charge (Item)");
                                SalesLine2.FILTERGROUP(2);
                                SalesLine2.SETFILTER("No.", ItemChargeFilter);
                                SalesLine2.FILTERGROUP(0);
                                SalesLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                        END ELSE
                            Found := TRUE;

                        IF Found THEN BEGIN
                            SalesLine.CALCFIELDS(
                              "Reserved Quantity", "ATO Whse. Outstanding Qty.", "ATO Whse. Outstd. Qty. (Base)",
                              "Reserved Qty. (Base)", "Substitution Available", "Whse. Outstanding Qty.",
                              "Whse. Outstanding Qty. (Base)", "Qty. to Assign", "Qty. Assigned");
                            INIT;
                            TRANSFERFIELDS(SalesHdr);
                            SetFixedFields(CurrGUID);

                            //add start conside

                            IF lrecCustomer.GET(SalesLine."Sell-to Customer No.") THEN BEGIN
                                "Customer Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("Customer Group") THEN BEGIN
                                "Customer Group Name" := lrecCustomerType."Customer Type Name"
                            END;

                            IF lrecCustomer.GET(SalesLine.EndUser) THEN BEGIN
                                "EndUser Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("EndUser Group") THEN BEGIN
                                "EndUser Group Name" := lrecCustomerType."Customer Type Name"
                            END;


                            "Customer Name 2" := SalesHdr."Sell-to Customer Name 2";
                            "EndUser" := SalesLine.EndUser;
                            "Description(Bikou)" := SalesLine."Description(Bikou)";
                            StorageTemprature := SalesLine.StorageTemprature;
                            "ExternaDocumentNo." := SalesLine."ExternaDocumentNo.";
                            "EU Description" := SalesLine."EU Description";
                            "EU Division 1" := SalesLine."EU Division 1";
                            "EU Division 2" := SalesLine."EU Division 2";
                            "EU Division 3" := SalesLine."EU Division 3";
                            IF lrecItem.GET(SalesLine."No.") THEN BEGIN
                            END;
                            ItemCategoryCodeSearch(lrecItem."Item Category Code", "Item Category Code", "Item Category Description");

                            "Product Group Code" := lrecItem."Item Category Code";//PBCWEST
                            IF lrecItemCategory.GET(lrecItem."Item Category Code") THEN BEGIN
                                "Product Group Description" := lrecItemCategory.Code + lrecItemCategory.Description
                            END;

                            // IF lrecProductGroup.GET(lrecItem."Item Category Code", "Product Group Code") THEN BEGIN
                            //   "Product Group Description" := lrecProductGroup.Code + lrecProductGroup.Description
                            // END; //PBCWEST
                            IF lrecItem.GET(SalesLine."No.") THEN BEGIN
                                StorageTemprature := lrecItem.StorageTemp
                            END;
                            IF lrecItem.GET(SalesLine."No.") THEN BEGIN
                                IF lrecItem."Toxic-KBN" = TRUE THEN BEGIN
                                    ItemToxicKBN := '医療用毒劇物'
                                END
                            END;

                            SerialNoType := 'ﾊﾞｯﾁ';
                            SalesMonth := DATE2DMY(SalesHdr."Posting Date", 2);
                            SalesYear := DATE2DMY(SalesHdr."Posting Date", 3);
                            IF (SalesMonth = 1) OR (SalesMonth = 2) OR (SalesMonth = 3) THEN BEGIN
                                SalesQuater := '第1四半期';
                            END;
                            IF (SalesMonth = 4) OR (SalesMonth = 5) OR (SalesMonth = 6) THEN BEGIN
                                SalesQuater := '第2四半期';
                            END;
                            IF (SalesMonth = 7) OR (SalesMonth = 8) OR (SalesMonth = 9) THEN BEGIN
                                SalesQuater := '第3四半期';
                            END;
                            IF (SalesMonth = 10) OR (SalesMonth = 11) OR (SalesMonth = 12) THEN BEGIN
                                SalesQuater := '第4四半期';
                            END;


                            //SalesYear := DATE2DMY("Posting Date",3);


                            //       "Item Category Description" := lrecItemCaterogy."Description";
                            "Order Status" := SalesHdr.Status;
                            //add end conside
                            "Line No." := SalesLine."Line No.";
                            Type := SalesLine.Type;
                            "No." := SalesLine."No.";
                            IF lrecItem.GET(SalesLine."No.") THEN
                                "Item Description" := lrecItem.Description
                            ELSE
                                "Item Description" := '';
                            "Location Code" := SalesLine."Location Code";
                            "Posting Group" := SalesLine."Posting Group";
                            "Shipment Date" := SalesLine."Shipment Date";
                            Description := SalesLine.Description;
                            "Description 2Ext" := SalesLine.Description;
                            "Unit of MeasureExt" := SalesLine."Unit of Measure";
                            Quantity := SalesLine.Quantity;
                            "Outstanding Quantity" := SalesLine."Outstanding Quantity";
                            "Qty. to Invoice" := SalesLine."Qty. to Invoice";
                            "Qty. to Ship" := SalesLine."Qty. to Ship";
                            "Unit Price" := SalesLine."Unit Price";
                            "Unit Cost (LCY)" := SalesLine."Unit Cost (LCY)";
                            "VAT %" := SalesLine."VAT %";
                            "Line Discount %" := SalesLine."Line Discount %";
                            "Line Discount Amount" := SalesLine."Line Discount Amount";
                            Amount := SalesLine.Amount;
                            "Amount Including VAT" := SalesLine."Amount Including VAT";
                            "Allow Invoice Disc." := SalesLine."Allow Invoice Disc.";
                            "Gross Weight" := SalesLine."Gross Weight";
                            "Net Weight" := SalesLine."Net Weight";
                            "Units per Parcel" := SalesLine."Units per Parcel";
                            "Unit Volume" := SalesLine."Unit Volume";
                            "Appl.-to Item Entry" := SalesLine."Appl.-to Item Entry";
                            "Shortcut Dimension 1 Code" := SalesLine."Shortcut Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := SalesLine."Shortcut Dimension 2 Code";
                            "Customer Price Group" := SalesLine."Customer Price Group";
                            "Job No." := SalesLine."Job No.";
                            "Work Type Code" := SalesLine."Work Type Code";
                            "Outstanding Amount" := SalesLine."Outstanding Amount";
                            "Qty. Shipped Not Invoiced" := SalesLine."Qty. Shipped Not Invoiced";
                            "Shipped Not Invoiced" := SalesLine."Shipped Not Invoiced";
                            "Quantity Shipped" := SalesLine."Quantity Shipped";
                            "Quantity Invoiced" := SalesLine."Quantity Invoiced";
                            "Shipment No." := SalesLine."Shipment No.";
                            "Shipment Line No." := SalesLine."Shipment Line No.";
                            "Profit %" := SalesLine."Profit %";
                            "Inv. Discount Amount" := SalesLine."Inv. Discount Amount";
                            "Purchase Order No." := SalesLine."Purchase Order No.";
                            "Purch. Order Line No." := SalesLine."Purch. Order Line No.";
                            "Drop Shipment" := SalesLine."Drop Shipment";
                            "Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
                            "Gen. Prod. Posting Group" := SalesLine."Gen. Prod. Posting Group";
                            "VAT Calculation Type" := SalesLine."VAT Calculation Type";
                            "Transaction Type" := SalesLine."Transaction Type";
                            "Transport Method" := SalesLine."Transport Method";
                            "Attached to Line No." := SalesLine."Attached to Line No.";
                            "Exit Point" := SalesLine."Exit Point";
                            Area := SalesLine.Area;
                            "Transaction Specification" := SalesLine."Transaction Specification";
                            "Tax Area Code" := SalesLine."Tax Area Code";
                            "Tax Liable" := SalesLine."Tax Liable";
                            "Tax Group Code" := SalesLine."Tax Group Code";
                            "VAT Bus. Posting Group" := SalesLine."VAT Bus. Posting Group";
                            "VAT Prod. Posting Group" := SalesLine."VAT Prod. Posting Group";
                            "Currency Code" := SalesLine."Currency Code";
                            "Outstanding Amount (LCY)" := SalesLine."Outstanding Amount (LCY)";
                            "Shipped Not Invoiced (LCY)" := SalesLine."Shipped Not Invoiced (LCY)";
                            "Reserved Quantity" := SalesLine."Reserved Quantity";
                            Reserve := SalesLine.Reserve;
                            "Blanket Order No." := SalesLine."Blanket Order No.";
                            "Blanket Order Line No." := SalesLine."Blanket Order Line No.";
                            "VAT Base Amount" := SalesLine."VAT Base Amount";
                            "Unit Cost" := SalesLine."Unit Cost";
                            "System-Created Entry" := SalesLine."System-Created Entry";
                            "Line Amount" := SalesLine."Line Amount";
                            "VAT Difference" := SalesLine."VAT Difference";
                            "Inv. Disc. Amount to Invoice" := SalesLine."Inv. Disc. Amount to Invoice";
                            "VAT Identifier" := SalesLine."VAT Identifier";
                            "IC Partner Ref. Type" := SalesLine."IC Partner Ref. Type";
                            "IC Partner Reference" := SalesLine."IC Partner Reference";
                            "Prepayment %" := SalesLine."Prepayment %";
                            "Prepmt. Line Amount" := SalesLine."Prepmt. Line Amount";
                            "Prepmt. Amt. Inv." := SalesLine."Prepmt. Amt. Inv.";
                            "Prepmt. Amt. Incl. VAT" := SalesLine."Prepmt. Amt. Incl. VAT";
                            "Prepayment Amount" := SalesLine."Prepayment Amount";
                            "Prepmt. VAT Base Amt." := SalesLine."Prepmt. VAT Base Amt.";
                            "Prepayment VAT %" := SalesLine."Prepayment VAT %";
                            "Prepmt. VAT Calc. Type" := SalesLine."Prepmt. VAT Calc. Type";
                            "Prepayment VAT Identifier" := SalesLine."Prepayment VAT Identifier";
                            "Prepayment Tax Area Code" := SalesLine."Prepayment Tax Area Code";
                            "Prepayment Tax Liable" := SalesLine."Prepayment Tax Liable";
                            "Prepayment Tax Group Code" := SalesLine."Prepayment Tax Group Code";
                            "Prepmt Amt to Deduct" := SalesLine."Prepmt Amt to Deduct";
                            "Prepmt Amt Deducted" := SalesLine."Prepmt Amt Deducted";
                            "Prepayment Line" := SalesLine."Prepayment Line";
                            "Prepmt. Amount Inv. Incl. VAT" := SalesLine."Prepmt. Amount Inv. Incl. VAT";
                            "Prepmt. Amount Inv. (LCY)" := SalesLine."Prepmt. Amount Inv. (LCY)";
                            "IC Partner Code" := SalesLine."IC Partner Code";
                            "Prepmt. VAT Amount Inv. (LCY)" := SalesLine."Prepmt. VAT Amount Inv. (LCY)";
                            "Prepayment VAT Difference" := SalesLine."Prepayment VAT Difference";
                            "Prepmt VAT Diff. to Deduct" := SalesLine."Prepmt VAT Diff. to Deduct";
                            "Prepmt VAT Diff. Deducted" := SalesLine."Prepmt VAT Diff. Deducted";
                            "Dimension Set ID" := SalesLine."Dimension Set ID";
                            "Qty. to Assemble to Order" := SalesLine."Qty. to Assemble to Order";
                            "Qty. to Asm. to Order (Base)" := SalesLine."Qty. to Asm. to Order (Base)";
                            "ATO Whse. Outstanding Qty." := SalesLine."ATO Whse. Outstanding Qty.";
                            "ATO Whse. Outstd. Qty. (Base)" := SalesLine."ATO Whse. Outstd. Qty. (Base)";
                            "Job Task No." := SalesLine."Job Task No.";
                            "Job Contract Entry No." := SalesLine."Job Contract Entry No.";
                            "Variant Code" := SalesLine."Variant Code";
                            "Bin Code" := SalesLine."Bin Code";
                            "Qty. per Unit of Measure" := SalesLine."Qty. per Unit of Measure";
                            Planned := SalesLine.Planned;
                            "Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            "Quantity (Base)" := SalesLine."Quantity (Base)";
                            "Outstanding Qty. (Base)" := SalesLine."Outstanding Qty. (Base)";
                            "Qty. to Invoice (Base)" := SalesLine."Qty. to Invoice (Base)";
                            "Qty. to Ship (Base)" := SalesLine."Qty. to Ship (Base)";
                            "Qty. Shipped Not Invd. (Base)" := SalesLine."Qty. Shipped Not Invd. (Base)";
                            "Qty. Shipped (Base)" := SalesLine."Qty. Shipped (Base)";
                            "Qty. Invoiced (Base)" := SalesLine."Qty. Invoiced (Base)";
                            "Reserved Qty. (Base)" := SalesLine."Reserved Qty. (Base)";
                            "FA Posting Date" := SalesLine."FA Posting Date";
                            "Depreciation Book Code" := SalesLine."Depreciation Book Code";
                            "Depr. until FA Posting Date" := SalesLine."Depr. until FA Posting Date";
                            "Duplicate in Depreciation Book" := SalesLine."Duplicate in Depreciation Book";
                            "Use Duplication List" := SalesLine."Use Duplication List";
                            "Responsibility Center" := SalesLine."Responsibility Center";
                            "Out-of-Stock Substitution" := SalesLine."Out-of-Stock Substitution";
                            "Substitution Available" := SalesLine."Substitution Available";
                            "Originally Ordered No." := SalesLine."Originally Ordered No.";
                            "Originally Ordered Var. Code" := SalesLine."Originally Ordered Var. Code";
                            "Cross-Reference No." := SalesLine."Cross-Reference No.";
                            "Unit of Measure (Cross Ref.)" := SalesLine."Unit of Measure (Cross Ref.)";
                            "Cross-Reference Type" := SalesLine."Cross-Reference Type";
                            "Cross-Reference Type No." := SalesLine."Cross-Reference Type No.";
                            //"Item Category Code" := SalesLine."Item Category Code";
                            Nonstock := SalesLine.Nonstock;
                            "Purchasing Code" := SalesLine."Purchasing Code";
                            //"Product Group Code" := SalesLine."Product Group Code";//PBCWEST
                            "Special Order" := SalesLine."Special Order";
                            "Special Order Purchase No." := SalesLine."Special Order Purchase No.";
                            "Special Order Purch. Line No." := SalesLine."Special Order Purch. Line No.";
                            "Whse. Outstanding Qty." := SalesLine."Whse. Outstanding Qty.";
                            "Whse. Outstanding Qty. (Base)" := SalesLine."Whse. Outstanding Qty. (Base)";
                            "Completely Shipped" := SalesLine."Completely Shipped";
                            "Requested Delivery Date" := SalesLine."Requested Delivery Date";
                            "Promised Delivery Date" := SalesLine."Promised Delivery Date";
                            "Shipping Time" := SalesLine."Shipping Time";
                            "Outbound Whse. Handling Time" := SalesLine."Outbound Whse. Handling Time";
                            "Planned Delivery Date" := SalesLine."Planned Delivery Date";
                            "Planned Shipment Date" := SalesLine."Planned Shipment Date";
                            "Shipping Agent Code" := SalesLine."Shipping Agent Code";
                            "Shipping Agent Service Code" := SalesLine."Shipping Agent Service Code";
                            "Allow Item Charge Assignment" := SalesLine."Allow Item Charge Assignment";
                            "Qty. to Assign" := SalesLine."Qty. to Assign";
                            "Qty. Assigned" := SalesLine."Qty. Assigned";
                            "Return Qty. to Receive" := SalesLine."Return Qty. to Receive";
                            "Return Qty. to Receive (Base)" := SalesLine."Return Qty. to Receive (Base)";
                            "Return Qty. Rcd. Not Invd." := SalesLine."Return Qty. Rcd. Not Invd.";
                            "Ret. Qty. Rcd. Not Invd.(Base)" := SalesLine."Ret. Qty. Rcd. Not Invd.(Base)";
                            "Return Rcd. Not Invd." := SalesLine."Return Rcd. Not Invd.";
                            "Return Rcd. Not Invd. (LCY)" := SalesLine."Return Rcd. Not Invd. (LCY)";
                            "Return Qty. Received" := SalesLine."Return Qty. Received";
                            "Return Qty. Received (Base)" := SalesLine."Return Qty. Received (Base)";
                            "Appl.-from Item Entry" := SalesLine."Appl.-from Item Entry";
                            "BOM Item No." := SalesLine."BOM Item No.";
                            "Return Receipt No." := SalesLine."Return Receipt No.";
                            "Return Receipt Line No." := SalesLine."Return Receipt Line No.";
                            "Return Reason Code" := SalesLine."Return Reason Code";
                            "Allow Line Disc." := SalesLine."Allow Line Disc.";
                            "Customer Disc. Group" := SalesLine."Customer Disc. Group";
                            //"Collective Invoice No."
                            //"Collective Invoice Line No."
                            "End User" := SalesLine.EndUser;//"End User";
                            "Dealer 1" := SalesLine.Dealer1;//"Dealer 1";
                            "Dealer 2" := SalesLine.Dealer2;//"Dealer 2";
                            "Dealer 3" := SalesLine.Dealer3;//"Dealer 3";
                            DimMgt.GetShortcutDimensions(SalesLine."Dimension Set ID", ShortcutDimCode);
                            "Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            "Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            "Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            "Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            "Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            "Shortcut Dimension 8 Code" := ShortcutDimCode[8];

                            //PBCJP-TRD-002-070-04: BEGIN
                            IF "Currency Code (Hdr.)" = '' THEN BEGIN
                                AmtRoundPrecision := GetRoundingPrecision("Currency Code (Hdr.)");
                                IF "Prices Including VAT" THEN BEGIN
                                    "Total Amount (LCY)" :=
                                      ROUND(("Line Amount" - "Inv. Discount Amount") / ((100 + "VAT %") / 100),
                                      AmtRoundPrecision, VATRoundingDirection(SalesHdr));
                                    "Total Amount Incl. VAT (LCY)" := "Line Amount" - "Inv. Discount Amount";
                                END ELSE BEGIN
                                    "Total Amount (LCY)" := "Line Amount" - "Inv. Discount Amount";
                                    "Total Amount Incl. VAT (LCY)" :=
                                      ROUND(("Line Amount" - "Inv. Discount Amount") * ((100 + "VAT %") / 100),
                                      AmtRoundPrecision, VATRoundingDirection(SalesHdr));
                                END;
                            END ELSE BEGIN
                                SOCalcLCYAmounts(SalesLine, VATRoundingDirection(SalesHdr), "Currency Code (Hdr.)");
                                "Total Amount (LCY)" := SalesLine.Amount;
                                "Total Amount Incl. VAT (LCY)" := SalesLine."Amount Including VAT";
                            END;
                            IF "VAT %" = 0 THEN                                       //PBCJP-TRD-002-070-05
                                "Total Amount Incl. VAT (LCY)" := "Total Amount (LCY)";  //PBCJP-TRD-002-070-05
                                                                                         //AmtRoundPrecision := GetRoundingPrecision("Currency Code (Hdr.)");
                                                                                         //IF "Prices Including VAT" THEN BEGIN
                                                                                         //  "Total Amount (LCY)" :=
                                                                                         //    ROUND(("Line Amount" - "Inv. Discount Amount") / ((100 + "VAT %") / 100),
                                                                                         //    AmtRoundPrecision,SalesHdr.VATRoundingDirection);
                                                                                         //  "Total Amount Incl. VAT (LCY)" := "Line Amount" - "Inv. Discount Amount";
                                                                                         //END ELSE BEGIN
                                                                                         //  "Total Amount (LCY)" := "Line Amount" - "Inv. Discount Amount";
                                                                                         //  "Total Amount Incl. VAT (LCY)" :=
                                                                                         //    ROUND(("Line Amount" - "Inv. Discount Amount") * ((100 + "VAT %") / 100),
                                                                                         //    AmtRoundPrecision,SalesHdr.VATRoundingDirection);
                                                                                         //END;
                                                                                         //
                                                                                         //IF "Currency Code (Hdr.)" <> '' THEN BEGIN
                                                                                         //  "Total Amount (LCY)" :=
                                                                                         //    ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                                                                         //    "Total Amount (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                                                                         //  "Total Amount Incl. VAT (LCY)" :=
                                                                                         //    ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                                                                         //    "Total Amount Incl. VAT (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                                                                         //END;
                                                                                         //PBCJP-TRD-002-070-04: END

                            IF "Document Type" IN ["Document Type"::"Credit Memo", "Document Type"::"Return Order"] THEN BEGIN
                                "Total Qty. (Base)" := -"Quantity (Base)";
                                "Total Amount (LCY)" := -"Total Amount (LCY)";
                                "Total Amount Incl. VAT (LCY)" := -"Total Amount Incl. VAT (LCY)";
                            END ELSE
                                "Total Qty. (Base)" := "Quantity (Base)";

                            TotalQty += "Total Qty. (Base)";
                            TotalAmount += "Total Amount (LCY)";
                            TotalAmountInclVAT += "Total Amount Incl. VAT (LCY)";

                            INSERT;
                        END;
                    UNTIL SalesLine.NEXT = 0;
            UNTIL SalesHdr.NEXT = 0;
    end;

    procedure FindPostedSalesInvoice(CurrGUID: Guid);
    var
        SalesInvLine2: Record "Sales Invoice Line";
        Found: Boolean;
        lrecCustomer: Record Customer;
        lrecCustomerType: Record "Customer Type";
        lrecItemCategory: Record "Item Category";
        lrecItem: Record Item;
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
    begin
        IF NOT PostedSalesInvoice THEN
            EXIT;

        SalesInvHdr.RESET;
        SalesInvLine.RESET;
        IF SelltoCustomerFilter <> '' THEN
            SalesInvHdr.SETFILTER("Sell-to Customer No.", SelltoCustomerFilter);
        IF BilltoCustomerFilter <> '' THEN
            SalesInvHdr.SETFILTER("Bill-to Customer No.", BilltoCustomerFilter);
        IF PostingDateFilter <> '' THEN
            SalesInvHdr.SETFILTER("Posting Date", PostingDateFilter);
        IF OrderDateFilter <> '' THEN
            SalesInvHdr.SETFILTER("Order Date", OrderDateFilter);

        IF SalesInvHdr.FINDSET THEN
            REPEAT
                SalesInvHdr.CALCFIELDS(Comment, Amount, "Amount Including VAT");
                SalesInvLine.SETRANGE("Document No.", SalesInvHdr."No.");
                IF NOT ShowDummyLine THEN
                    SalesInvLine.SETFILTER(Amount, '<>0');

                IF NoFilterCount = 1 THEN BEGIN
                    IF GLAccFilter <> '' THEN BEGIN
                        SalesInvLine.SETRANGE(Type, SalesInvLine.Type::"G/L Account");
                        SalesInvLine.SETFILTER("No.", GLAccFilter);
                    END;
                    IF ItemFilter <> '' THEN BEGIN
                        SalesInvLine.SETRANGE(Type, SalesInvLine.Type::Item);
                        SalesInvLine.SETFILTER("No.", ItemFilter);
                    END;
                    IF ResourceFilter <> '' THEN BEGIN
                        SalesInvLine.SETRANGE(Type, SalesInvLine.Type::Resource);
                        SalesInvLine.SETFILTER("No.", ResourceFilter);
                    END;
                    IF FAFilter <> '' THEN BEGIN
                        SalesInvLine.SETRANGE(Type, SalesInvLine.Type::"Fixed Asset");
                        SalesInvLine.SETFILTER("No.", FAFilter);
                    END;
                    IF ItemChargeFilter <> '' THEN BEGIN
                        SalesInvLine.SETRANGE(Type, SalesInvLine.Type::"Charge (Item)");
                        SalesInvLine.SETFILTER("No.", ItemChargeFilter);
                    END;
                END;

                IF SalesInvLine.FINDSET THEN
                    REPEAT
                        Found := FALSE;
                        IF NoFilterCount > 1 THEN BEGIN
                            IF (GLAccFilter <> '') AND
                               (SalesInvLine.Type = SalesInvLine.Type::"G/L Account") THEN BEGIN
                                SalesInvLine2.COPY(SalesInvLine);
                                SalesInvLine2.SETRANGE(Type, SalesInvLine2.Type::"G/L Account");
                                SalesInvLine2.FILTERGROUP(2);
                                SalesInvLine2.SETFILTER("No.", GLAccFilter);
                                SalesInvLine2.FILTERGROUP(0);
                                SalesInvLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesInvLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemFilter <> '') AND
                               (SalesInvLine.Type = SalesInvLine.Type::Item) THEN BEGIN
                                SalesInvLine2.COPY(SalesInvLine);
                                SalesInvLine2.SETRANGE(Type, SalesInvLine2.Type::Item);
                                SalesInvLine2.FILTERGROUP(2);
                                SalesInvLine2.SETFILTER("No.", ItemFilter);
                                SalesInvLine2.FILTERGROUP(0);
                                SalesInvLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesInvLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ResourceFilter <> '') AND
                               (SalesInvLine.Type = SalesInvLine.Type::Resource) THEN BEGIN
                                SalesInvLine2.COPY(SalesInvLine);
                                SalesInvLine2.SETRANGE(Type, SalesInvLine2.Type::Resource);
                                SalesInvLine2.FILTERGROUP(2);
                                SalesInvLine2.SETFILTER("No.", ResourceFilter);
                                SalesInvLine2.FILTERGROUP(0);
                                SalesInvLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesInvLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (FAFilter <> '') AND
                               (SalesInvLine.Type = SalesInvLine.Type::"Fixed Asset") THEN BEGIN
                                SalesInvLine2.COPY(SalesInvLine);
                                SalesInvLine2.SETRANGE(Type, SalesInvLine2.Type::"Fixed Asset");
                                SalesInvLine2.FILTERGROUP(2);
                                SalesInvLine2.SETFILTER("No.", FAFilter);
                                SalesInvLine2.FILTERGROUP(0);
                                SalesInvLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesInvLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemChargeFilter <> '') AND
                               (SalesInvLine.Type = SalesInvLine.Type::"Charge (Item)") THEN BEGIN
                                SalesInvLine2.COPY(SalesInvLine);
                                SalesInvLine2.SETRANGE(Type, SalesInvLine2.Type::"Charge (Item)");
                                SalesInvLine2.FILTERGROUP(2);
                                SalesInvLine2.SETFILTER("No.", ItemChargeFilter);
                                SalesInvLine2.FILTERGROUP(0);
                                SalesInvLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesInvLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                        END ELSE
                            Found := TRUE;

                        IF Found THEN BEGIN
                            INIT;
                            TRANSFERFIELDS(SalesInvHdr);
                            SetFixedFields(CurrGUID);

                            //add start conside
                            IF lrecCustomer.GET(SalesInvLine."Sell-to Customer No.") THEN BEGIN
                                "Customer Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("Customer Group") THEN BEGIN
                                "Customer Group Name" := lrecCustomerType."Customer Type Name"
                            END;

                            IF lrecCustomer.GET(SalesInvLine.EndUser) THEN BEGIN
                                "EndUser Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("EndUser Group") THEN BEGIN
                                "EndUser Group Name" := lrecCustomerType."Customer Type Name"
                            END;

                            "User ID" := SalesInvHdr."User ID";



                            "Customer Name 2" := SalesInvHdr."Sell-to Customer Name 2";
                            "EndUser" := SalesInvLine.EndUser;//EndUser
                            "Description(Bikou)" := SalesInvLine."Description(Bikou)";
                            StorageTemprature := SalesInvLine.StorageTemprature;
                            "ExternaDocumentNo." := SalesInvLine."ExternaDocumentNo.";
                            "EU Description" := SalesInvLine."EU Description";
                            "EU Division 1" := SalesInvLine."EU Division 1";
                            "EU Division 2" := SalesInvLine."EU Division 2";
                            "EU Division 3" := SalesInvLine."EU Division 3";
                            IF lrecItem.GET(SalesInvLine."No.") THEN BEGIN
                            END;

                            ItemCategoryCodeSearch(lrecItem."Item Category Code", "Item Category Code", "Item Category Description");

                            "Product Group Code" := lrecItem."Item Category Code";//PBCWEST
                            IF lrecItemCategory.GET(lrecItem."Item Category Code") THEN BEGIN
                                "Product Group Description" := lrecItemCategory.Code + lrecItemCategory.Description
                            END;

                            //xProductGroupKey := lrecItem."Item Category Code"+"Product Group Code";//PBCWEST
                            // IF lrecProductGroup.GET(lrecItem."Item Category Code", "Product Group Code") THEN BEGIN
                            //     "Product Group Description" := lrecProductGroup.Code + lrecProductGroup.Description
                            // END;
                            IF lrecItem.GET(SalesInvLine."No.") THEN BEGIN
                                StorageTemprature := lrecItem.StorageTemp
                            END;
                            IF lrecItem.GET(SalesInvLine."No.") THEN BEGIN
                                IF lrecItem."Toxic-KBN" = TRUE THEN BEGIN
                                    ItemToxicKBN := '医療用毒劇物'
                                END
                            END;

                            SerialNoType := 'ﾊﾞｯﾁ';
                            SalesMonth := DATE2DMY(SalesInvHdr."Posting Date", 2);
                            SalesYear := DATE2DMY(SalesInvHdr."Posting Date", 3);
                            IF (SalesMonth = 1) OR (SalesMonth = 2) OR (SalesMonth = 3) THEN BEGIN
                                SalesQuater := '第1四半期';
                            END;
                            IF (SalesMonth = 4) OR (SalesMonth = 5) OR (SalesMonth = 6) THEN BEGIN
                                SalesQuater := '第2四半期';
                            END;
                            IF (SalesMonth = 7) OR (SalesMonth = 8) OR (SalesMonth = 9) THEN BEGIN
                                SalesQuater := '第3四半期';
                            END;
                            IF (SalesMonth = 10) OR (SalesMonth = 11) OR (SalesMonth = 12) THEN BEGIN
                                SalesQuater := '第4四半期';
                            END;


                            //SalesYear := DATE2DMY("Posting Date",3);


                            //       "Item Category Description" := lrecItemCaterogy."Description";
                            "Order Status" := "Order Status"::Released;

                            //add end conside


                            "Document Type" := "Document Type"::"Posted Invoice";
                            "Line No." := SalesInvLine."Line No.";
                            Type := SalesInvLine.Type;
                            "No." := SalesInvLine."No.";
                            IF lrecItem.GET(SalesInvLine."No.") THEN
                                "Item Description" := lrecItem.Description
                            ELSE
                                "Item Description" := '';
                            "Location Code" := SalesInvLine."Location Code";
                            "Posting Group" := SalesInvLine."Posting Group";
                            "Shipment Date" := SalesInvLine."Shipment Date";
                            Description := SalesInvLine.Description;
                            "Description 2Ext" := SalesInvLine.Description;
                            "Unit of MeasureExt" := SalesInvLine."Unit of Measure";
                            Quantity := SalesInvLine.Quantity;
                            //"Outstanding Quantity"
                            //"Qty. to Invoice"
                            //"Qty. to Ship"
                            "Unit Price" := SalesInvLine."Unit Price";
                            "Unit Cost (LCY)" := SalesInvLine."Unit Cost (LCY)";
                            "VAT %" := SalesInvLine."VAT %";
                            "Line Discount %" := SalesInvLine."Line Discount %";
                            "Line Discount Amount" := SalesInvLine."Line Discount Amount";
                            Amount := SalesInvLine.Amount;
                            "Amount Including VAT" := SalesInvLine."Amount Including VAT";
                            "Allow Invoice Disc." := SalesInvLine."Allow Invoice Disc.";
                            "Gross Weight" := SalesInvLine."Gross Weight";
                            "Net Weight" := SalesInvLine."Net Weight";
                            "Units per Parcel" := SalesInvLine."Units per Parcel";
                            "Unit Volume" := SalesInvLine."Unit Volume";
                            "Appl.-to Item Entry" := SalesInvLine."Appl.-to Item Entry";
                            "Shortcut Dimension 1 Code" := SalesInvLine."Shortcut Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := SalesInvLine."Shortcut Dimension 2 Code";
                            "Customer Price Group" := SalesInvLine."Customer Price Group";
                            "Job No." := SalesInvLine."Job No.";
                            "Work Type Code" := SalesInvLine."Work Type Code";
                            //"Outstanding Amount"
                            //"Qty. Shipped Not Invoiced"
                            //"Shipped Not Invoiced"
                            "Quantity Shipped" := SalesInvLine.Quantity;
                            "Quantity Invoiced" := SalesInvLine.Quantity;
                            "Shipment No." := SalesInvLine."Shipment No.";
                            "Shipment Line No." := SalesInvLine."Shipment Line No.";
                            //"Profit %"
                            IF "Currency Code" = '' THEN
                                AmountLCY := SalesInvLine.Amount
                            ELSE
                                AmountLCY :=
                                  CurrExchRate.ExchangeAmtFCYToLCY(WORKDATE, "Currency Code", SalesInvLine.Amount, SalesInvHdr."Currency Factor");

                            ProfitLCY := AmountLCY - "Unit Cost (LCY)" * SalesInvLine.Quantity;
                            IF AmountLCY <> 0 THEN
                                "Profit %" := ROUND(100 * ProfitLCY / AmountLCY, 0.1)
                            ELSE
                                "Profit %" := 0;

                            "Inv. Discount Amount" := SalesInvLine."Inv. Discount Amount";
                            //"Purchase Order No."
                            //"Purch. Order Line No."
                            "Drop Shipment" := SalesInvLine."Drop Shipment";
                            "Gen. Bus. Posting Group" := SalesInvLine."Gen. Bus. Posting Group";
                            "Gen. Prod. Posting Group" := SalesInvLine."Gen. Prod. Posting Group";
                            "VAT Calculation Type" := SalesInvLine."VAT Calculation Type";
                            "Transaction Type" := SalesInvLine."Transaction Type";
                            "Transport Method" := SalesInvLine."Transport Method";
                            "Attached to Line No." := SalesInvLine."Attached to Line No.";
                            "Exit Point" := SalesInvLine."Exit Point";
                            Area := SalesInvLine.Area;
                            "Transaction Specification" := SalesInvLine."Transaction Specification";
                            "Tax Area Code" := SalesInvLine."Tax Area Code";
                            "Tax Liable" := SalesInvLine."Tax Liable";
                            "Tax Group Code" := SalesInvLine."Tax Group Code";
                            "VAT Bus. Posting Group" := SalesInvLine."VAT Bus. Posting Group";
                            "VAT Prod. Posting Group" := SalesInvLine."VAT Prod. Posting Group";
                            //"Currency Code"
                            //"Outstanding Amount (LCY)"
                            //"Shipped Not Invoiced (LCY)"
                            //"Reserved Quantity"
                            //Reserve
                            "Blanket Order No." := SalesInvLine."Blanket Order No.";
                            "Blanket Order Line No." := SalesInvLine."Blanket Order Line No.";
                            "VAT Base Amount" := SalesInvLine."VAT Base Amount";
                            "Unit Cost" := SalesInvLine."Unit Cost";
                            "System-Created Entry" := SalesInvLine."System-Created Entry";
                            "Line Amount" := SalesInvLine."Line Amount";
                            "VAT Difference" := SalesInvLine."VAT Difference";
                            //"Inv. Disc. Amount to Invoice"
                            "VAT Identifier" := SalesInvLine."VAT Identifier";
                            "IC Partner Ref. Type" := SalesInvLine."IC Partner Ref. Type";
                            "IC Partner Reference" := SalesInvLine."IC Partner Reference";
                            //"Prepayment %"
                            //"Prepmt. Line Amount"
                            //"Prepmt. Amt. Inv."
                            //"Prepmt. Amt. Incl. VAT"
                            //"Prepayment Amount"
                            //"Prepmt. VAT Base Amt."
                            //"Prepayment VAT %"
                            //"Prepmt. VAT Calc. Type"
                            //"Prepayment VAT Identifier"
                            //"Prepayment Tax Area Code"
                            //"Prepayment Tax Liable"
                            //"Prepayment Tax Group Code"
                            //"Prepmt Amt to Deduct"
                            //"Prepmt Amt Deducted"
                            "Prepayment Line" := SalesInvLine."Prepayment Line";
                            //"Prepmt. Amount Inv. Incl. VAT"
                            //"Prepmt. Amount Inv. (LCY)"
                            "IC Partner Code" := SalesInvLine."IC Partner Code";
                            //"Prepmt. VAT Amount Inv. (LCY)"
                            //"Prepayment VAT Difference"
                            //"Prepmt VAT Diff. to Deduct"
                            //"Prepmt VAT Diff. Deducted"
                            "Dimension Set ID" := SalesInvLine."Dimension Set ID";
                            //"Qty. to Assemble to Order"
                            //"Qty. to Asm. to Order (Base)"
                            //"ATO Whse. Outstanding Qty."
                            //"ATO Whse. Outstd. Qty. (Base)"
                            "Job Task No." := SalesInvLine."Job Task No.";
                            "Job Contract Entry No." := SalesInvLine."Job Contract Entry No.";
                            "Variant Code" := SalesInvLine."Variant Code";
                            "Bin Code" := SalesInvLine."Bin Code";
                            "Qty. per Unit of Measure" := SalesInvLine."Qty. per Unit of Measure";
                            //Planned
                            "Unit of Measure Code" := SalesInvLine."Unit of Measure Code";
                            "Quantity (Base)" := SalesInvLine."Quantity (Base)";
                            //"Outstanding Qty. (Base)"
                            //"Qty. to Invoice (Base)"
                            //"Qty. to Ship (Base)"
                            //"Qty. Shipped Not Invd. (Base)"
                            //"Qty. Shipped (Base)"
                            //"Qty. Invoiced (Base)"
                            //"Reserved Qty. (Base)"
                            "FA Posting Date" := SalesInvLine."FA Posting Date";
                            "Depreciation Book Code" := SalesInvLine."Depreciation Book Code";
                            "Depr. until FA Posting Date" := SalesInvLine."Depr. until FA Posting Date";
                            "Duplicate in Depreciation Book" := SalesInvLine."Duplicate in Depreciation Book";
                            "Use Duplication List" := SalesInvLine."Use Duplication List";
                            "Responsibility Center" := SalesInvLine."Responsibility Center";
                            //"Out-of-Stock Substitution"
                            //"Substitution Available"
                            //"Originally Ordered No."
                            //"Originally Ordered Var. Code"
                            "Cross-Reference No." := SalesInvLine."Cross-Reference No.";
                            "Unit of Measure (Cross Ref.)" := SalesInvLine."Unit of Measure (Cross Ref.)";
                            "Cross-Reference Type" := SalesInvLine."Cross-Reference Type";
                            "Cross-Reference Type No." := SalesInvLine."Cross-Reference Type No.";
                            //"Item Category Code" := SalesInvLine."Item Category Code";
                            Nonstock := SalesInvLine.Nonstock;
                            "Purchasing Code" := SalesInvLine."Purchasing Code";
                            // "Product Group Code" := SalesInvLine."Product Group Code";//PBCWEST
                            //"Special Order"
                            //"Special Order Purchase No."
                            //"Special Order Purch. Line No."
                            //"Whse. Outstanding Qty."
                            //"Whse. Outstanding Qty. (Base)"
                            //"Completely Shipped"
                            //"Requested Delivery Date"
                            //"Promised Delivery Date"
                            //"Shipping Time"
                            //"Outbound Whse. Handling Time"
                            //"Planned Delivery Date"
                            //"Planned Shipment Date"
                            //"Shipping Agent Code"
                            //"Shipping Agent Service Code"
                            //"Allow Item Charge Assignment"
                            //"Qty. to Assign"
                            //"Qty. Assigned"
                            //"Return Qty. to Receive"
                            //"Return Qty. to Receive (Base)"
                            //"Return Qty. Rcd. Not Invd."
                            //"Ret. Qty. Rcd. Not Invd.(Base)"
                            //"Return Rcd. Not Invd."
                            //"Return Rcd. Not Invd. (LCY)"
                            //"Return Qty. Received"
                            //"Return Qty. Received (Base)"
                            "Appl.-from Item Entry" := SalesInvLine."Appl.-from Item Entry";
                            //"BOM Item No."
                            //"Return Receipt No."
                            //"Return Receipt Line No."
                            "Return Reason Code" := SalesInvLine."Return Reason Code";
                            "Allow Line Disc." := SalesInvLine."Allow Line Disc.";
                            "Customer Disc. Group" := SalesInvLine."Customer Disc. Group";
                            "Collective Invoice No." := SalesInvLine."Collective Invoice No.";
                            "Collective Invoice Line No." := SalesInvLine."Collective Invoice Line No.";
                            "End User" := SalesInvLine.EndUser;//"End User";
                            "Dealer 1" := SalesInvLine.Dealer1;//"Dealer 1";
                            "Dealer 2" := SalesInvLine.Dealer2;//"Dealer 2";
                            "Dealer 3" := SalesInvLine.Dealer3;//"Dealer 3";
                            DimMgt.GetShortcutDimensions(SalesInvLine."Dimension Set ID", ShortcutDimCode);
                            "Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            "Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            "Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            "Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            "Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            "Shortcut Dimension 8 Code" := ShortcutDimCode[8];

                            "Total Qty. (Base)" := "Quantity (Base)";
                            "Total Amount (LCY)" := Amount;
                            "Total Amount Incl. VAT (LCY)" := "Amount Including VAT";

                            IF "Currency Code (Hdr.)" <> '' THEN BEGIN
                                //PBCJP-TRD-002-070-04: BEGIN
                                PSICalcLCYAmounts(SalesInvLine, "Currency Code (Hdr.)");
                                "Total Amount (LCY)" := SalesInvLine.Amount;
                                "Total Amount Incl. VAT (LCY)" := SalesInvLine."Amount Including VAT";
                                //"Total Amount (LCY)" :=
                                //  ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                //  "Total Amount (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                //"Total Amount Incl. VAT (LCY)" :=
                                //  ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                //  "Total Amount Incl. VAT (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                //PBCJP-TRD-002-070-04: END

                            END;
                            IF "VAT %" = 0 THEN                                       //PBCJP-TRD-002-070-05
                                "Total Amount Incl. VAT (LCY)" := "Total Amount (LCY)";  //PBCJP-TRD-002-070-05

                            TotalQty += "Total Qty. (Base)";
                            TotalAmount += "Total Amount (LCY)";
                            TotalAmountInclVAT += "Total Amount Incl. VAT (LCY)";

                            INSERT;
                        END;
                    UNTIL SalesInvLine.NEXT = 0;
            UNTIL SalesInvHdr.NEXT = 0;
    end;

    procedure FindPostedSalesCrMemo(CurrGUID: Guid);
    var
        SalesCrMemoLine2: Record "Sales Cr.Memo Line";
        Found: Boolean;
        lrecCustomer: Record Customer;
        lrecCustomerType: Record "Customer Type";
        lrecItemCategory: Record "Item Category";
        lrecItem: Record Item;
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
    begin
        IF NOT PostedSalesCrMemo THEN
            EXIT;

        SalesCrMemoHdr.RESET;
        SalesCrMemoLine.RESET;
        IF SelltoCustomerFilter <> '' THEN
            SalesCrMemoHdr.SETFILTER("Sell-to Customer No.", SelltoCustomerFilter);
        IF BilltoCustomerFilter <> '' THEN
            SalesCrMemoHdr.SETFILTER("Bill-to Customer No.", BilltoCustomerFilter);
        IF PostingDateFilter <> '' THEN
            SalesCrMemoHdr.SETFILTER("Posting Date", PostingDateFilter);
        IF OrderDateFilter <> '' THEN
            SalesCrMemoHdr.SETFILTER("Document Date", OrderDateFilter);

        IF SalesCrMemoHdr.FINDSET THEN
            REPEAT
                SalesCrMemoHdr.CALCFIELDS(Comment, Amount, "Amount Including VAT");
                SalesCrMemoLine.SETRANGE("Document No.", SalesCrMemoHdr."No.");
                IF NOT ShowDummyLine THEN
                    SalesCrMemoLine.SETFILTER(Amount, '<>0');

                IF NoFilterCount = 1 THEN BEGIN
                    IF GLAccFilter <> '' THEN BEGIN
                        SalesCrMemoLine.SETRANGE(Type, SalesCrMemoLine.Type::"G/L Account");
                        SalesCrMemoLine.SETFILTER("No.", GLAccFilter);
                    END;
                    IF ItemFilter <> '' THEN BEGIN
                        SalesCrMemoLine.SETRANGE(Type, SalesCrMemoLine.Type::Item);
                        SalesCrMemoLine.SETFILTER("No.", ItemFilter);
                    END;
                    IF ResourceFilter <> '' THEN BEGIN
                        SalesCrMemoLine.SETRANGE(Type, SalesCrMemoLine.Type::Resource);
                        SalesCrMemoLine.SETFILTER("No.", ResourceFilter);
                    END;
                    IF FAFilter <> '' THEN BEGIN
                        SalesCrMemoLine.SETRANGE(Type, SalesCrMemoLine.Type::"Fixed Asset");
                        SalesCrMemoLine.SETFILTER("No.", FAFilter);
                    END;
                    IF ItemChargeFilter <> '' THEN BEGIN
                        SalesCrMemoLine.SETRANGE(Type, SalesCrMemoLine.Type::"Charge (Item)");
                        SalesCrMemoLine.SETFILTER("No.", ItemChargeFilter);
                    END;
                END;

                IF SalesCrMemoLine.FINDSET THEN
                    REPEAT
                        Found := FALSE;
                        IF NoFilterCount > 1 THEN BEGIN
                            IF (GLAccFilter <> '') AND
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::"G/L Account") THEN BEGIN
                                SalesCrMemoLine2.COPY(SalesCrMemoLine);
                                SalesCrMemoLine2.SETRANGE(Type, SalesCrMemoLine2.Type::"G/L Account");
                                SalesCrMemoLine2.FILTERGROUP(2);
                                SalesCrMemoLine2.SETFILTER("No.", GLAccFilter);
                                SalesCrMemoLine2.FILTERGROUP(0);
                                SalesCrMemoLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesCrMemoLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemFilter <> '') AND
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::Item) THEN BEGIN
                                SalesCrMemoLine2.COPY(SalesCrMemoLine);
                                SalesCrMemoLine2.SETRANGE(Type, SalesCrMemoLine2.Type::Item);
                                SalesCrMemoLine2.FILTERGROUP(2);
                                SalesCrMemoLine2.SETFILTER("No.", ItemFilter);
                                SalesCrMemoLine2.FILTERGROUP(0);
                                SalesCrMemoLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesCrMemoLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ResourceFilter <> '') AND
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::Resource) THEN BEGIN
                                SalesCrMemoLine2.COPY(SalesCrMemoLine);
                                SalesCrMemoLine2.SETRANGE(Type, SalesCrMemoLine2.Type::Resource);
                                SalesCrMemoLine2.FILTERGROUP(2);
                                SalesCrMemoLine2.SETFILTER("No.", ResourceFilter);
                                SalesCrMemoLine2.FILTERGROUP(0);
                                SalesCrMemoLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesCrMemoLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (FAFilter <> '') AND
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::"Fixed Asset") THEN BEGIN
                                SalesCrMemoLine2.COPY(SalesCrMemoLine);
                                SalesCrMemoLine2.SETRANGE(Type, SalesCrMemoLine2.Type::"Fixed Asset");
                                SalesCrMemoLine2.FILTERGROUP(2);
                                SalesCrMemoLine2.SETFILTER("No.", FAFilter);
                                SalesCrMemoLine2.FILTERGROUP(0);
                                SalesCrMemoLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesCrMemoLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                            IF (ItemChargeFilter <> '') AND
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::"Charge (Item)") THEN BEGIN
                                SalesCrMemoLine2.COPY(SalesCrMemoLine);
                                SalesCrMemoLine2.SETRANGE(Type, SalesCrMemoLine2.Type::"Charge (Item)");
                                SalesCrMemoLine2.FILTERGROUP(2);
                                SalesCrMemoLine2.SETFILTER("No.", ItemChargeFilter);
                                SalesCrMemoLine2.FILTERGROUP(0);
                                SalesCrMemoLine2.SETRANGE("No.", SalesLine."No.");
                                IF NOT SalesCrMemoLine2.ISEMPTY THEN
                                    Found := TRUE;
                            END;
                        END ELSE
                            Found := TRUE;

                        IF Found THEN BEGIN
                            INIT;
                            TRANSFERFIELDS(SalesCrMemoHdr);
                            SetFixedFields(CurrGUID);

                            //add start conside
                            IF lrecCustomer.GET(SalesCrMemoLine."Sell-to Customer No.") THEN BEGIN
                                "Customer Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("Customer Group") THEN BEGIN
                                "Customer Group Name" := lrecCustomerType."Customer Type Name"
                            END;

                            IF lrecCustomer.GET(SalesCrMemoLine.EndUser) THEN BEGIN
                                "EndUser Group" := lrecCustomer."Customer Group"
                            END;
                            IF lrecCustomerType.GET("EndUser Group") THEN BEGIN
                                "EndUser Group Name" := lrecCustomerType."Customer Type Name"
                            END;

                            "User ID" := SalesCrMemoHdr."User ID";//lrecSalesInvHeader



                            "Customer Name 2" := SalesCrMemoHdr."Sell-to Customer Name 2";
                            EndUser := SalesCrMemoLine.EndUser;//EndUser
                            "Description(Bikou)" := SalesCrMemoLine."Description(Bikou)";
                            StorageTemprature := SalesCrMemoLine.StorageTemprature;
                            "ExternaDocumentNo." := SalesCrMemoLine."ExternaDocumentNo.";
                            "EU Description" := SalesCrMemoLine."EU Description";
                            "EU Division 1" := SalesCrMemoLine."EU Division 1";
                            "EU Division 2" := SalesCrMemoLine."EU Division 2";
                            "EU Division 3" := SalesCrMemoLine."EU Division 3";
                            IF lrecItem.GET(SalesCrMemoLine."No.") THEN BEGIN
                            END;

                            ItemCategoryCodeSearch(lrecItem."Item Category Code", "Item Category Code", "Item Category Description");

                            "Product Group Code" := lrecItem."Item Category Code";//PBCWEST
                            IF lrecItemCategory.GET(lrecItem."Item Category Code") THEN BEGIN
                                "Product Group Description" := lrecItemCategory.Code + lrecItemCategory.Description
                            END;

                            //xProductGroupKey := lrecItem."Item Category Code"+"Product Group Code";
                            // IF lrecProductGroup.GET(lrecItem."Item Category Code", "Product Group Code") THEN BEGIN
                            //   "Product Group Description" := lrecProductGroup.Code + lrecProductGroup.Description
                            // END; //PBCWEST
                            IF lrecItem.GET(SalesCrMemoLine."No.") THEN BEGIN
                                StorageTemprature := lrecItem.StorageTemp
                            END;
                            IF lrecItem.GET(SalesCrMemoLine."No.") THEN BEGIN
                                IF lrecItem."Toxic-KBN" = TRUE THEN BEGIN
                                    ItemToxicKBN := '医療用毒劇物'
                                END
                            END;

                            SerialNoType := 'ﾊﾞｯﾁ';
                            SalesMonth := DATE2DMY(SalesCrMemoHdr."Posting Date", 2);
                            SalesYear := DATE2DMY(SalesCrMemoHdr."Posting Date", 3);
                            IF (SalesMonth = 1) OR (SalesMonth = 2) OR (SalesMonth = 3) THEN BEGIN
                                SalesQuater := '第1四半期';
                            END;
                            IF (SalesMonth = 4) OR (SalesMonth = 5) OR (SalesMonth = 6) THEN BEGIN
                                SalesQuater := '第2四半期';
                            END;
                            IF (SalesMonth = 7) OR (SalesMonth = 8) OR (SalesMonth = 9) THEN BEGIN
                                SalesQuater := '第3四半期';
                            END;
                            IF (SalesMonth = 10) OR (SalesMonth = 11) OR (SalesMonth = 12) THEN BEGIN
                                SalesQuater := '第4四半期';
                            END;


                            //SalesYear := DATE2DMY("Posting Date",3);


                            //       "Item Category Description" := lrecItemCaterogy."Description";
                            "Order Status" := "Order Status"::Released;
                            //add end conside
                            "Document Type" := "Document Type"::"Posted Credit Memo";
                            "Line No." := SalesCrMemoLine."Line No.";
                            Type := SalesCrMemoLine.Type;
                            "No." := SalesCrMemoLine."No.";
                            IF lrecItem.GET(SalesCrMemoLine."No.") THEN
                                "Item Description" := lrecItem.Description
                            ELSE
                                "Item Description" := '';
                            "Location Code" := SalesCrMemoLine."Location Code";
                            "Posting Group" := SalesCrMemoLine."Posting Group";
                            "Shipment Date" := SalesCrMemoLine."Shipment Date";
                            Description := SalesCrMemoLine.Description;
                            "Description 2Ext" := SalesCrMemoLine.Description;
                            "Unit of MeasureExt" := SalesCrMemoLine."Unit of Measure";
                            Quantity := -1 * SalesCrMemoLine.Quantity;
                            //"Outstanding Quantity"
                            //"Qty. to Invoice"
                            //"Qty. to Ship"
                            "Unit Price" := SalesCrMemoLine."Unit Price";
                            "Unit Cost (LCY)" := SalesCrMemoLine."Unit Cost (LCY)";
                            "VAT %" := SalesCrMemoLine."VAT %";
                            "Line Discount %" := SalesCrMemoLine."Line Discount %";
                            "Line Discount Amount" := SalesCrMemoLine."Line Discount Amount";
                            Amount := symbolconvert(Quantity) * SalesCrMemoLine.Amount;
                            "Amount Including VAT" := symbolconvert(Quantity) * SalesCrMemoLine."Amount Including VAT";
                            "Allow Invoice Disc." := SalesCrMemoLine."Allow Invoice Disc.";
                            "Gross Weight" := SalesCrMemoLine."Gross Weight";
                            "Net Weight" := SalesCrMemoLine."Net Weight";
                            "Units per Parcel" := SalesCrMemoLine."Units per Parcel";
                            "Unit Volume" := SalesCrMemoLine."Unit Volume";
                            "Appl.-to Item Entry" := SalesCrMemoLine."Appl.-to Item Entry";
                            "Shortcut Dimension 1 Code" := SalesCrMemoLine."Shortcut Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := SalesCrMemoLine."Shortcut Dimension 2 Code";
                            "Customer Price Group" := SalesCrMemoLine."Customer Price Group";
                            "Job No." := SalesCrMemoLine."Job No.";
                            "Work Type Code" := SalesCrMemoLine."Work Type Code";
                            //"Outstanding Amount"
                            //"Qty. Shipped Not Invoiced"
                            //"Shipped Not Invoiced"
                            "Quantity Shipped" := -SalesCrMemoLine.Quantity;
                            "Quantity Invoiced" := -SalesCrMemoLine.Quantity;
                            //"Shipment No."
                            //"Shipment Line No."
                            //"Profit %"

                            IF "Currency Code" = '' THEN
                                AmountLCY := SalesCrMemoLine.Amount
                            ELSE
                                AmountLCY :=
                                  CurrExchRate.ExchangeAmtFCYToLCY(
                                  WORKDATE, "Currency Code", SalesCrMemoLine.Amount, SalesCrMemoHdr."Currency Factor");

                            ProfitLCY := AmountLCY - "Unit Cost (LCY)" * SalesCrMemoLine.Quantity;
                            IF AmountLCY <> 0 THEN
                                "Profit %" := ROUND(100 * ProfitLCY / AmountLCY, 0.1)
                            ELSE
                                "Profit %" := 0;
                            "Inv. Discount Amount" := SalesCrMemoLine."Inv. Discount Amount";
                            //"Purchase Order No."
                            //"Purch. Order Line No."
                            //"Drop Shipment"
                            "Gen. Bus. Posting Group" := SalesCrMemoLine."Gen. Bus. Posting Group";
                            "Gen. Prod. Posting Group" := SalesCrMemoLine."Gen. Prod. Posting Group";
                            "VAT Calculation Type" := SalesCrMemoLine."VAT Calculation Type";
                            "Transaction Type" := SalesCrMemoLine."Transaction Type";
                            "Transport Method" := SalesCrMemoLine."Transport Method";
                            "Attached to Line No." := SalesCrMemoLine."Attached to Line No.";
                            "Exit Point" := SalesCrMemoLine."Exit Point";
                            Area := SalesCrMemoLine.Area;
                            "Transaction Specification" := SalesCrMemoLine."Transaction Specification";
                            "Tax Area Code" := SalesCrMemoLine."Tax Area Code";
                            "Tax Liable" := SalesCrMemoLine."Tax Liable";
                            "Tax Group Code" := SalesCrMemoLine."Tax Group Code";
                            "VAT Bus. Posting Group" := SalesCrMemoLine."VAT Bus. Posting Group";
                            "VAT Prod. Posting Group" := SalesCrMemoLine."VAT Prod. Posting Group";
                            //"Currency Code"
                            //"Outstanding Amount (LCY)"
                            //"Shipped Not Invoiced (LCY)"
                            //"Reserved Quantity"
                            //Reserve
                            "Blanket Order No." := SalesCrMemoLine."Blanket Order No.";
                            "Blanket Order Line No." := SalesCrMemoLine."Blanket Order Line No.";
                            "VAT Base Amount" := SalesCrMemoLine."VAT Base Amount";
                            "Unit Cost" := SalesCrMemoLine."Unit Cost";
                            "System-Created Entry" := SalesCrMemoLine."System-Created Entry";
                            "Line Amount" := SalesCrMemoLine."Line Amount";
                            "VAT Difference" := SalesCrMemoLine."VAT Difference";
                            //"Inv. Disc. Amount to Invoice"
                            "VAT Identifier" := SalesCrMemoLine."VAT Identifier";
                            "IC Partner Ref. Type" := SalesCrMemoLine."IC Partner Ref. Type";
                            "IC Partner Reference" := SalesCrMemoLine."IC Partner Reference";
                            //"Prepayment %"
                            //"Prepmt. Line Amount"
                            //"Prepmt. Amt. Inv."
                            //"Prepmt. Amt. Incl. VAT"
                            //"Prepayment Amount"
                            //"Prepmt. VAT Base Amt."
                            //"Prepayment VAT %"
                            //"Prepmt. VAT Calc. Type"
                            //"Prepayment VAT Identifier"
                            //"Prepayment Tax Area Code"
                            //"Prepayment Tax Liable"
                            //"Prepayment Tax Group Code"
                            //"Prepmt Amt to Deduct"
                            //"Prepmt Amt Deducted"
                            "Prepayment Line" := SalesCrMemoLine."Prepayment Line";
                            //"Prepmt. Amount Inv. Incl. VAT"
                            //"Prepmt. Amount Inv. (LCY)"
                            "IC Partner Code" := SalesCrMemoLine."IC Partner Code";
                            //"Prepmt. VAT Amount Inv. (LCY)"
                            //"Prepayment VAT Difference"
                            //"Prepmt VAT Diff. to Deduct"
                            //"Prepmt VAT Diff. Deducted"
                            "Dimension Set ID" := SalesCrMemoLine."Dimension Set ID";
                            //"Qty. to Assemble to Order"
                            //"Qty. to Asm. to Order (Base)"
                            //"ATO Whse. Outstanding Qty."
                            //"ATO Whse. Outstd. Qty. (Base)"
                            "Job Task No." := SalesCrMemoLine."Job Task No.";
                            "Job Contract Entry No." := SalesCrMemoLine."Job Contract Entry No.";
                            "Variant Code" := SalesCrMemoLine."Variant Code";
                            "Bin Code" := SalesCrMemoLine."Bin Code";
                            "Qty. per Unit of Measure" := SalesCrMemoLine."Qty. per Unit of Measure";
                            //Planned
                            "Unit of Measure Code" := SalesCrMemoLine."Unit of Measure Code";
                            "Quantity (Base)" := SalesCrMemoLine."Quantity (Base)";
                            //"Outstanding Qty. (Base)"
                            //"Qty. to Invoice (Base)"
                            //"Qty. to Ship (Base)"
                            //"Qty. Shipped Not Invd. (Base)"
                            //"Qty. Shipped (Base)"
                            //"Qty. Invoiced (Base)"
                            //"Reserved Qty. (Base)"
                            "FA Posting Date" := SalesCrMemoLine."FA Posting Date";
                            "Depreciation Book Code" := SalesCrMemoLine."Depreciation Book Code";
                            "Depr. until FA Posting Date" := SalesCrMemoLine."Depr. until FA Posting Date";
                            "Duplicate in Depreciation Book" := SalesCrMemoLine."Duplicate in Depreciation Book";
                            "Use Duplication List" := SalesCrMemoLine."Use Duplication List";
                            "Responsibility Center" := SalesCrMemoLine."Responsibility Center";
                            //"Out-of-Stock Substitution"
                            //"Substitution Available"
                            //"Originally Ordered No."
                            //"Originally Ordered Var. Code"
                            "Cross-Reference No." := SalesCrMemoLine."Cross-Reference No.";
                            "Unit of Measure (Cross Ref.)" := SalesCrMemoLine."Unit of Measure (Cross Ref.)";
                            "Cross-Reference Type" := SalesCrMemoLine."Cross-Reference Type";
                            "Cross-Reference Type No." := SalesCrMemoLine."Cross-Reference Type No.";
                            //"Item Category Code" := SalesCrMemoLine."Item Category Code";
                            Nonstock := SalesCrMemoLine.Nonstock;
                            "Purchasing Code" := SalesCrMemoLine."Purchasing Code";
                            // "Product Group Code" := SalesCrMemoLine."Product Group Code";//PBCWEST
                            //"Special Order"
                            //"Special Order Purchase No."
                            //"Special Order Purch. Line No."
                            //"Whse. Outstanding Qty."
                            //"Whse. Outstanding Qty. (Base)"
                            //"Completely Shipped"
                            //"Requested Delivery Date"
                            //"Promised Delivery Date"
                            //"Shipping Time"
                            //"Outbound Whse. Handling Time"
                            //"Planned Delivery Date"
                            //"Planned Shipment Date"
                            //"Shipping Agent Code"
                            //"Shipping Agent Service Code"
                            //"Allow Item Charge Assignment"
                            //"Qty. to Assign"
                            //"Qty. Assigned"
                            //"Return Qty. to Receive"
                            //"Return Qty. to Receive (Base)"
                            //"Return Qty. Rcd. Not Invd."
                            //"Ret. Qty. Rcd. Not Invd.(Base)"
                            //"Return Rcd. Not Invd."
                            //"Return Rcd. Not Invd. (LCY)"
                            //"Return Qty. Received"
                            //"Return Qty. Received (Base)"
                            "Appl.-from Item Entry" := SalesCrMemoLine."Appl.-from Item Entry";
                            //"BOM Item No."
                            "Return Receipt No." := SalesCrMemoLine."Return Receipt No.";
                            "Return Receipt Line No." := SalesCrMemoLine."Return Receipt Line No.";
                            "Return Reason Code" := SalesCrMemoLine."Return Reason Code";
                            "Allow Line Disc." := SalesCrMemoLine."Allow Line Disc.";
                            "Customer Disc. Group" := SalesCrMemoLine."Customer Disc. Group";
                            "Collective Invoice No." := SalesCrMemoLine."Collective Invoice No.";
                            "Collective Invoice Line No." := SalesCrMemoLine."Collective Invoice Line No.";
                            "End User" := SalesCrMemoLine.EndUser;//"End User";
                            "Dealer 1" := SalesCrMemoLine.Dealer1;//"Dealer 1";
                            "Dealer 2" := SalesCrMemoLine.Dealer2;//"Dealer 2";
                            "Dealer 3" := SalesCrMemoLine.Dealer3;//"Dealer 3";
                            DimMgt.GetShortcutDimensions(SalesCrMemoLine."Dimension Set ID", ShortcutDimCode);
                            "Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            "Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            "Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            "Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            "Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            "Shortcut Dimension 8 Code" := ShortcutDimCode[8];

                            "Total Qty. (Base)" := -"Quantity (Base)";
                            "Total Amount (LCY)" := Amount;
                            "Total Amount Incl. VAT (LCY)" := "Amount Including VAT";

                            IF "Currency Code (Hdr.)" <> '' THEN BEGIN

                                //PBCJP-TRD-002-070-04: BEGIN
                                PSCCalcLCYAmounts(SalesCrMemoLine, "Currency Code (Hdr.)");
                                "Total Amount (LCY)" := SalesCrMemoLine.Amount;
                                "Total Amount Incl. VAT (LCY)" := SalesCrMemoLine."Amount Including VAT";
                                //"Total Amount (LCY)" :=
                                //  ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                //  "Total Amount (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                //"Total Amount Incl. VAT (LCY)" :=
                                //  ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetDate("Posting Date"),"Currency Code (Hdr.)",
                                //  "Total Amount Incl. VAT (LCY)","Currency Factor"),GLSetup."Amount Rounding Precision");
                                //PBCJP-TRD-002-070-04: BEGIN

                            END;
                            IF "VAT %" = 0 THEN                                        //PBCJP-TRD-002-070-05
                                "Total Amount Incl. VAT (LCY)" := "Total Amount (LCY)";  //PBCJP-TRD-002-070-05

                            TotalQty += "Total Qty. (Base)";
                            TotalAmount += "Total Amount (LCY)";
                            TotalAmountInclVAT += "Total Amount Incl. VAT (LCY)";

                            INSERT;
                        END;
                    UNTIL SalesCrMemoLine.NEXT = 0;
            UNTIL SalesCrMemoHdr.NEXT = 0;
    end;

    procedure SOCalcLCYAmounts(var InqSalesLine: Record "Sales Line"; RoundType: Text[1]; CurrencyCode: Code[10]);
    var
        CalcSalesLine: Record "Sales Line";
        TempSalesLine: Record "Sales Line" temporary;
        CalcAmount: array[3] of Decimal;
        CalcAmountInclVAT: array[3] of Decimal;
    begin
        //PBCJP-TRD-002-080-04: BEGIN
        WITH CalcSalesLine DO BEGIN
            AmtRoundPrecision := GetRoundingPrecision(CurrencyCode);
            TempSalesLine.RESET;
            TempSalesLine.DELETEALL;
            SETRANGE("Document Type", InqSalesLine."Document Type");
            SETRANGE("Document No.", InqSalesLine."Document No.");
            IF FINDSET THEN
                REPEAT
                    IF "Line Amount" - "Inv. Discount Amount" <> 0 THEN BEGIN
                        TempSalesLine.INIT;
                        TempSalesLine."Document Type" := "Document Type";
                        TempSalesLine."Document No." := "Document No.";
                        TempSalesLine."Line No." := "Line No.";

                        IF "Prices Including VAT" THEN BEGIN
                            TempSalesLine.Amount :=
                              ROUND(("Line Amount" - "Inv. Discount Amount") / ((100 + "VAT %") / 100),
                                    AmtRoundPrecision, RoundType);
                            TempSalesLine."Amount Including VAT" := "Line Amount" - "Inv. Discount Amount";
                        END ELSE BEGIN
                            TempSalesLine.Amount := "Line Amount" - "Inv. Discount Amount";
                            TempSalesLine."Amount Including VAT" :=
                              ROUND(("Line Amount" - "Inv. Discount Amount") * ((100 + "VAT %") / 100),
                                    AmtRoundPrecision, RoundType);
                        END;

                        CalcAmount[1] += TempSalesLine.Amount;
                        CalcAmountInclVAT[1] += TempSalesLine."Amount Including VAT";
                        CalcAmount[2] :=
                          ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                CalcAmount[1], "Currency Factor"));
                        IF Amount <> "Amount Including VAT" THEN
                            CalcAmountInclVAT[2] :=
                              ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                    CalcAmountInclVAT[1], "Currency Factor"))
                        ELSE
                            CalcAmountInclVAT[2] := CalcAmount[2];

                        TempSalesLine.Amount := CalcAmount[2] - CalcAmount[3];
                        TempSalesLine."Amount Including VAT" := CalcAmountInclVAT[2] - CalcAmountInclVAT[3];
                        CalcAmount[3] += TempSalesLine.Amount;
                        CalcAmountInclVAT[3] += TempSalesLine."Amount Including VAT";
                        TempSalesLine.INSERT;
                    END;
                UNTIL NEXT = 0;

            IF TempSalesLine.GET(InqSalesLine."Document Type", InqSalesLine."Document No.", InqSalesLine."Line No.") THEN BEGIN
                InqSalesLine.Amount := TempSalesLine.Amount;
                InqSalesLine."Amount Including VAT" := TempSalesLine."Amount Including VAT";
            END ELSE BEGIN
                InqSalesLine.Amount := 0;
                InqSalesLine."Amount Including VAT" := 0;
            END;
        END;
        //PBCJP-TRD-002-080-04: END
    end;

    procedure PSICalcLCYAmounts(var InqSalesInvLine: Record "Sales Invoice Line"; CurrencyCode: Code[10]): Decimal;
    var
        CalcSalesInvLine: Record "Sales Invoice Line";
        TempSalesInvLine: Record "Sales Invoice Line" temporary;
        CalcAmount: array[3] of Decimal;
        CalcAmountInclVAT: array[3] of Decimal;
        DocType: Option " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo";
    begin
        //PBCJP-TRD-002-080-04: BEGIN
        WITH CalcSalesInvLine DO BEGIN
            TempSalesInvLine.RESET;
            TempSalesInvLine.DELETEALL;
            SETRANGE("Document No.", InqSalesInvLine."Document No.");
            IF FINDSET THEN
                REPEAT
                    IF Amount <> 0 THEN BEGIN
                        TempSalesInvLine.INIT;
                        TempSalesInvLine."Document No." := "Document No.";
                        TempSalesInvLine."Line No." := "Line No.";
                        CalcAmount[1] += Amount;
                        CalcAmountInclVAT[1] += "Amount Including VAT";
                        CalcAmount[2] :=
                          ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                CalcAmount[1], "Currency Factor"));
                        IF Amount <> "Amount Including VAT" THEN
                            CalcAmountInclVAT[2] :=
                              ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                    CalcAmountInclVAT[1], "Currency Factor"))
                        ELSE
                            CalcAmountInclVAT[2] := CalcAmount[2];

                        TempSalesInvLine.Amount := CalcAmount[2] - CalcAmount[3];
                        TempSalesInvLine."Amount Including VAT" := CalcAmountInclVAT[2] - CalcAmountInclVAT[3];
                        CalcAmount[3] += TempSalesInvLine.Amount;
                        CalcAmountInclVAT[3] += TempSalesInvLine."Amount Including VAT";
                        TempSalesInvLine.INSERT;
                    END;
                UNTIL NEXT = 0;

            IF TempSalesInvLine.GET(InqSalesInvLine."Document No.", InqSalesInvLine."Line No.") THEN BEGIN
                InqSalesInvLine.Amount := TempSalesInvLine.Amount;
                InqSalesInvLine."Amount Including VAT" := TempSalesInvLine."Amount Including VAT";
                // IF InqSalesInvLine.Type = InqSalesInvLine.Type::Item THEN
                //     InqSalesInvLine.Amount :=
                //       GetLCYAmount(DocType::"Sales Invoice", InqSalesInvLine."Document No.",
                //                    InqSalesInvLine."Line No.", InqSalesInvLine."No.", InqSalesInvLine."Posting Date");
            END ELSE BEGIN
                InqSalesInvLine.Amount := 0;
                InqSalesInvLine."Amount Including VAT" := 0;
            END;
        END;
        //PBCJP-TRD-002-080-04: END
    end;

    procedure PSCCalcLCYAmounts(var InqSalesCrMLine: Record "Sales Cr.Memo Line"; CurrencyCode: Code[10]);
    var
        CalcSalesCrMLine: Record "Sales Cr.Memo Line";
        TempSalesCrMLine: Record "Sales Cr.Memo Line" temporary;
        CalcAmount: array[3] of Decimal;
        CalcAmountInclVAT: array[3] of Decimal;
        DocType: Option " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo";
    begin
        //PBCJP-TRD-002-080-04: BEGIN
        WITH CalcSalesCrMLine DO BEGIN
            TempSalesCrMLine.RESET;
            TempSalesCrMLine.DELETEALL;
            SETRANGE("Document No.", InqSalesCrMLine."Document No.");
            IF FINDSET THEN
                REPEAT
                    IF Amount <> 0 THEN BEGIN
                        TempSalesCrMLine.INIT;
                        TempSalesCrMLine."Document No." := "Document No.";
                        TempSalesCrMLine."Line No." := "Line No.";
                        CalcAmount[1] += Amount;
                        CalcAmountInclVAT[1] += "Amount Including VAT";
                        CalcAmount[2] :=
                          ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                CalcAmount[1], "Currency Factor"));
                        IF Amount <> "Amount Including VAT" THEN
                            CalcAmountInclVAT[2] :=
                              ROUND(CurrExchRate.ExchangeAmtFCYToLCY(GetCDate("Posting Date"), CurrencyCode,
                                    CalcAmountInclVAT[1], "Currency Factor"))
                        ELSE
                            CalcAmountInclVAT[2] := CalcAmount[2];

                        TempSalesCrMLine.Amount := CalcAmount[2] - CalcAmount[3];
                        TempSalesCrMLine."Amount Including VAT" := CalcAmountInclVAT[2] - CalcAmountInclVAT[3];
                        CalcAmount[3] += TempSalesCrMLine.Amount;
                        CalcAmountInclVAT[3] += TempSalesCrMLine."Amount Including VAT";
                        TempSalesCrMLine.INSERT;
                    END;
                UNTIL NEXT = 0;

            IF TempSalesCrMLine.GET(InqSalesCrMLine."Document No.", InqSalesCrMLine."Line No.") THEN BEGIN
                InqSalesCrMLine.Amount := -TempSalesCrMLine.Amount;
                InqSalesCrMLine."Amount Including VAT" := -TempSalesCrMLine."Amount Including VAT";
                // IF InqSalesCrMLine.Type = InqSalesCrMLine.Type::Item THEN
                //     InqSalesCrMLine.Amount :=
                //       GetLCYAmount(DocType::"Sales Credit Memo", InqSalesCrMLine."Document No.",
                //                    InqSalesCrMLine."Line No.", InqSalesCrMLine."No.", InqSalesCrMLine."Posting Date");
            END ELSE BEGIN
                InqSalesCrMLine.Amount := 0;
                InqSalesCrMLine."Amount Including VAT" := 0;
            END;
        END;
        //PBCJP-TRD-002-080-04: END
    end;

    procedure GetLCYAmount(DocType: Option " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo"; DocNo: Code[20]; DocLineNo: Integer; ItemNo: Code[20]; PostingDate: Date): Decimal;
    var
        ValueEntry: Record "Value Entry";
    begin
        //PBCJP-TRD-002-080-04: BEGIN
        WITH ValueEntry DO BEGIN
            RESET;
            SETCURRENTKEY("Document No.");
            SETRANGE("Item Ledger Entry Type", "Item Ledger Entry Type"::Sale);
            SETRANGE("Document No.", DocNo);
            SETRANGE("Document Line No.", DocLineNo);
            SETRANGE("Document Type", DocType);
            SETRANGE("Item No.", ItemNo);
            SETRANGE("Posting Date");
            IF FINDFIRST THEN
                EXIT("Sales Amount (Actual)")
            ELSE
                EXIT(0);
        END;
        //PBCJP-TRD-002-080-04: END
    end;

    local procedure VATRoundingDirection(SalesHdr: record "Sales Header"): Text[1]
    var
    begin
        //PBCJP-FIN-009-070-00: BEGIN
        CASE SalesHdr."PBCJP VAT Rounding Type" OF
            SalesHdr."PBCJP VAT Rounding Type"::Nearest:
                EXIT('=');
            SalesHdr."PBCJP VAT Rounding Type"::Up:
                EXIT('>');
            SalesHdr."PBCJP VAT Rounding Type"::Down:
                EXIT('<');
        END;
        //PBCJP-FIN-009-070-00: END
    end;



    PROCEDURE ExportDataToExcel(ShowTrackingInfo: Boolean);
    VAR
        RowNo: Integer;
        lrecSalesLine: Record "Sales Line";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReserveSalesOrderLine: Codeunit "Sales Line-Reserve";
        lrReservEntry: Record "Reservation Entry";
        lrecSalesInvLine: Record "Sales Invoice Line";
        ItemTrackingMgmt: Codeunit "Item Tracking Management";
        TempItemLedgEntry: Record "Item Ledger Entry" temporary;
        lrecSalesCrMemoLine: Record "Sales Cr.Memo Line";
        decRemainingQty: Decimal;
        lrecItemLedgerEntry: Record "Item Ledger Entry";
        lresShipmentLine: Record "Sales Shipment Line";
    BEGIN
        TempExcelBuffer.DELETEALL;
        CLEAR(TempExcelBuffer);

        RowNo := 1;
        TempExcelBuffer.CreateNewBook('Sales Inquiry');
        //PBCJP-TRD-002-011: BEGIN
        //Add parameta EnterCell function(modify directry)
        //PBCJP-TRD-002-012: BEGIN
        EnterCell(RowNo, 1, FIELDCAPTION("Document Type"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 2, FIELDCAPTION("Document No."), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 3, FIELDCAPTION(Status), TRUE, FALSE, FALSE, '@');//"Order Status"
        EnterCell(RowNo, 4, FIELDCAPTION("Sell-to Customer No."), TRUE, FALSE, FALSE, '@');//"Customer No."
        EnterCell(RowNo, 5, FIELDCAPTION("Sell-to Customer Name"), TRUE, FALSE, FALSE, '@');//"Customer Name"
        EnterCell(RowNo, 6, FIELDCAPTION("Posting Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 7, FIELDCAPTION("Order Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 8, FIELDCAPTION("Document Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 9, FIELDCAPTION("Posting Description"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 10, FIELDCAPTION("Salesperson Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 11, FIELDCAPTION("External Document No."), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 12, FIELDCAPTION("Bill-to Customer No."), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 13, FIELDCAPTION("Bill-to Name"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 14, FIELDCAPTION("Due Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 15, FIELDCAPTION("Currency Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 16, FIELDCAPTION("Ship-to Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 17, FIELDCAPTION("Ship-to Name"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 18, FIELDCAPTION("Ship-to Address"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 19, FIELDCAPTION("Ship-to Post Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 20, FIELDCAPTION("Line No."), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 21, FIELDCAPTION(Type), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 22, FIELDCAPTION("No."), TRUE, FALSE, FALSE, '@');///"Item No."
        EnterCell(RowNo, 23, FIELDCAPTION("Item Description"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 24, FIELDCAPTION("Location Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 25, FIELDCAPTION(Description), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 26, FIELDCAPTION("Description 2Ext"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 27, FIELDCAPTION("Unit of Measure Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 28, FIELDCAPTION("Unit of MeasureExt"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 29, FIELDCAPTION(Quantity), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 30, FIELDCAPTION("Reserved Quantity"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 31, FIELDCAPTION("Qty. to Ship"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 32, FIELDCAPTION("Qty. to Invoice"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 33, FIELDCAPTION("Quantity Shipped"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 34, FIELDCAPTION("Quantity Invoiced"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 35, FIELDCAPTION("Unit Price"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 36, FIELDCAPTION("Unit Cost (LCY)"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 37, FIELDCAPTION("VAT %"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 38, FIELDCAPTION("Line Discount %"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 39, FIELDCAPTION("Line Discount Amount"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 40, FIELDCAPTION("Inv. Discount Amount"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 41, FIELDCAPTION(Amount), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 42, FIELDCAPTION("Amount Including VAT"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 43, FIELDCAPTION("Profit %"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 44, FIELDCAPTION("Net Weight"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 45, FIELDCAPTION("Gross Weight"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 46, FIELDCAPTION("Shipment Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 47, FIELDCAPTION("Requested Delivery Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 48, FIELDCAPTION("Planned Delivery Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 49, FIELDCAPTION("Promised Delivery Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 50, FIELDCAPTION("Planned Shipment Date"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 51, FIELDCAPTION("Shortcut Dimension 1 Code"), TRUE, FALSE, FALSE, '@');//"Global Dimension 1 Code"
        EnterCell(RowNo, 52, FIELDCAPTION("Shortcut Dimension 2 Code"), TRUE, FALSE, FALSE, '@');//"Global Dimension 2 Code"
        EnterCell(RowNo, 53, FIELDCAPTION("Shortcut Dimension 3 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 54, FIELDCAPTION("Shortcut Dimension 4 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 55, FIELDCAPTION("Shortcut Dimension 5 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 56, FIELDCAPTION("Shortcut Dimension 6 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 57, FIELDCAPTION("Shortcut Dimension 7 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 58, FIELDCAPTION("Shortcut Dimension 8 Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 59, FIELDCAPTION("Job No."), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 60, FIELDCAPTION("Reason Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 61, FIELDCAPTION("Customer Posting Group"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 62, FIELDCAPTION("Gen. Bus. Posting Group"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 63, FIELDCAPTION("Gen. Prod. Posting Group"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 64, FIELDCAPTION("VAT Bus. Posting Group"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 65, FIELDCAPTION("VAT Prod. Posting Group"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 66, FIELDCAPTION("Variant Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 67, FIELDCAPTION("Bin Code"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 68, FIELDCAPTION("Responsibility Center"), TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 69, FIELDCAPTION(EndUser), TRUE, FALSE, FALSE, '@');//EndUser
        EnterCell(RowNo, 70, FIELDCAPTION("Dealer 1"), TRUE, FALSE, FALSE, '@');//Dealer1
        EnterCell(RowNo, 71, FIELDCAPTION("Dealer 2"), TRUE, FALSE, FALSE, '@');//Dealer2
        EnterCell(RowNo, 72, FIELDCAPTION("Dealer 3"), TRUE, FALSE, FALSE, '@');//Dealer3

        IF ShowTrackingInfo THEN BEGIN
            EnterCell(RowNo, 73, lrReservEntry.FIELDCAPTION("Serial No."), TRUE, FALSE, FALSE, '@');
            EnterCell(RowNo, 74, lrReservEntry.FIELDCAPTION("Lot No."), TRUE, FALSE, FALSE, '@');
            EnterCell(RowNo, 75, lrReservEntry.FIELDCAPTION("Expiration Date"), TRUE, FALSE, FALSE, '@');
            EnterCell(RowNo, 76, lrReservEntry.FIELDCAPTION(Quantity), TRUE, FALSE, FALSE, '@');
        END;

        IF FINDSET THEN
            REPEAT
                RowNo += 1;

                EnterCell(RowNo, 1, FORMAT("Document Type"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 2, FORMAT("Document No."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 3, FORMAT(Status), FALSE, FALSE, FALSE, '');//"Order Status"
                EnterCell(RowNo, 4, FORMAT("Sell-to Customer No."), FALSE, FALSE, FALSE, '@');//"Customer No."
                EnterCell(RowNo, 5, FORMAT("Sell-to Customer Name"), FALSE, FALSE, FALSE, '@');//"Customer Name"
                EnterCell(RowNo, 6, FORMAT("Posting Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 7, FORMAT("Order Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 8, FORMAT("Document Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 9, FORMAT("Posting Description"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 10, FORMAT("Salesperson Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 11, FORMAT("External Document No."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 12, FORMAT("Bill-to Customer No."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 13, FORMAT("Bill-to Name"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 14, FORMAT("Due Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 15, FORMAT("Currency Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 16, FORMAT("Ship-to Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 17, FORMAT("Ship-to Name"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 18, FORMAT("Ship-to Address"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 19, FORMAT("Ship-to Post Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 20, FORMAT("Line No."), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 21, FORMAT(Type), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 22, FORMAT("No."), FALSE, FALSE, FALSE, '@');//"Item No."
                EnterCell(RowNo, 23, FORMAT("Item Description"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 24, FORMAT("Location Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 25, FORMAT(Description), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 26, FORMAT("Description 2Ext"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 27, FORMAT("Unit of Measure Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 28, FORMAT("Unit of MeasureExt"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 29, FORMAT(Quantity), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 30, FORMAT("Reserved Quantity"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 31, FORMAT("Qty. to Ship"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 32, FORMAT("Qty. to Invoice"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 33, FORMAT("Quantity Shipped"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 34, FORMAT("Quantity Invoiced"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 35, FORMAT("Unit Price"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 36, FORMAT("Unit Cost (LCY)"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 37, FORMAT("VAT %"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 38, FORMAT("Line Discount %"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 39, FORMAT("Line Discount Amount"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 40, FORMAT("Inv. Discount Amount"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 41, FORMAT(Amount), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 42, FORMAT("Amount Including VAT"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 43, FORMAT("Profit %"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 44, FORMAT("Net Weight"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 45, FORMAT("Gross Weight"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 46, FORMAT("Shipment Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 47, FORMAT("Requested Delivery Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 48, FORMAT("Planned Delivery Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 49, FORMAT("Promised Delivery Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 50, FORMAT("Planned Shipment Date"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 51, FORMAT("Shortcut Dimension 1 Code"), FALSE, FALSE, FALSE, '@');//"Global Dimension 1 Code"
                EnterCell(RowNo, 52, FORMAT("Shortcut Dimension 2 Code"), FALSE, FALSE, FALSE, '@');//"Global Dimension 2 Code"
                EnterCell(RowNo, 53, FORMAT("Shortcut Dimension 3 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 54, FORMAT("Shortcut Dimension 4 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 55, FORMAT("Shortcut Dimension 5 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 56, FORMAT("Shortcut Dimension 6 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 57, FORMAT("Shortcut Dimension 7 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 58, FORMAT("Shortcut Dimension 8 Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 59, FORMAT("Job No."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 60, FORMAT("Reason Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 61, FORMAT("Customer Posting Group"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 62, FORMAT("Gen. Bus. Posting Group"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 63, FORMAT("Gen. Prod. Posting Group"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 64, FORMAT("VAT Bus. Posting Group"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 65, FORMAT("VAT Prod. Posting Group"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 66, FORMAT("Variant Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 67, FORMAT("Bin Code"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 68, FORMAT("Responsibility Center"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 69, FORMAT(EndUser), FALSE, FALSE, FALSE, '@');//EndUser
                EnterCell(RowNo, 70, FORMAT("Dealer 1"), FALSE, FALSE, FALSE, '@');//Dealer1
                EnterCell(RowNo, 71, FORMAT("Dealer 2"), FALSE, FALSE, FALSE, '@');//Dealer2
                EnterCell(RowNo, 72, FORMAT("Dealer 3"), FALSE, FALSE, FALSE, '@');//Dealer3

                IF ShowTrackingInfo THEN BEGIN
                    CASE "Document Type" OF
                        "Document Type"::Quote,
                        "Document Type"::Order,
                        "Document Type"::Invoice,
                       //PBCJP-TRD-002-003: BEGIN
                       "Document Type"::"Credit Memo":
                            BEGIN
                                // "Document Type"::"Credit Memo",
                                // "Document Type"::"Closed Order": BEGIN
                                //PBCJP-TRD-002-003: END
                                IF lrecSalesLine.GET("Document Type", "Document No.", "Line No.") THEN BEGIN
                                    ReservEngineMgt.InitFilterAndSortingLookupFor(lrReservEntry, TRUE);
                                    ReserveSalesOrderLine.FilterReservFor(lrReservEntry, lrecSalesLine);
                                    lrReservEntry.SETRANGE("Reservation Status");
                                    IF lrReservEntry.FINDSET THEN
                                        REPEAT
                                            IF (lrReservEntry."Serial No." <> '') OR (lrReservEntry."Lot No." <> '') THEN BEGIN
                                                RowNo += 1;
                                                IF lrReservEntry."Serial No." <> '' THEN
                                                    EnterCell(RowNo, 73, FORMAT(lrReservEntry."Serial No."), FALSE, FALSE, FALSE, '@');
                                                IF lrReservEntry."Lot No." <> '' THEN
                                                    EnterCell(RowNo, 74, FORMAT(lrReservEntry."Lot No."), FALSE, FALSE, FALSE, '@');
                                                IF lrReservEntry."Expiration Date" <> 0D THEN
                                                    EnterCell(RowNo, 75, FORMAT(lrReservEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                ELSE BEGIN
                                                    lrecItemLedgerEntry.RESET;
                                                    lrecItemLedgerEntry.SETRANGE("Item No.", lrReservEntry."Item No.");
                                                    lrecItemLedgerEntry.SETRANGE("Variant Code", lrReservEntry."Variant Code");
                                                    lrecItemLedgerEntry.SETRANGE("Lot No.", lrReservEntry."Lot No.");
                                                    lrecItemLedgerEntry.SETRANGE("Serial No.", lrReservEntry."Serial No.");
                                                    IF lrecItemLedgerEntry.FINDFIRST THEN BEGIN
                                                        IF lrecItemLedgerEntry."Expiration Date" <> 0D THEN
                                                            EnterCell(RowNo, 76, FORMAT(lrecItemLedgerEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                    END;
                                                END;
                                                EnterCell(RowNo, 77, FORMAT(-lrReservEntry.Quantity), FALSE, FALSE, FALSE, '');
                                            END;
                                        UNTIL lrReservEntry.NEXT = 0;
                                    lresShipmentLine.RESET;
                                    lresShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
                                    lresShipmentLine.SETRANGE("Order No.", "Document No.");
                                    lresShipmentLine.SETRANGE("Order Line No.", "Line No.");
                                    IF lresShipmentLine.FINDSET THEN
                                        REPEAT
                                            CLEAR(TempItemLedgEntry);
                                            TempItemLedgEntry.DELETEALL;
                                            CLEAR(ItemTrackingMgmt);
                                            RetrieveILEFromShptRcpt(TempItemLedgEntry,//ItemTrackingMgmt.
                                            DATABASE::"Sales Shipment Line", 0, lresShipmentLine."Document No.", '', 0, lresShipmentLine."Line No.");
                                            IF TempItemLedgEntry.FINDSET THEN
                                                REPEAT
                                                    IF (TempItemLedgEntry."Serial No." <> '') OR (TempItemLedgEntry."Lot No." <> '') THEN BEGIN
                                                        RowNo += 1;
                                                        IF TempItemLedgEntry."Serial No." <> '' THEN
                                                            EnterCell(RowNo, 73, FORMAT(TempItemLedgEntry."Serial No."), FALSE, FALSE, FALSE, '@');
                                                        IF TempItemLedgEntry."Lot No." <> '' THEN
                                                            EnterCell(RowNo, 74, FORMAT(TempItemLedgEntry."Lot No."), FALSE, FALSE, FALSE, '@');
                                                        IF TempItemLedgEntry."Expiration Date" <> 0D THEN
                                                            EnterCell(RowNo, 75, FORMAT(TempItemLedgEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                        ELSE BEGIN
                                                            lrecItemLedgerEntry.RESET;
                                                            lrecItemLedgerEntry.SETRANGE("Item No.", TempItemLedgEntry."Item No.");
                                                            lrecItemLedgerEntry.SETRANGE("Variant Code", TempItemLedgEntry."Variant Code");
                                                            lrecItemLedgerEntry.SETRANGE("Lot No.", TempItemLedgEntry."Lot No.");
                                                            lrecItemLedgerEntry.SETRANGE("Serial No.", TempItemLedgEntry."Serial No.");
                                                            IF lrecItemLedgerEntry.FINDFIRST THEN BEGIN
                                                                IF lrecItemLedgerEntry."Expiration Date" <> 0D THEN
                                                                    EnterCell(RowNo, 76, FORMAT(lrecItemLedgerEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                            END;
                                                        END;
                                                        EnterCell(RowNo, 77, FORMAT(TempItemLedgEntry.Quantity), FALSE, FALSE, FALSE, '');
                                                    END;
                                                UNTIL TempItemLedgEntry.NEXT = 0;
                                        UNTIL lresShipmentLine.NEXT = 0;
                                END;
                            END;
                        "Document Type"::"Posted Invoice":
                            BEGIN
                                IF lrecSalesInvLine.GET("Document No.",
                                "Line No.") THEN BEGIN
                                    CLEAR(TempItemLedgEntry);
                                    TempItemLedgEntry.DELETEALL;
                                    CLEAR(ItemTrackingMgmt);
                                    RetrieveILEFromPostedInv(TempItemLedgEntry, lrecSalesInvLine.RowID1);//ItemTrackingMgmt.RetrieveILEFromPostedInv
                                    IF TempItemLedgEntry.FINDSET THEN
                                        REPEAT
                                            IF (TempItemLedgEntry."Serial No." <> '') OR (TempItemLedgEntry."Lot No." <> '') THEN BEGIN
                                                RowNo += 1;
                                                IF TempItemLedgEntry."Serial No." <> '' THEN
                                                    EnterCell(RowNo, 73, FORMAT(TempItemLedgEntry."Serial No."), FALSE, FALSE, FALSE, '@');
                                                IF TempItemLedgEntry."Lot No." <> '' THEN
                                                    EnterCell(RowNo, 74, FORMAT(TempItemLedgEntry."Lot No."), FALSE, FALSE, FALSE, '@');
                                                IF TempItemLedgEntry."Expiration Date" <> 0D THEN
                                                    EnterCell(RowNo, 75, FORMAT(TempItemLedgEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                ELSE BEGIN
                                                    lrecItemLedgerEntry.RESET;
                                                    lrecItemLedgerEntry.SETRANGE("Item No.", TempItemLedgEntry."Item No.");
                                                    lrecItemLedgerEntry.SETRANGE("Variant Code", TempItemLedgEntry."Variant Code");
                                                    lrecItemLedgerEntry.SETRANGE("Lot No.", TempItemLedgEntry."Lot No.");
                                                    lrecItemLedgerEntry.SETRANGE("Serial No.", TempItemLedgEntry."Serial No.");
                                                    IF lrecItemLedgerEntry.FINDFIRST THEN BEGIN
                                                        IF lrecItemLedgerEntry."Expiration Date" <> 0D THEN
                                                            EnterCell(RowNo, 76, FORMAT(lrecItemLedgerEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                    END;
                                                END;
                                                EnterCell(RowNo, 77, FORMAT(TempItemLedgEntry.Quantity), FALSE, FALSE, FALSE, '');
                                            END;
                                        UNTIL TempItemLedgEntry.NEXT = 0;
                                END;
                            END;
                        "Document Type"::"Posted Credit Memo":
                            BEGIN
                                IF lrecSalesCrMemoLine.GET("Document No.", "Line No.") THEN BEGIN
                                    CLEAR(TempItemLedgEntry);
                                    TempItemLedgEntry.DELETEALL;
                                    CLEAR(ItemTrackingMgmt);
                                    RetrieveILEFromPostedInv(TempItemLedgEntry, lrecSalesCrMemoLine.RowID1);//ItemTrackingMgmt.RetrieveILEFromPostedInv
                                    IF TempItemLedgEntry.FINDSET THEN
                                        REPEAT
                                            IF (TempItemLedgEntry."Serial No." <> '') OR (TempItemLedgEntry."Lot No." <> '') THEN BEGIN
                                                RowNo += 1;
                                                IF TempItemLedgEntry."Serial No." <> '' THEN
                                                    EnterCell(RowNo, 73, FORMAT(TempItemLedgEntry."Serial No."), FALSE, FALSE, FALSE, '@');
                                                IF TempItemLedgEntry."Lot No." <> '' THEN
                                                    EnterCell(RowNo, 74, FORMAT(TempItemLedgEntry."Lot No."), FALSE, FALSE, FALSE, '@');
                                                IF TempItemLedgEntry."Expiration Date" <> 0D THEN
                                                    EnterCell(RowNo, 75, FORMAT(TempItemLedgEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                ELSE BEGIN
                                                    lrecItemLedgerEntry.RESET;
                                                    lrecItemLedgerEntry.SETRANGE("Item No.", TempItemLedgEntry."Item No.");
                                                    lrecItemLedgerEntry.SETRANGE("Variant Code", TempItemLedgEntry."Variant Code");
                                                    lrecItemLedgerEntry.SETRANGE("Lot No.", TempItemLedgEntry."Lot No.");
                                                    lrecItemLedgerEntry.SETRANGE("Serial No.", TempItemLedgEntry."Serial No.");
                                                    IF lrecItemLedgerEntry.FINDFIRST THEN BEGIN
                                                        IF lrecItemLedgerEntry."Expiration Date" <> 0D THEN
                                                            EnterCell(RowNo, 76, FORMAT(lrecItemLedgerEntry."Expiration Date"), FALSE, FALSE, FALSE, '')
                                                    END;
                                                END;
                                                EnterCell(RowNo, 77, FORMAT(TempItemLedgEntry.Quantity), FALSE, FALSE, FALSE, '');
                                            END;
                                        UNTIL TempItemLedgEntry.NEXT = 0;
                                END;
                            END;
                    END;
                END;
            UNTIL NEXT = 0;

        // TempExcelBuffer.CreateBook;
        // TempExcelBuffer.CreateSheet('Sales Inquiry', 'Sales Inquiry', COMPANYNAME, USERID);
        // TempExcelBuffer.GiveUserControl;
        TempExcelBuffer.WriteSheet('Sales Inquiry', COMPANYNAME, USERID);
        TempExcelBuffer.CloseBook;
        TempExcelBuffer.DownloadAndOpenExcel;
    END;

    LOCAL PROCEDURE EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean; NumberFormat: Text[50]);
    BEGIN
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);

        IF NumberFormat = '@' THEN BEGIN
            TempExcelBuffer.VALIDATE("Cell Type", TempExcelBuffer."Cell Type"::Text);
        END;
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Italic := Italic;
        TempExcelBuffer.Underline := UnderLine;
        TempExcelBuffer.NumberFormat := NumberFormat;  //PBCJP-TRD-002-011
        TempExcelBuffer.INSERT;
    END;

    PROCEDURE LookupShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20]);
    BEGIN
        //PBCJP-TRD-002-004: Add Functtion
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
    END;



    PROCEDURE ExportSFDataToExcel(ShowTrackingInfo: Boolean);
    VAR
        RowNo: Integer;
        lrecSalesLine: Record "Sales Line";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReserveSalesOrderLine: Codeunit "Sales Line-Reserve";
        lrReservEntry: Record "Reservation Entry";
        lrecSalesInvLine: Record "Sales Invoice Line";
        ItemTrackingMgmt: Codeunit "Item Tracking Management";
        TempItemLedgEntry: Record "Item Ledger Entry" temporary;
        lrecSalesCrMemoLine: Record "Sales Cr.Memo Line";
        decRemainingQty: Decimal;
        lrecItemLedgerEntry: Record "Item Ledger Entry";
        lresShipmentLine: Record "Sales Shipment Line";
    BEGIN
        TempExcelBuffer.DELETEALL;
        CLEAR(TempExcelBuffer);

        RowNo := 1;

        //PBCJP-TRD-002-011: BEGIN
        //Add parameta EnterCell function(modify directry)
        TempExcelBuffer.CreateNewBook('Sales Inquiry');
        //PBCJP-TRD-002-012: BEGIN

        EnterCell(RowNo, 1, '出荷日', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 2, '受注伝票番号', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 3, 'ｱｲﾃﾑ番号', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 4, 'ｱｲﾃﾑ名', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 5, '顧客ｺｰﾄﾞ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 6, '会社グループ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 7, '（顧客/企業）', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 8, '顧客　アカデミア', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 9, '所属', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 10, '得意先ｺｰﾄﾞ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 11, '得意先', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 12, '支店・営業所', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 13, '受注伝票説明', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 14, '外部参照情報', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 15, '売上数量', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 16, '売上金額', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 17, 'アイテムグループ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 18, 'アイテムグループ2', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 19, 'ｼﾘｱﾙNoﾀｲﾌﾟ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 20, '保管温度', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 21, '社員名', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 22, '得意先・会社ｸﾞﾙｰﾌﾟ', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 23, '医療用外毒物', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 24, '指示欄', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 25, '定価', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 26, '出荷日・年', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 27, '出荷日・月', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 28, '出荷日・四半期', TRUE, FALSE, FALSE, '@');
        EnterCell(RowNo, 29, '出荷日・四半期・年', TRUE, FALSE, FALSE, '@');

        //PBCJP-TRD-002-012: END



        IF FINDSET THEN
            REPEAT
                RowNo += 1;
                EnterCell(RowNo, 1, FORMAT("Posting Date"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 2, FORMAT("Document No."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 3, FORMAT("No."), FALSE, FALSE, FALSE, '');//"Item No."
                EnterCell(RowNo, 4, FORMAT("Item Description"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 5, FORMAT(EndUser), FALSE, FALSE, FALSE, '@');//EndUser
                EnterCell(RowNo, 6, FORMAT("EndUser Group Name"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 7, FORMAT(NONE), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 8, FORMAT("EU Description"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 9, FORMAT("EU Division 1"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 10, FORMAT("Sell-to Customer No."), FALSE, FALSE, FALSE, '@');//"Customer No."
                EnterCell(RowNo, 11, FORMAT("Sell-to Customer Name"), FALSE, FALSE, FALSE, '@');//"Customer Name"
                EnterCell(RowNo, 12, FORMAT("Customer Name 2"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 13, FORMAT("Description(Bikou)"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 14, FORMAT("ExternaDocumentNo."), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 15, FORMAT(Quantity), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 16, FORMAT(Amount, 0, 1), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 17, FORMAT("Item Category Description"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 18, FORMAT("Product Group Description"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 19, FORMAT(SerialNoType), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 20, FORMAT(StorageTemprature), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 21, FORMAT("User ID"), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 22, FORMAT("Customer Group Name"), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 23, FORMAT(ItemToxicKBN), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 24, FORMAT(NONE), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 25, FORMAT("Unit Price", 0, 1), FALSE, FALSE, FALSE, '@');
                EnterCell(RowNo, 26, FORMAT(SalesYear), FALSE, FALSE, FALSE, '');
                //  EnterCell(RowNo,27,FORMAT(SalesMonth,2,0),FALSE,FALSE,FALSE,'@');
                //  EnterCell(RowNo,27,FORMAT(SalesMonth,2,0),FALSE,FALSE,FALSE,'@');
                IF FORMAT(SalesMonth, 2, 0) < '10' THEN BEGIN
                    EnterCell(RowNo, 27, '0' + FORMAT(SalesMonth), FALSE, FALSE, FALSE, '@');
                END;
                IF FORMAT(SalesMonth, 2, 0) >= '10' THEN BEGIN
                    EnterCell(RowNo, 27, FORMAT(SalesMonth), FALSE, FALSE, FALSE, '@');
                END;
                EnterCell(RowNo, 28, FORMAT(SalesQuater), FALSE, FALSE, FALSE, '');
                EnterCell(RowNo, 29, FORMAT(SalesYear), FALSE, FALSE, FALSE, '');
            UNTIL NEXT = 0;

        //PBCJP-TRD-002-011: END

        // TempExcelBuffer.CreateBook;
        // TempExcelBuffer.CreateSheet('Sales Inquiry', 'Sales Inquiry', COMPANYNAME, USERID);
        // TempExcelBuffer.GiveUserControl;
        TempExcelBuffer.WriteSheet('Sales Inquiry', COMPANYNAME, USERID);
        TempExcelBuffer.CloseBook;
        TempExcelBuffer.DownloadAndOpenExcel;
    END;

    PROCEDURE RetrieveILEFromShptRcpt(VAR TempItemLedgEntry: Record "Item Ledger Entry" TEMPORARY; Type: Integer; Subtype: Integer; ID: Code[20]; BatchName: Code[10]; ProdOrderLine: Integer; RefNo: Integer);
    VAR
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    BEGIN
        // retrieves a data set of Item Ledger Entries (Posted Shipments/Receipts)

        ItemEntryRelation.SETCURRENTKEY("Source ID", "Source Type");
        ItemEntryRelation.SETRANGE("Source Type", Type);
        ItemEntryRelation.SETRANGE("Source Subtype", Subtype);
        ItemEntryRelation.SETRANGE("Source ID", ID);
        ItemEntryRelation.SETRANGE("Source Batch Name", BatchName);
        ItemEntryRelation.SETRANGE("Source Prod. Order Line", ProdOrderLine);
        ItemEntryRelation.SETRANGE("Source Ref. No.", RefNo);
        IF ItemEntryRelation.FINDSET THEN BEGIN
            SignFactor := TableSignFactor(Type);
            REPEAT
                ItemLedgEntry.GET(ItemEntryRelation."Item Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                AddTempRecordToSet(TempItemLedgEntry, SignFactor);
            UNTIL ItemEntryRelation.NEXT = 0;
        END;
    END;

    PROCEDURE RetrieveILEFromPostedInv(VAR TempItemLedgEntry: Record "Item Ledger Entry" TEMPORARY; InvoiceRowID: Text[250]);
    VAR
        ValueEntryRelation: Record "Value Entry Relation";
        ValueEntry: Record "Value Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    BEGIN
        // retrieves a data set of Item Ledger Entries (Posted Invoices)

        ValueEntryRelation.SETCURRENTKEY("Source RowId");
        ValueEntryRelation.SETRANGE("Source RowId", InvoiceRowID);
        IF ValueEntryRelation.FIND('-') THEN BEGIN
            SignFactor := TableSignFactor2(InvoiceRowID);
            REPEAT
                ValueEntry.GET(ValueEntryRelation."Value Entry No.");
                ItemLedgEntry.GET(ValueEntry."Item Ledger Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                TempItemLedgEntry.Quantity := ValueEntry."Invoiced Quantity";
                IF TempItemLedgEntry.Quantity <> 0 THEN
                    AddTempRecordToSet(TempItemLedgEntry, SignFactor);
            UNTIL ValueEntryRelation.NEXT = 0;
        END;
    END;


    LOCAL PROCEDURE AddTempRecordToSet(VAR TempItemLedgEntry: Record "Item Ledger Entry" TEMPORARY; SignFactor: Integer);
    VAR
        TempItemLedgEntry2: Record "Item Ledger Entry" TEMPORARY;
    BEGIN
        IF SignFactor <> 1 THEN BEGIN
            TempItemLedgEntry.Quantity *= SignFactor;
            TempItemLedgEntry."Remaining Quantity" *= SignFactor;
            TempItemLedgEntry."Invoiced Quantity" *= SignFactor;
        END;
        RetrieveAppliedExpirationDate(TempItemLedgEntry);
        TempItemLedgEntry2 := TempItemLedgEntry;
        TempItemLedgEntry.RESET;
        TempItemLedgEntry.SETRANGE("Serial No.", TempItemLedgEntry2."Serial No.");
        TempItemLedgEntry.SETRANGE("Lot No.", TempItemLedgEntry2."Lot No.");
        TempItemLedgEntry.SETRANGE("Warranty Date", TempItemLedgEntry2."Warranty Date");
        TempItemLedgEntry.SETRANGE("Expiration Date", TempItemLedgEntry2."Expiration Date");
        IF TempItemLedgEntry.FINDFIRST THEN BEGIN
            TempItemLedgEntry.Quantity += TempItemLedgEntry2.Quantity;
            TempItemLedgEntry."Remaining Quantity" += TempItemLedgEntry2."Remaining Quantity";
            TempItemLedgEntry."Invoiced Quantity" += TempItemLedgEntry2."Invoiced Quantity";
            TempItemLedgEntry.MODIFY;
        END ELSE BEGIN
            TempItemLedgEntry.INSERT;
        END;
        TempItemLedgEntry.RESET;
    END;


    LOCAL PROCEDURE TableSignFactor(TableNo: Integer): Integer;
    BEGIN
        IF TableNo IN [
                       DATABASE::"Sales Line",
                       DATABASE::"Sales Shipment Line",
                       DATABASE::"Sales Invoice Line",
                       DATABASE::"Purch. Cr. Memo Line",
                       DATABASE::"Prod. Order Component",
                       DATABASE::"Transfer Shipment Line",
                       DATABASE::"Return Shipment Line",
                       DATABASE::"Planning Component",
                       DATABASE::"Service Line",
                       DATABASE::"Service Shipment Line",
                       DATABASE::"Service Invoice Line"]
        THEN
            EXIT(-1);

        EXIT(1);
    END;

    PROCEDURE RetrieveAppliedExpirationDate(VAR TempItemLedgEntry: Record "Item Ledger Entry" TEMPORARY);
    VAR
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemApplnEntry: Record "Item Application Entry";
    BEGIN
        WITH TempItemLedgEntry DO BEGIN
            IF Positive THEN
                EXIT;

            ItemApplnEntry.RESET;
            ItemApplnEntry.SETCURRENTKEY("Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application");
            ItemApplnEntry.SETRANGE("Outbound Item Entry No.", "Entry No.");
            ItemApplnEntry.SETRANGE("Item Ledger Entry No.", "Entry No.");
            IF ItemApplnEntry.FINDFIRST THEN BEGIN
                ItemLedgEntry.GET(ItemApplnEntry."Inbound Item Entry No.");
                "Expiration Date" := ItemLedgEntry."Expiration Date";
            END;
        END;
    END;

    LOCAL PROCEDURE TableSignFactor2(RowID: Text[250]): Integer;
    VAR
        TableNo: Integer;
    BEGIN
        RowID := DELCHR(RowID, '<', '"');
        RowID := COPYSTR(RowID, 1, STRPOS(RowID, '"') - 1);
        IF EVALUATE(TableNo, RowID) THEN
            EXIT(TableSignFactor(TableNo));

        EXIT(1);
    END;

    local procedure ItemCategoryCodeSearch(ItemCC: code[20]; var retParentCode: code[20]; var retParentName: text[100])
    var
        itemCategory: Record "Item Category";
        itemCategory2: Record "Item Category";
    begin
        itemCategory.SetRange(code, ItemCC);

        if itemCategory.Findfirst() then begin
            retParentCode := itemCategory."Parent Category";
            if itemCategory2.get(retParentCode) then begin
                retParentName := retParentCode + itemCategory2.Description

            end ELSE BEGIN
                retParentName := '';

            END;

        end else BEGIN
            retParentCode := '';
            retParentName := '';
        END;
    end;

    local procedure symbolconvert(decimalvalue: decimal): Decimal;
    var
    begin
        if decimalvalue < 0 then begin
            exit(-1);
        end else begin
            exit(1);
        end;
    end;

}

 */