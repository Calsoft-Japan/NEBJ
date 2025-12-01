page 50019 "Sales Inquiry Subform"
{
    ApplicationArea = All;
    Caption = 'Line';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PaGetype = ListPart;
    SourceTable = "Sales Inquiry Line";
    SourceTableTemporary = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Document No."; Rec."Document No.")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Order Status"; Rec."Order Status")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Customer Name 2"; Rec."Customer Name 2")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Document Date"; Rec."Document Date")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Order Date"; Rec."Order Date")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Visible = ShowLine;
                }
                field("Item No."; Rec."Item No.")
                {
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
                field("Unit of Measure"; Rec."Unit of Measure")
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
                field("ExternaDocumentNo."; Rec."ExternalDocumentNo.")
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
                field("User ID"; Rec."User ID")
                {
                    Visible = ShowLine;
                }
                field("Customer Group Name"; Rec."Customer Group Name")
                {
                    Visible = ShowLine;
                }
                field("ItemToxicKBN"; Rec."ItemToxicKBN")
                {
                    Visible = ShowLine;
                }
                field("SalesYear"; Rec."SalesYear")
                {
                    Visible = ShowLine;
                }
                field("Rec.SalesMonth"; Rec."SalesMonth")
                {
                    Visible = ShowLine;
                }
                field("SalesQuater"; Rec."SalesQuater")
                {
                    Visible = ShowLine;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = ShowLine;
                }
                field(Type; Rec.Type)
                {
                    Visible = ShowLine;
                }
                field("Description 2"; Rec."Description 2")
                {
                    Visible = ShowLine;
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    Visible = ShowLine;
                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                    Visible = ShowLine;
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                    Visible = ShowLine;
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    Visible = ShowLine;
                }
                field("VAT %"; Rec."VAT %")
                {
                    Visible = ShowLine;
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    Visible = ShowLine;
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    Visible = ShowLine;
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                    Visible = ShowLine;
                }
                field("Profit %"; Rec."Profit %")
                {
                    Visible = ShowLine;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    Visible = ShowLine;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    Visible = ShowLine;
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Planned Delivery Date"; Rec."Planned Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    Visible = ShowLine;
                }
                field("Planned Shipment Date"; Rec."Planned Shipment Date")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    Visible = ShowLine;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    Visible = ShowLine;
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = ShowLine;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    Style = StandardAccent;
                    StyleExpr = true;
                    Visible = ShowHeader;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Visible = ShowLine;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = ShowLine;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    Visible = ShowLine;
                }
                field(StorageTemprature; Rec.StorageTemprature)
                {
                    Visible = ShowLine;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Visible = ShowLine;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    Visible = ShowLine;
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    Visible = ShowLine;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Visible = ShowLine;
                }
                field("EU Division 2"; Rec."EU Division 2")
                {
                    Visible = ShowLine;
                }
                field("EU Division 3"; Rec."EU Division 3")
                {
                    Visible = ShowLine;
                }
                field("EndUser Group"; Rec."EndUser Group")
                {
                    Visible = ShowLine;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Visible = ShowLine;
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    Visible = ShowLine;
                }
                field("Amount Including VAT - Amount"; Rec."Amount Including VAT" - Rec.Amount)
                {
                    Caption = 'Amount Including VAT - Amount';
                    Visible = ShowLine;
                }
            }
        }
    }

    trigger OnInit();
    begin
        ShowHeader := true;
        ShowLine := true;
    end;

    trigger OnOpenPage();
    begin
        GLSetup.Get;
    end;

    var
        SalesHdr: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesInvHdr: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        GLSetup: Record "General Ledger Setup";
        CurrExchRate: Record "Currency Exchange Rate";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        DimMgt: Codeunit "DimensionManagement";
        ShowHeader: Boolean;
        ShowLine: Boolean;
        SelltoCustomerFilter: Text;
        BilltoCustomerFilter: Text;
        PostingDateFilter: Text;
        OrderDateFilter: Text;
        ItemFilter: Text;
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
        Text000: Label 'Please specify the search criteria.';

    procedure ControlShowMode(ShowMode: Option "Header + Line","Header Only","Line Only");
    begin
        case ShowMode of
            ShowMode::"Header + Line":
                begin
                    ShowHeader := true;
                    ShowLine := true;
                end;
            ShowMode::"Header Only":
                begin
                    ShowHeader := true;
                    ShowLine := false;
                end;
            ShowMode::"Line Only":
                begin
                    ShowHeader := false;
                    ShowLine := true;
                end;
        end;
        CurrPage.Update(false);
    end;

    procedure SetIncludeTable(pSQ: Boolean; pSO: Boolean; pSInv: Boolean; pSCrMemo: Boolean; pSRO: Boolean; pPSInv: Boolean; pPCrMemo: Boolean);
    begin
        SalesQuote := pSQ;
        SalesOrder := pSO;
        SalesInvoice := pSInv;
        SalesCreditMemo := pSCrMemo;
        SalesReturnOrder := pSRO;
        PostedSalesInvoice := pPSInv;
        PostedSalesCrMemo := pPCrMemo;
    end;

    procedure SetHeaderFilter(pSellToCustFilter: Text; pBillToCustFilter: Text; pPostDateFilter: Text; pOrdDateFilter: Text);
    begin
        SelltoCustomerFilter := pSellToCustFilter;
        BilltoCustomerFilter := pBillToCustFilter;
        PostingDateFilter := pPostDateFilter;
        OrderDateFilter := pOrdDateFilter;
    end;

    procedure SetLineFilter(NewItemFilter: Text; NewShowDummyLine: Boolean);
    begin
        ItemFilter := NewItemFilter;
        ShowDummyLine := NewShowDummyLine;
    end;

    procedure ClearInquiryData(CurrGUID: Guid);
    begin
        Rec.Reset();
        Rec.SetRange(GUID, CurrGUID);
        if not Rec.IsEmpty then begin
            if Rec.Count = 1 then begin
                Rec."Line No." += 10000;
                Rec.Insert();
            end;
            Rec.DeleteAll();
        end;
        CurrPage.Update(false);
    end;

    procedure GetTotalValue(var SetTotalQty: Decimal; var SetTotalAmount: Decimal; var SetTotAmtInclVAT: Decimal);
    begin
        SetTotalQty := TotalQty;
        SetTotalAmount := TotalAmount;
        SetTotAmtInclVAT := TotalAmountInclVAT;
    end;

    procedure SetFixedFields(CurrGUID: Guid);
    begin
        Rec.GUID := CurrGUID;
        Rec."Creation Date" := Today();
    end;

    procedure FindRecords(CurrGUID: Guid);
    begin
        Rec.Reset();
        Rec.SetRange(GUID, CurrGUID);
        Rec.DeleteAll();

        TotalQty := 0;
        TotalAmount := 0;
        TotalAmountInclVAT := 0;

        FindSalesRecord(CurrGUID);
        FindPostedSalesInvoice(CurrGUID);
        FindPostedSalesCrMemo(CurrGUID);

        if Rec.FindFirst() then;
        CurrPage.Update(false);
    end;

    procedure FindSalesRecord(CurrGUID: Guid);
    var
        Item: Record Item;
        Customer: Record Customer;
        CustomerType: Record "Customer Type";
        ItemCategory: Record "Item Category";
        SalesLine2: Record "Sales Line";
        DocFilter: Text;
        Found: Boolean;
    begin
        DocFilter := '';
        if SalesQuote then
            DocFilter := 'Quote';
        if SalesOrder then begin
            if DocFilter <> '' then
                DocFilter += '|';
            DocFilter += 'Order';
        end;
        if SalesInvoice then begin
            if DocFilter <> '' then
                DocFilter += '|';
            DocFilter += 'Invoice';
        end;
        if SalesCreditMemo then begin
            if DocFilter <> '' then
                DocFilter += '|';
            DocFilter += 'Credit Memo';
        end;
        if SalesReturnOrder then begin
            if DocFilter <> '' then
                DocFilter += '|';
            DocFilter += 'Return Order';
        end;

        if DocFilter = '' then
            if (not PostedSalesInvoice) and (not PostedSalesCrMemo) then begin
                Message(Text000);
                exit;
            end;
        NoFilterCount := 0;
        if ItemFilter <> '' then
            NoFilterCount += 1;

        if DocFilter = '' then
            exit;

        SalesHdr.Reset();
        SalesLine.Reset();
        if DocFilter <> '' then
            SalesHdr.SetFilter("Document Type", DocFilter);
        if SelltoCustomerFilter <> '' then
            SalesHdr.SetFilter("Sell-to Customer No.", SelltoCustomerFilter);
        if BilltoCustomerFilter <> '' then
            SalesHdr.SetFilter("Bill-to Customer No.", BilltoCustomerFilter);
        if PostingDateFilter <> '' then
            SalesHdr.SetFilter("Posting Date", PostingDateFilter);
        if OrderDateFilter <> '' then
            SalesHdr.SetFilter("Order Date", OrderDateFilter);
        if SalesHdr.FindSet() then
            Repeat
                SalesHdr.CalcFields(
                  Comment, Amount, "Amount Including VAT", "No. of Archived Versions",
                  "Shipped Not Invoiced", "Completely Shipped", "Late Order Shipping");
                SalesLine.SetRange("Document Type", SalesHdr."Document Type");
                SalesLine.SetRange("Document No.", SalesHdr."No.");
                if not ShowDummyLine then
                    SalesLine.SetFilter(Amount, '<>0');
                if NoFilterCount = 1 then begin
                    if ItemFilter <> '' then begin
                        SalesLine.SetRange(Type, SalesLine.Type::Item);
                        SalesLine.SetFilter("No.", ItemFilter);
                    end;
                end;

                if SalesLine.FindSet() then
                    Repeat
                        Found := false;
                        if NoFilterCount > 1 then begin
                            if (ItemFilter <> '') and
                               (SalesLine.Type = SalesLine.Type::Item) then begin
                                SalesLine2.Copy(SalesLine);
                                SalesLine2.SetRange(Type, SalesLine2.Type::Item);
                                SalesLine2.FilterGroup(2);
                                SalesLine2.SetFilter("No.", ItemFilter);
                                SalesLine2.FilterGroup(0);
                                SalesLine2.SetRange("No.", SalesLine."No.");
                                if not SalesLine2.IsEmpty then
                                    Found := true;
                            end;
                        end else
                            Found := true;

                        if Found then begin
                            SalesLine.CalcFields(
                              "Reserved Quantity", "ATO Whse. Outstanding Qty.", "ATO Whse. Outstd. Qty. (Base)",
                              "Reserved Qty. (Base)", "Substitution Available", "Whse. Outstanding Qty.",
                              "Whse. Outstanding Qty. (Base)", "Qty. to Assign", "Qty. Assigned");
                            Rec.Init();
                            Rec.TransferFields(SalesHdr);
                            SetFixedFields(CurrGUID);
                            Rec."Document No." := SalesLine."Document No.";
                            Rec."Line No." := SalesLine."Line No.";

                            if Customer.Get(SalesLine."Sell-to Customer No.") then
                                Rec."Customer Group" := Customer."Customer Group";
                            if Customer.Get(SalesLine.EndUser) then
                                Rec."EndUser Group" := Customer."Customer Group";

                            if CustomerType.Get(Rec."Customer Group") then
                                Rec."Customer Group Name" := CustomerType."Customer Type Name";

                            if CustomerType.Get(Rec."EndUser Group") then
                                Rec."EndUser Group Name" := CustomerType."Customer Type Name";

                            Rec."Sell-to Customer Name" := SalesHdr."Sell-to Customer Name";
                            Rec."Customer Name 2" := SalesHdr."Sell-to Customer Name 2";
                            Rec."EndUser" := SalesLine.EndUser;
                            Rec."Posting Date" := SalesHdr."Posting Date";
                            Rec."Document Date" := SalesHdr."Document Date";
                            Rec."Order Date" := SalesHdr."Order Date";
                            Rec."Due Date" := SalesHdr."Due Date";
                            Rec."Ship-to Code" := SalesHdr."Ship-to Code";
                            Rec."Ship-to Name" := SalesHdr."Ship-to Name";
                            Rec."Ship-to Address" := SalesHdr."Ship-to Address";
                            Rec."Ship-to Post Code" := SalesHdr."Ship-to Post Code";
                            Rec."Posting Description" := SalesHdr."Posting Description";
                            Rec."Salesperson Code" := SalesHdr."Salesperson Code";
                            Rec."Bill-to Customer No." := SalesHdr."Bill-to Customer No.";
                            Rec."Bill-to Name" := SalesHdr."Bill-to Name";
                            Rec."Customer Posting Group" := SalesHdr."Customer Posting Group";
                            Rec."Profit %" := SalesLine."Profit %";
                            Rec."Description(Bikou)" := SalesLine."Description(Bikou)";
                            Rec.StorageTemprature := SalesLine.StorageTemprature;
                            Rec."External Document No." := SalesHdr."External Document No.";
                            Rec."ExternalDocumentNo." := SalesLine."ExternaDocumentNo.";
                            Rec."EU Description" := SalesLine."EU Description";
                            Rec."EU Division 1" := SalesLine."EU Division 1";
                            Rec."EU Division 2" := SalesLine."EU Division 2";
                            Rec."EU Division 3" := SalesLine."EU Division 3";

                            if Item.Get(SalesLine."No.") then;
                            Rec."Item Description" := Item.Description;
                            ItemCategoryCodeSearch(Item."Item Category Code", Rec."Item Category Code", Rec."Item Category Description");
                            Rec."Product Group Code" := Item."Item Category Code";
                            if ItemCategory.Get(Item."Item Category Code") then;
                            Rec."Product Group Description" := ItemCategory.Code + ItemCategory.Description;

                            if Item.Get(SalesLine."No.") then
                                Rec.StorageTemprature := Item.StorageTemp;
                            if Item.Get(SalesLine."No.") then
                                if Item."Toxic-KBN" = true then
                                    Rec.ItemToxicKBN := '医療用毒劇物';

                            Rec.SerialNoType := 'ﾊﾞｯﾁ';
                            if Rec."Posting Date" <> 0D then begin
                                Rec.SalesMonth := Date2DMY(SalesHdr."Posting Date", 2);
                                Rec.SalesYear := Date2DMY(SalesHdr."Posting Date", 3);
                                if (Rec.SalesMonth = 1) or (Rec.SalesMonth = 2) or (Rec.SalesMonth = 3) then
                                    Rec.SalesQuater := '第1四半期';
                                if (Rec.SalesMonth = 4) or (Rec.SalesMonth = 5) or (Rec.SalesMonth = 6) then
                                    Rec.SalesQuater := '第2四半期';
                                if (Rec.SalesMonth = 7) or (Rec.SalesMonth = 8) or (Rec.SalesMonth = 9) then
                                    Rec.SalesQuater := '第3四半期';
                                if (Rec.SalesMonth = 10) or (Rec.SalesMonth = 11) or (Rec.SalesMonth = 12) then
                                    Rec.SalesQuater := '第4四半期';
                            end;
                            Rec."Order Status" := SalesHdr.Status;
                            Rec.Type := SalesLine.Type;
                            Rec."Item No." := SalesLine."No.";
                            Rec."Location Code" := SalesLine."Location Code";
                            Rec."Shipment Date" := SalesLine."Shipment Date";
                            Rec.Description := SalesLine.Description;
                            Rec."Description 2" := SalesLine.Description;
                            Rec."Unit of Measure" := SalesLine."Unit of Measure";
                            Rec.Quantity := SalesLine.Quantity;
                            Rec."Qty. to Invoice" := SalesLine."Qty. to Invoice";
                            Rec."Qty. to Ship" := SalesLine."Qty. to Ship";
                            Rec."Unit Price" := SalesLine."Unit Price";
                            Rec."Unit Cost (LCY)" := SalesLine."Unit Cost (LCY)";
                            Rec."VAT %" := SalesLine."VAT %";
                            Rec."Line Discount %" := SalesLine."Line Discount %";
                            Rec."Line Discount Amount" := SalesLine."Line Discount Amount";
                            Rec.Amount := SalesLine.Amount;
                            Rec."Amount Including VAT" := SalesLine."Amount Including VAT";
                            Rec."Gross Weight" := SalesLine."Gross Weight";
                            Rec."Net Weight" := SalesLine."Net Weight";
                            Rec."Shortcut Dimension 1 Code" := SalesLine."Shortcut Dimension 1 Code";
                            Rec."Shortcut Dimension 2 Code" := SalesLine."Shortcut Dimension 2 Code";
                            Rec."Job No." := SalesLine."Job No.";
                            Rec."Quantity Shipped" := SalesLine."Quantity Shipped";
                            Rec."Quantity Invoiced" := SalesLine."Quantity Invoiced";
                            Rec."Profit %" := SalesLine."Profit %";
                            Rec."Inv. Discount Amount" := SalesLine."Inv. Discount Amount";
                            Rec."Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
                            Rec."Gen. Prod. Posting Group" := SalesLine."Gen. Prod. Posting Group";
                            Rec."VAT Bus. Posting Group" := SalesLine."VAT Bus. Posting Group";
                            Rec."VAT Prod. Posting Group" := SalesLine."VAT Prod. Posting Group";
                            Rec."Currency Code" := SalesLine."Currency Code";
                            Rec."Reserved Quantity" := SalesLine."Reserved Quantity";
                            Rec."Variant Code" := SalesLine."Variant Code";
                            Rec."Bin Code" := SalesLine."Bin Code";
                            Rec."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Rec."Requested Delivery Date" := SalesLine."Requested Delivery Date";
                            Rec."Promised Delivery Date" := SalesLine."Promised Delivery Date";
                            Rec."Planned Delivery Date" := SalesLine."Planned Delivery Date";
                            Rec."Planned Shipment Date" := SalesLine."Planned Shipment Date";
                            DimMgt.GetShortcutDimensions(SalesLine."Dimension Set ID", ShortcutDimCode);
                            Rec."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            Rec."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            Rec."Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            Rec."Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            Rec."Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            Rec."Shortcut Dimension 8 Code" := ShortcutDimCode[8];
                            TotalQty += Rec.Quantity;
                            TotalAmount += Rec.Amount;
                            TotalAmountInclVAT += Rec."Amount Including VAT";
                            Rec.Insert();
                        end;
                    until SalesLine.Next() = 0;
            until SalesHdr.Next() = 0;
    end;

    procedure FindPostedSalesInvoice(CurrGUID: Guid);
    var
        Item: Record Item;
        Customer: Record Customer;
        CustomerType: Record "Customer Type";
        ItemCategory: Record "Item Category";
        SalesInvLine2: Record "Sales Invoice Line";
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
        Found: Boolean;
    begin
        if not PostedSalesInvoice then
            exit;

        SalesInvHdr.Reset();
        SalesInvLine.Reset();
        if SelltoCustomerFilter <> '' then
            SalesInvHdr.SetFilter("Sell-to Customer No.", SelltoCustomerFilter);
        if BilltoCustomerFilter <> '' then
            SalesInvHdr.SetFilter("Bill-to Customer No.", BilltoCustomerFilter);
        if PostingDateFilter <> '' then
            SalesInvHdr.SetFilter("Posting Date", PostingDateFilter);
        if OrderDateFilter <> '' then
            SalesInvHdr.SetFilter("Order Date", OrderDateFilter);
        if SalesInvHdr.FindSet() then
            Repeat
                SalesInvHdr.CalcFields(Comment, Amount, "Amount Including VAT");
                SalesInvLine.SetRange("Document No.", SalesInvHdr."No.");
                if not ShowDummyLine then
                    SalesInvLine.SetFilter(Amount, '<>0');
                if NoFilterCount = 1 then begin
                    if ItemFilter <> '' then begin
                        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
                        SalesInvLine.SetFilter("No.", ItemFilter);
                    end;
                end;

                if SalesInvLine.FindSet() then
                    Repeat
                        Found := false;
                        if NoFilterCount > 1 then begin
                            if (ItemFilter <> '') and
                               (SalesInvLine.Type = SalesInvLine.Type::Item) then begin
                                SalesInvLine2.Copy(SalesInvLine);
                                SalesInvLine2.SetRange(Type, SalesInvLine2.Type::Item);
                                SalesInvLine2.FilterGroup(2);
                                SalesInvLine2.SetFilter("No.", ItemFilter);
                                SalesInvLine2.FilterGroup(0);
                                SalesInvLine2.SetRange("No.", SalesLine."No.");
                                if not SalesInvLine2.IsEmpty then
                                    Found := true;
                            end;
                        end else
                            Found := true;

                        if Found then begin
                            Rec.Init();
                            Rec.TransferFields(SalesInvHdr);
                            SetFixedFields(CurrGUID);
                            Rec."User ID" := SalesInvHdr."User ID";
                            Rec."Document Type" := Rec."Document Type"::"Posted Invoice";
                            Rec."Document No." := SalesInvLine."Document No.";
                            Rec."Line No." := SalesInvLine."Line No.";

                            if Customer.Get(SalesInvLine."Sell-to Customer No.") then
                                Rec."Customer Group" := Customer."Customer Group";
                            if Customer.Get(SalesInvLine.EndUser) then
                                Rec."EndUser Group" := Customer."Customer Group";

                            if CustomerType.Get(Rec."Customer Group") then
                                Rec."Customer Group Name" := CustomerType."Customer Type Name";
                            if CustomerType.Get(Rec."EndUser Group") then
                                Rec."EndUser Group Name" := CustomerType."Customer Type Name";

                            Rec."Sell-to Customer Name" := SalesInvHdr."Sell-to Customer Name";
                            Rec."Customer Name 2" := SalesInvHdr."Sell-to Customer Name 2";
                            Rec."Posting Date" := SalesInvHdr."Posting Date";
                            Rec."Document Date" := SalesInvHdr."Document Date";
                            Rec."Order Date" := SalesInvHdr."Order Date";
                            Rec."Due Date" := SalesInvHdr."Due Date";
                            Rec."Ship-to Code" := SalesInvHdr."Ship-to Code";
                            Rec."Ship-to Name" := SalesInvHdr."Ship-to Name";
                            Rec."Ship-to Address" := SalesInvHdr."Ship-to Address";
                            Rec."Ship-to Post Code" := SalesInvHdr."Ship-to Post Code";
                            Rec."Posting Description" := SalesInvHdr."Posting Description";
                            Rec."Salesperson Code" := SalesInvHdr."Salesperson Code";
                            Rec."Bill-to Customer No." := SalesInvHdr."Bill-to Customer No.";
                            Rec."Bill-to Name" := SalesInvHdr."Bill-to Name";
                            Rec."Customer Posting Group" := SalesInvHdr."Customer Posting Group";
                            Rec."EndUser" := SalesInvLine.EndUser;
                            Rec."Description(Bikou)" := SalesInvLine."Description(Bikou)";
                            Rec.StorageTemprature := SalesInvLine.StorageTemprature;
                            Rec."External Document No." := SalesInvHdr."External Document No.";
                            Rec."ExternalDocumentNo." := SalesInvLine."ExternaDocumentNo.";
                            Rec."EU Description" := SalesInvLine."EU Description";
                            Rec."EU Division 1" := SalesInvLine."EU Division 1";
                            Rec."EU Division 2" := SalesInvLine."EU Division 2";
                            Rec."EU Division 3" := SalesInvLine."EU Division 3";

                            if Item.Get(SalesInvLine."No.") then;
                            Rec."Item Description" := Item.Description;
                            ItemCategoryCodeSearch(Item."Item Category Code", Rec."Item Category Code", Rec."Item Category Description");
                            Rec."Product Group Code" := Item."Item Category Code";
                            if ItemCategory.Get(Item."Item Category Code") then;
                            Rec."Product Group Description" := ItemCategory.Code + ItemCategory.Description;

                            if Item.Get(SalesInvLine."No.") then
                                Rec.StorageTemprature := Item.StorageTemp;
                            if Item.Get(SalesInvLine."No.") then
                                if Item."Toxic-KBN" = true then
                                    Rec.ItemToxicKBN := '医療用毒劇物';

                            Rec.SerialNoType := 'ﾊﾞｯﾁ';
                            Rec.SalesMonth := Date2DMY(SalesInvHdr."Posting Date", 2);
                            Rec.SalesYear := Date2DMY(SalesInvHdr."Posting Date", 3);
                            if (Rec.SalesMonth = 1) or (Rec.SalesMonth = 2) or (Rec.SalesMonth = 3) then
                                Rec.SalesQuater := '第1四半期';
                            if (Rec.SalesMonth = 4) or (Rec.SalesMonth = 5) or (Rec.SalesMonth = 6) then
                                Rec.SalesQuater := '第2四半期';
                            if (Rec.SalesMonth = 7) or (Rec.SalesMonth = 8) or (Rec.SalesMonth = 9) then
                                Rec.SalesQuater := '第3四半期';
                            if (Rec.SalesMonth = 10) or (Rec.SalesMonth = 11) or (Rec.SalesMonth = 12) then
                                Rec.SalesQuater := '第4四半期';
                            Rec."Order Status" := Rec."Order Status"::Released;
                            Rec.Type := SalesInvLine.Type;
                            Rec."Item No." := SalesInvLine."No.";
                            Rec."Location Code" := SalesInvLine."Location Code";
                            Rec."Shipment Date" := SalesInvLine."Shipment Date";
                            Rec.Description := SalesInvLine.Description;
                            Rec."Description 2" := SalesInvLine.Description;
                            Rec."Unit of Measure" := SalesInvLine."Unit of Measure";
                            Rec.Quantity := SalesInvLine.Quantity;
                            Rec."Unit Price" := SalesInvLine."Unit Price";
                            Rec."Unit Cost (LCY)" := SalesInvLine."Unit Cost (LCY)";
                            Rec."VAT %" := SalesInvLine."VAT %";
                            Rec."Line Discount %" := SalesInvLine."Line Discount %";
                            Rec."Line Discount Amount" := SalesInvLine."Line Discount Amount";
                            Rec.Amount := SalesInvLine.Amount;
                            Rec."Amount Including VAT" := SalesInvLine."Amount Including VAT";
                            Rec."Gross Weight" := SalesInvLine."Gross Weight";
                            Rec."Net Weight" := SalesInvLine."Net Weight";
                            Rec."Shortcut Dimension 1 Code" := SalesInvLine."Shortcut Dimension 1 Code";
                            Rec."Shortcut Dimension 2 Code" := SalesInvLine."Shortcut Dimension 2 Code";
                            Rec."Job No." := SalesInvLine."Job No.";
                            Rec."Quantity Shipped" := SalesInvLine.Quantity;
                            Rec."Quantity Invoiced" := SalesInvLine.Quantity;
                            if Rec."Currency Code" = '' then
                                AmountLCY := SalesInvLine.Amount
                            else
                                AmountLCY :=
                                  CurrExchRate.ExchangeAmtFCYToLCY(WorkDate(), Rec."Currency Code", SalesInvLine.Amount, SalesInvHdr."Currency Factor");

                            ProfitLCY := AmountLCY - Rec."Unit Cost (LCY)" * SalesInvLine.Quantity;
                            if AmountLCY <> 0 then
                                Rec."Profit %" := Round(100 * ProfitLCY / AmountLCY, 0.1)
                            else
                                Rec."Profit %" := 0;
                            Rec."Inv. Discount Amount" := SalesInvLine."Inv. Discount Amount";
                            Rec."Gen. Bus. Posting Group" := SalesInvLine."Gen. Bus. Posting Group";
                            Rec."Gen. Prod. Posting Group" := SalesInvLine."Gen. Prod. Posting Group";
                            Rec."VAT Bus. Posting Group" := SalesInvLine."VAT Bus. Posting Group";
                            Rec."VAT Prod. Posting Group" := SalesInvLine."VAT Prod. Posting Group";
                            Rec."Variant Code" := SalesInvLine."Variant Code";
                            Rec."Bin Code" := SalesInvLine."Bin Code";
                            Rec."Unit of Measure Code" := SalesInvLine."Unit of Measure Code";
                            Rec."Responsibility Center" := SalesInvLine."Responsibility Center";
                            DimMgt.GetShortcutDimensions(SalesInvLine."Dimension Set ID", ShortcutDimCode);
                            Rec."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            Rec."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            Rec."Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            Rec."Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            Rec."Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            Rec."Shortcut Dimension 8 Code" := ShortcutDimCode[8];
                            TotalQty += Rec.Quantity;
                            TotalAmount += Rec.Amount;
                            TotalAmountInclVAT += Rec."Amount Including VAT";
                            Rec.Insert();
                        end;
                    until SalesInvLine.Next() = 0;
            until SalesInvHdr.Next() = 0;
    end;

    procedure FindPostedSalesCrMemo(CurrGUID: Guid);
    var
        Item: Record Item;
        Customer: Record Customer;
        CustomerType: Record "Customer Type";
        ItemCategory: Record "Item Category";
        SalesCrMemoLine2: Record "Sales Cr.Memo Line";
        AmountLCY: Decimal;
        ProfitLCY: Decimal;
        Found: Boolean;
    begin
        if not PostedSalesCrMemo then
            exit;

        SalesCrMemoHdr.Reset();
        SalesCrMemoLine.Reset();
        if SelltoCustomerFilter <> '' then
            SalesCrMemoHdr.SetFilter("Sell-to Customer No.", SelltoCustomerFilter);
        if BilltoCustomerFilter <> '' then
            SalesCrMemoHdr.SetFilter("Bill-to Customer No.", BilltoCustomerFilter);
        if PostingDateFilter <> '' then
            SalesCrMemoHdr.SetFilter("Posting Date", PostingDateFilter);
        if OrderDateFilter <> '' then
            SalesCrMemoHdr.SetFilter("Document Date", OrderDateFilter);

        if SalesCrMemoHdr.FindSet() then
            Repeat
                SalesCrMemoHdr.CalcFields(Comment, Amount, "Amount Including VAT");
                SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHdr."No.");
                if not ShowDummyLine then
                    SalesCrMemoLine.SetFilter(Amount, '<>0');
                if NoFilterCount = 1 then begin
                    if ItemFilter <> '' then begin
                        SalesCrMemoLine.SetRange(Type, SalesCrMemoLine.Type::Item);
                        SalesCrMemoLine.SetFilter("No.", ItemFilter);
                    end;
                end;

                if SalesCrMemoLine.FindSet() then
                    Repeat
                        Found := false;
                        if NoFilterCount > 1 then begin
                            if (ItemFilter <> '') and
                               (SalesCrMemoLine.Type = SalesCrMemoLine.Type::Item) then begin
                                SalesCrMemoLine2.Copy(SalesCrMemoLine);
                                SalesCrMemoLine2.SetRange(Type, SalesCrMemoLine2.Type::Item);
                                SalesCrMemoLine2.FilterGroup(2);
                                SalesCrMemoLine2.SetFilter("No.", ItemFilter);
                                SalesCrMemoLine2.FilterGroup(0);
                                SalesCrMemoLine2.SetRange("No.", SalesLine."No.");
                                if not SalesCrMemoLine2.IsEmpty then
                                    Found := true;
                            end;
                        end else
                            Found := true;

                        if Found then begin
                            Rec.Init();
                            Rec.TransferFields(SalesCrMemoHdr);
                            SetFixedFields(CurrGUID);
                            Rec."Document Type" := Rec."Document Type"::"Posted Credit Memo";
                            Rec."Document No." := SalesCrMemoLine."Document No.";
                            Rec."Line No." := SalesCrMemoLine."Line No.";

                            if Customer.Get(SalesCrMemoLine."Sell-to Customer No.") then
                                Rec."Customer Group" := Customer."Customer Group";
                            if Customer.Get(SalesCrMemoLine.EndUser) then
                                Rec."EndUser Group" := Customer."Customer Group";

                            if CustomerType.Get(Rec."Customer Group") then
                                Rec."Customer Group Name" := CustomerType."Customer Type Name";
                            if CustomerType.Get(Rec."EndUser Group") then
                                Rec."EndUser Group Name" := CustomerType."Customer Type Name";

                            Rec."Sell-to Customer Name" := SalesCrMemoHdr."Sell-to Customer Name";
                            Rec."Customer Name 2" := SalesCrMemoHdr."Sell-to Customer Name 2";
                            Rec."Posting Date" := SalesCrMemoHdr."Posting Date";
                            Rec."Document Date" := SalesCrMemoHdr."Document Date";
                            Rec."Due Date" := SalesCrMemoHdr."Due Date";
                            Rec."Ship-to Code" := SalesCrMemoHdr."Ship-to Code";
                            Rec."Ship-to Name" := SalesCrMemoHdr."Ship-to Name";
                            Rec."Ship-to Address" := SalesCrMemoHdr."Ship-to Address";
                            Rec."Ship-to Post Code" := SalesCrMemoHdr."Ship-to Post Code";
                            Rec."Posting Description" := SalesCrMemoHdr."Posting Description";
                            Rec."Salesperson Code" := SalesCrMemoHdr."Salesperson Code";
                            Rec."Bill-to Customer No." := SalesCrMemoHdr."Bill-to Customer No.";
                            Rec."Bill-to Name" := SalesCrMemoHdr."Bill-to Name";
                            Rec."Customer Posting Group" := SalesCrMemoHdr."Customer Posting Group";
                            Rec."Description(Bikou)" := SalesCrMemoLine."Description(Bikou)";
                            Rec.StorageTemprature := SalesCrMemoLine.StorageTemprature;
                            Rec."External Document No." := SalesCrMemoHdr."External Document No.";
                            Rec."ExternalDocumentNo." := SalesCrMemoLine."ExternaDocumentNo.";
                            Rec."EU Description" := SalesCrMemoLine."EU Description";
                            Rec."EU Division 1" := SalesCrMemoLine."EU Division 1";
                            Rec."EU Division 2" := SalesCrMemoLine."EU Division 2";
                            Rec."EU Division 3" := SalesCrMemoLine."EU Division 3";

                            if Item.Get(SalesCrMemoLine."No.") then;
                            Rec."Item Description" := Item.Description;
                            ItemCategoryCodeSearch(Item."Item Category Code", Rec."Item Category Code", Rec."Item Category Description");
                            Rec."Product Group Code" := Item."Item Category Code";
                            if ItemCategory.Get(Item."Item Category Code") then;
                            Rec."Product Group Description" := ItemCategory.Code + ItemCategory.Description;

                            if Item.Get(SalesCrMemoLine."No.") then
                                Rec.StorageTemprature := Item.StorageTemp;
                            if Item.Get(SalesCrMemoLine."No.") then
                                if Item."Toxic-KBN" = true then
                                    Rec.ItemToxicKBN := '医療用毒劇物';

                            Rec.SerialNoType := 'ﾊﾞｯﾁ';
                            Rec.SalesMonth := Date2DMY(SalesCrMemoHdr."Posting Date", 2);
                            Rec.SalesYear := Date2DMY(SalesCrMemoHdr."Posting Date", 3);
                            if (Rec.SalesMonth = 1) or (Rec.SalesMonth = 2) or (Rec.SalesMonth = 3) then
                                Rec.SalesQuater := '第1四半期';
                            if (Rec.SalesMonth = 4) or (Rec.SalesMonth = 5) or (Rec.SalesMonth = 6) then
                                Rec.SalesQuater := '第2四半期';
                            if (Rec.SalesMonth = 7) or (Rec.SalesMonth = 8) or (Rec.SalesMonth = 9) then
                                Rec.SalesQuater := '第3四半期';
                            if (Rec.SalesMonth = 10) or (Rec.SalesMonth = 11) or (Rec.SalesMonth = 12) then
                                Rec.SalesQuater := '第4四半期';
                            Rec."Order Status" := Rec."Order Status"::Released;

                            Rec."User ID" := SalesCrMemoHdr."User ID";
                            Rec.Type := SalesCrMemoLine.Type;
                            Rec."Item No." := SalesCrMemoLine."No.";
                            Rec."Location Code" := SalesCrMemoLine."Location Code";
                            Rec."Shipment Date" := SalesCrMemoLine."Shipment Date";
                            Rec.Description := SalesCrMemoLine.Description;
                            Rec."Description 2" := SalesCrMemoLine.Description;
                            Rec."Unit of Measure" := SalesCrMemoLine."Unit of Measure";
                            Rec.Quantity := -1 * SalesCrMemoLine.Quantity;
                            Rec."Unit Price" := SalesCrMemoLine."Unit Price";
                            Rec."Unit Cost (LCY)" := SalesCrMemoLine."Unit Cost (LCY)";
                            Rec."VAT %" := SalesCrMemoLine."VAT %";
                            Rec."Line Discount %" := SalesCrMemoLine."Line Discount %";
                            Rec."Line Discount Amount" := SalesCrMemoLine."Line Discount Amount";
                            Rec.Amount := SymbolConvert(Rec.Quantity) * SalesCrMemoLine.Amount;
                            Rec."Amount Including VAT" := SymbolConvert(Rec.Quantity) * SalesCrMemoLine."Amount Including VAT";
                            Rec."Gross Weight" := SalesCrMemoLine."Gross Weight";
                            Rec."Net Weight" := SalesCrMemoLine."Net Weight";
                            Rec."Shortcut Dimension 1 Code" := SalesCrMemoLine."Shortcut Dimension 1 Code";
                            Rec."Shortcut Dimension 2 Code" := SalesCrMemoLine."Shortcut Dimension 2 Code";
                            Rec."Job No." := SalesCrMemoLine."Job No.";
                            Rec."Quantity Shipped" := -SalesCrMemoLine.Quantity;
                            Rec."Quantity Invoiced" := -SalesCrMemoLine.Quantity;
                            if Rec."Currency Code" = '' then
                                AmountLCY := SalesCrMemoLine.Amount
                            else
                                AmountLCY :=
                                  CurrExchRate.ExchangeAmtFCYToLCY(WorkDate(), Rec."Currency Code", SalesCrMemoLine.Amount, SalesCrMemoHdr."Currency Factor");

                            ProfitLCY := AmountLCY - Rec."Unit Cost (LCY)" * SalesCrMemoLine.Quantity;
                            if AmountLCY <> 0 then
                                Rec."Profit %" := Round(100 * ProfitLCY / AmountLCY, 0.1)
                            else
                                Rec."Profit %" := 0;
                            Rec."Inv. Discount Amount" := SalesCrMemoLine."Inv. Discount Amount";
                            Rec."Gen. Bus. Posting Group" := SalesCrMemoLine."Gen. Bus. Posting Group";
                            Rec."Gen. Prod. Posting Group" := SalesCrMemoLine."Gen. Prod. Posting Group";
                            Rec."VAT Bus. Posting Group" := SalesCrMemoLine."VAT Bus. Posting Group";
                            Rec."VAT Prod. Posting Group" := SalesCrMemoLine."VAT Prod. Posting Group";
                            Rec."Variant Code" := SalesCrMemoLine."Variant Code";
                            Rec."Bin Code" := SalesCrMemoLine."Bin Code";
                            Rec."Unit of Measure Code" := SalesCrMemoLine."Unit of Measure Code";
                            Rec."Responsibility Center" := SalesCrMemoLine."Responsibility Center";
                            DimMgt.GetShortcutDimensions(SalesCrMemoLine."Dimension Set ID", ShortcutDimCode);
                            Rec."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            Rec."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            Rec."Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            Rec."Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            Rec."Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            Rec."Shortcut Dimension 8 Code" := ShortcutDimCode[8];
                            TotalQty += Rec.Quantity;
                            TotalAmount += Rec.Amount;
                            TotalAmountInclVAT += Rec."Amount Including VAT";
                            Rec.Insert();
                        end;
                    until SalesCrMemoLine.Next() = 0;
            until SalesCrMemoHdr.Next() = 0;
    end;

    procedure ExportDataToExcel(ShowTrackingInfo: Boolean);
    var
        SalesLine: Record "Sales Line";
        ReservEntry: Record "Reservation Entry";
        ShipmentLine: Record "Sales Shipment Line";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TempItemLedgEntry: Record "Item Ledger Entry" temporary;
        ItemTrackingMgmt: Codeunit "Item Tracking Management";
        RowNo: Integer;
    begin
        TempExcelBuffer.DeleteAll();
        Clear(TempExcelBuffer);

        RowNo := 1;
        TempExcelBuffer.CreateNewBook('Sales Inquiry');
        EnterCell(RowNo, 1, Rec.FieldCaption("Document Type"), true, false, false, '@');
        EnterCell(RowNo, 2, Rec.FieldCaption("Document No."), true, false, false, '@');
        EnterCell(RowNo, 3, Rec.FieldCaption("Order Status"), true, false, false, '@');
        EnterCell(RowNo, 4, Rec.FieldCaption("Sell-to Customer No."), true, false, false, '@');
        EnterCell(RowNo, 5, Rec.FieldCaption("Sell-to Customer Name"), true, false, false, '@');
        EnterCell(RowNo, 6, Rec.FieldCaption("Posting Date"), true, false, false, '@');
        EnterCell(RowNo, 7, Rec.FieldCaption("Order Date"), true, false, false, '@');
        EnterCell(RowNo, 8, Rec.FieldCaption("Document Date"), true, false, false, '@');
        EnterCell(RowNo, 9, Rec.FieldCaption("Posting Description"), true, false, false, '@');
        EnterCell(RowNo, 10, Rec.FieldCaption("Salesperson Code"), true, false, false, '@');
        EnterCell(RowNo, 11, Rec.FieldCaption("External Document No."), true, false, false, '@');
        EnterCell(RowNo, 12, Rec.FieldCaption("Bill-to Customer No."), true, false, false, '@');
        EnterCell(RowNo, 13, Rec.FieldCaption("Bill-to Name"), true, false, false, '@');
        EnterCell(RowNo, 14, Rec.FieldCaption("Due Date"), true, false, false, '@');
        EnterCell(RowNo, 15, Rec.FieldCaption("Currency Code"), true, false, false, '@');
        EnterCell(RowNo, 16, Rec.FieldCaption("Ship-to Code"), true, false, false, '@');
        EnterCell(RowNo, 17, Rec.FieldCaption("Ship-to Name"), true, false, false, '@');
        EnterCell(RowNo, 18, Rec.FieldCaption("Ship-to Address"), true, false, false, '@');
        EnterCell(RowNo, 19, Rec.FieldCaption("Ship-to Post Code"), true, false, false, '@');
        EnterCell(RowNo, 20, Rec.FieldCaption("Line No."), true, false, false, '@');
        EnterCell(RowNo, 21, Rec.FieldCaption(Type), true, false, false, '@');
        EnterCell(RowNo, 22, Rec.FieldCaption("Item No."), true, false, false, '@');
        EnterCell(RowNo, 23, Rec.FieldCaption("Item Description"), true, false, false, '@');
        EnterCell(RowNo, 24, Rec.FieldCaption("Location Code"), true, false, false, '@');
        EnterCell(RowNo, 25, Rec.FieldCaption(Description), true, false, false, '@');
        EnterCell(RowNo, 26, Rec.FieldCaption("Description 2"), true, false, false, '@');
        EnterCell(RowNo, 27, Rec.FieldCaption("Unit of Measure Code"), true, false, false, '@');
        EnterCell(RowNo, 28, Rec.FieldCaption("Unit of Measure"), true, false, false, '@');
        EnterCell(RowNo, 29, Rec.FieldCaption(Quantity), true, false, false, '@');
        EnterCell(RowNo, 30, Rec.FieldCaption("Reserved Quantity"), true, false, false, '@');
        EnterCell(RowNo, 31, Rec.FieldCaption("Qty. to Ship"), true, false, false, '@');  // New
        EnterCell(RowNo, 32, Rec.FieldCaption("Qty. to Invoice"), true, false, false, '@');
        EnterCell(RowNo, 33, Rec.FieldCaption("Quantity Shipped"), true, false, false, '@');
        EnterCell(RowNo, 34, Rec.FieldCaption("Quantity Invoiced"), true, false, false, '@');
        EnterCell(RowNo, 35, Rec.FieldCaption("Unit Price"), true, false, false, '@');
        EnterCell(RowNo, 36, Rec.FieldCaption("Unit Cost (LCY)"), true, false, false, '@');
        EnterCell(RowNo, 37, Rec.FieldCaption("VAT %"), true, false, false, '@');
        EnterCell(RowNo, 38, Rec.FieldCaption("Line Discount %"), true, false, false, '@');
        EnterCell(RowNo, 39, Rec.FieldCaption("Line Discount Amount"), true, false, false, '@');
        EnterCell(RowNo, 40, Rec.FieldCaption("Inv. Discount Amount"), true, false, false, '@');
        EnterCell(RowNo, 41, Rec.FieldCaption(Amount), true, false, false, '@');
        EnterCell(RowNo, 42, Rec.FieldCaption("Amount Including VAT"), true, false, false, '@');
        EnterCell(RowNo, 43, Rec.FieldCaption("Profit %"), true, false, false, '@');
        EnterCell(RowNo, 44, Rec.FieldCaption("Net Weight"), true, false, false, '@');
        EnterCell(RowNo, 45, Rec.FieldCaption("Gross Weight"), true, false, false, '@');
        EnterCell(RowNo, 46, Rec.FieldCaption("Shipment Date"), true, false, false, '@');
        EnterCell(RowNo, 47, Rec.FieldCaption("Requested Delivery Date"), true, false, false, '@');
        EnterCell(RowNo, 48, Rec.FieldCaption("Planned Delivery Date"), true, false, false, '@');
        EnterCell(RowNo, 49, Rec.FieldCaption("Promised Delivery Date"), true, false, false, '@');
        EnterCell(RowNo, 50, Rec.FieldCaption("Planned Shipment Date"), true, false, false, '@');
        EnterCell(RowNo, 51, Rec.FieldCaption("Shortcut Dimension 1 Code"), true, false, false, '@');//"Global Dimension 1 Code"
        EnterCell(RowNo, 52, Rec.FieldCaption("Shortcut Dimension 2 Code"), true, false, false, '@');//"Global Dimension 2 Code"
        EnterCell(RowNo, 53, Rec.FieldCaption("Shortcut Dimension 3 Code"), true, false, false, '@');
        EnterCell(RowNo, 54, Rec.FieldCaption("Shortcut Dimension 4 Code"), true, false, false, '@');
        EnterCell(RowNo, 55, Rec.FieldCaption("Shortcut Dimension 5 Code"), true, false, false, '@');
        EnterCell(RowNo, 56, Rec.FieldCaption("Shortcut Dimension 6 Code"), true, false, false, '@');
        EnterCell(RowNo, 57, Rec.FieldCaption("Shortcut Dimension 7 Code"), true, false, false, '@');
        EnterCell(RowNo, 58, Rec.FieldCaption("Shortcut Dimension 8 Code"), true, false, false, '@');
        EnterCell(RowNo, 59, Rec.FieldCaption("Job No."), true, false, false, '@');
        EnterCell(RowNo, 60, Rec.FieldCaption("Reason Code"), true, false, false, '@');
        EnterCell(RowNo, 61, Rec.FieldCaption("Customer Posting Group"), true, false, false, '@');
        EnterCell(RowNo, 62, Rec.FieldCaption("Gen. Bus. Posting Group"), true, false, false, '@');
        EnterCell(RowNo, 63, Rec.FieldCaption("Gen. Prod. Posting Group"), true, false, false, '@');
        EnterCell(RowNo, 64, Rec.FieldCaption("VAT Bus. Posting Group"), true, false, false, '@');
        EnterCell(RowNo, 65, Rec.FieldCaption("VAT Prod. Posting Group"), true, false, false, '@');
        EnterCell(RowNo, 66, Rec.FieldCaption("Variant Code"), true, false, false, '@');
        EnterCell(RowNo, 67, Rec.FieldCaption("Bin Code"), true, false, false, '@');
        EnterCell(RowNo, 68, Rec.FieldCaption("Responsibility Center"), true, false, false, '@');
        EnterCell(RowNo, 69, Rec.FieldCaption(EndUser), true, false, false, '@');
        if ShowTrackingInfo then begin
            EnterCell(RowNo, 70, ReservEntry.FieldCaption("Serial No."), true, false, false, '@');
            EnterCell(RowNo, 71, ReservEntry.FieldCaption("Lot No."), true, false, false, '@');
            EnterCell(RowNo, 72, ReservEntry.FieldCaption("Expiration Date"), true, false, false, '@');
            EnterCell(RowNo, 73, ReservEntry.FieldCaption(Quantity), true, false, false, '@');
        end;
        if Rec.FindSet() then
            Repeat
                RowNo += 1;
                EnterCell(RowNo, 1, Format(Rec."Document Type"), false, false, false, '@');
                EnterCell(RowNo, 2, Format(Rec."Document No."), false, false, false, '@');
                EnterCell(RowNo, 3, Format(Rec."Order Status"), false, false, false, '@');
                EnterCell(RowNo, 4, Format(Rec."Sell-to Customer No."), false, false, false, '@');
                EnterCell(RowNo, 5, Format(Rec."Sell-to Customer Name"), false, false, false, '@');
                EnterCell(RowNo, 6, Format(Rec."Posting Date"), false, false, false, '');
                EnterCell(RowNo, 7, Format(Rec."Order Date"), false, false, false, '');
                EnterCell(RowNo, 8, Format(Rec."Document Date"), false, false, false, '');
                EnterCell(RowNo, 9, Format(Rec."Posting Description"), false, false, false, '@');
                EnterCell(RowNo, 10, Format(Rec."Salesperson Code"), false, false, false, '@');
                EnterCell(RowNo, 11, Format(Rec."External Document No."), false, false, false, '@');
                EnterCell(RowNo, 12, Format(Rec."Bill-to Customer No."), false, false, false, '@');
                EnterCell(RowNo, 13, Format(Rec."Bill-to Name"), false, false, false, '@');
                EnterCell(RowNo, 14, Format(Rec."Due Date"), false, false, false, '');
                EnterCell(RowNo, 15, Format(Rec."Currency Code"), false, false, false, '@');
                EnterCell(RowNo, 16, Format(Rec."Ship-to Code"), false, false, false, '@');
                EnterCell(RowNo, 17, Format(Rec."Ship-to Name"), false, false, false, '@');
                EnterCell(RowNo, 18, Format(Rec."Ship-to Address"), false, false, false, '@');
                EnterCell(RowNo, 19, Format(Rec."Ship-to Post Code"), false, false, false, '@');
                EnterCell(RowNo, 20, Format(Rec."Line No."), false, false, false, '');
                EnterCell(RowNo, 21, Format(Rec.Type), false, false, false, '');
                EnterCell(RowNo, 22, Format(Rec."Item No."), false, false, false, '@');
                EnterCell(RowNo, 23, Format(Rec."Item Description"), false, false, false, '@');
                EnterCell(RowNo, 24, Format(Rec."Location Code"), false, false, false, '@');
                EnterCell(RowNo, 25, Format(Rec.Description), false, false, false, '');
                EnterCell(RowNo, 26, Format(Rec."Description 2"), false, false, false, '');
                EnterCell(RowNo, 27, Format(Rec."Unit of Measure Code"), false, false, false, '@');
                EnterCell(RowNo, 28, Format(Rec."Unit of Measure"), false, false, false, '@');
                EnterCell(RowNo, 29, Format(Rec.Quantity), false, false, false, '');
                EnterCell(RowNo, 30, Format(Rec."Reserved Quantity"), false, false, false, '');
                EnterCell(RowNo, 31, Format(Rec."Qty. to Ship"), false, false, false, '');
                EnterCell(RowNo, 32, Format(Rec."Qty. to Invoice"), false, false, false, '');
                EnterCell(RowNo, 33, Format(Rec."Quantity Shipped"), false, false, false, '');
                EnterCell(RowNo, 34, Format(Rec."Quantity Invoiced"), false, false, false, '');
                EnterCell(RowNo, 35, Format(Rec."Unit Price"), false, false, false, '');
                EnterCell(RowNo, 36, Format(Rec."Unit Cost (LCY)"), false, false, false, '');
                EnterCell(RowNo, 37, Format(Rec."VAT %"), false, false, false, '');
                EnterCell(RowNo, 38, Format(Rec."Line Discount %"), false, false, false, '');
                EnterCell(RowNo, 39, Format(Rec."Line Discount Amount"), false, false, false, '');
                EnterCell(RowNo, 40, Format(Rec."Inv. Discount Amount"), false, false, false, '');
                EnterCell(RowNo, 41, Format(Rec.Amount), false, false, false, '');
                EnterCell(RowNo, 42, Format(Rec."Amount Including VAT"), false, false, false, '');
                EnterCell(RowNo, 43, Format(Rec."Profit %"), false, false, false, '');
                EnterCell(RowNo, 44, Format(Rec."Net Weight"), false, false, false, '');
                EnterCell(RowNo, 45, Format(Rec."Gross Weight"), false, false, false, '');
                EnterCell(RowNo, 46, Format(Rec."Shipment Date"), false, false, false, '');
                EnterCell(RowNo, 47, Format(Rec."Requested Delivery Date"), false, false, false, '');
                EnterCell(RowNo, 48, Format(Rec."Planned Delivery Date"), false, false, false, '');
                EnterCell(RowNo, 49, Format(Rec."Promised Delivery Date"), false, false, false, '');
                EnterCell(RowNo, 50, Format(Rec."Planned Shipment Date"), false, false, false, '');
                EnterCell(RowNo, 51, Format(Rec."Shortcut Dimension 1 Code"), false, false, false, '@');//"Global Dimension 1 Code"
                EnterCell(RowNo, 52, Format(Rec."Shortcut Dimension 2 Code"), false, false, false, '@');//"Global Dimension 2 Code"
                EnterCell(RowNo, 53, Format(Rec."Shortcut Dimension 3 Code"), false, false, false, '@');
                EnterCell(RowNo, 54, Format(Rec."Shortcut Dimension 4 Code"), false, false, false, '@');
                EnterCell(RowNo, 55, Format(Rec."Shortcut Dimension 5 Code"), false, false, false, '@');
                EnterCell(RowNo, 56, Format(Rec."Shortcut Dimension 6 Code"), false, false, false, '@');
                EnterCell(RowNo, 57, Format(Rec."Shortcut Dimension 7 Code"), false, false, false, '@');
                EnterCell(RowNo, 58, Format(Rec."Shortcut Dimension 8 Code"), false, false, false, '@');
                EnterCell(RowNo, 59, Format(Rec."Job No."), false, false, false, '@');
                EnterCell(RowNo, 60, Format(Rec."Reason Code"), false, false, false, '@');
                EnterCell(RowNo, 61, Format(Rec."Customer Posting Group"), false, false, false, '@');
                EnterCell(RowNo, 62, Format(Rec."Gen. Bus. Posting Group"), false, false, false, '@');
                EnterCell(RowNo, 63, Format(Rec."Gen. Prod. Posting Group"), false, false, false, '@');
                EnterCell(RowNo, 64, Format(Rec."VAT Bus. Posting Group"), false, false, false, '@');
                EnterCell(RowNo, 65, Format(Rec."VAT Prod. Posting Group"), false, false, false, '@');
                EnterCell(RowNo, 66, Format(Rec."Variant Code"), false, false, false, '@');
                EnterCell(RowNo, 67, Format(Rec."Bin Code"), false, false, false, '@');
                EnterCell(RowNo, 68, Format(Rec."Responsibility Center"), false, false, false, '@');
                EnterCell(RowNo, 69, Format(Rec."EndUser"), false, false, false, '@');
                if ShowTrackingInfo then begin
                    case Rec."Document Type" of
                        Rec."Document Type"::Quote,
                        Rec."Document Type"::Order,
                        Rec."Document Type"::Invoice,
                        Rec."Document Type"::"Credit Memo":
                            begin
                                if SalesLine.Get(Rec."Document Type", Rec."Document No.", Rec."Line No.") then begin
                                    if SalesLine.ReservEntryExist() then begin
                                        ReservEntry.Reset();
                                        ReservEntry.SetCurrentKey("Source Type", "Source Subtype", "Source ID", "Source Ref. No.");
                                        ReservEntry.SetRange("Source Type", Database::"Sales Line");
                                        ReservEntry.SetRange("Source Subtype", SalesLine."Document Type".AsInteger());
                                        ReservEntry.SetRange("Source ID", SalesLine."Document No.");
                                        ReservEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
                                        if ReservEntry.FindSet() then
                                            Repeat
                                                if (ReservEntry."Serial No." <> '') or (ReservEntry."Lot No." <> '') then begin
                                                    RowNo += 1;
                                                    if ReservEntry."Serial No." <> '' then
                                                        EnterCell(RowNo, 70, Format(ReservEntry."Serial No."), false, false, false, '@');
                                                    if ReservEntry."Lot No." <> '' then
                                                        EnterCell(RowNo, 71, Format(ReservEntry."Lot No."), false, false, false, '@');
                                                    if ReservEntry."Expiration Date" <> 0D then
                                                        EnterCell(RowNo, 72, Format(ReservEntry."Expiration Date"), false, false, false, '')
                                                    else begin
                                                        ItemLedgerEntry.Reset();
                                                        ItemLedgerEntry.SetRange("Item No.", ReservEntry."Item No.");
                                                        ItemLedgerEntry.SetRange("Variant Code", ReservEntry."Variant Code");
                                                        ItemLedgerEntry.SetRange("Lot No.", ReservEntry."Lot No.");
                                                        ItemLedgerEntry.SetRange("Serial No.", ReservEntry."Serial No.");
                                                        if ItemLedgerEntry.FindFirst() then begin
                                                            if ItemLedgerEntry."Expiration Date" <> 0D then
                                                                EnterCell(RowNo, 72, Format(ItemLedgerEntry."Expiration Date"), false, false, false, '')
                                                        end;
                                                    end;
                                                    EnterCell(RowNo, 73, Format(-ReservEntry.Quantity), false, false, false, '');
                                                end;
                                            until ReservEntry.Next() = 0;
                                    end;
                                    ShipmentLine.Reset();
                                    ShipmentLine.SetCurrentKey("Order No.", "Order Line No.");
                                    ShipmentLine.SetRange("Order No.", Rec."Document No.");
                                    ShipmentLine.SetRange("Order Line No.", Rec."Line No.");
                                    if ShipmentLine.FindSet() then
                                        Repeat
                                            Clear(TempItemLedgEntry);
                                            TempItemLedgEntry.DeleteAll();
                                            Clear(ItemTrackingMgmt);
                                            RetrieveILEFromShptRcpt(TempItemLedgEntry,//ItemTrackingMgmt.
                                            Database::"Sales Shipment Line", 0, ShipmentLine."Document No.", '', 0, ShipmentLine."Line No.");
                                            if TempItemLedgEntry.FindSet() then
                                                Repeat
                                                    if (TempItemLedgEntry."Serial No." <> '') or (TempItemLedgEntry."Lot No." <> '') then begin
                                                        RowNo += 1;
                                                        if TempItemLedgEntry."Serial No." <> '' then
                                                            EnterCell(RowNo, 70, Format(TempItemLedgEntry."Serial No."), false, false, false, '@');
                                                        if TempItemLedgEntry."Lot No." <> '' then
                                                            EnterCell(RowNo, 71, Format(TempItemLedgEntry."Lot No."), false, false, false, '@');
                                                        if TempItemLedgEntry."Expiration Date" <> 0D then
                                                            EnterCell(RowNo, 72, Format(TempItemLedgEntry."Expiration Date"), false, false, false, '')
                                                        else begin
                                                            ItemLedgerEntry.Reset();
                                                            ItemLedgerEntry.SetRange("Item No.", TempItemLedgEntry."Item No.");
                                                            ItemLedgerEntry.SetRange("Variant Code", TempItemLedgEntry."Variant Code");
                                                            ItemLedgerEntry.SetRange("Lot No.", TempItemLedgEntry."Lot No.");
                                                            ItemLedgerEntry.SetRange("Serial No.", TempItemLedgEntry."Serial No.");
                                                            if ItemLedgerEntry.FindFirst() then begin
                                                                if ItemLedgerEntry."Expiration Date" <> 0D then
                                                                    EnterCell(RowNo, 72, Format(ItemLedgerEntry."Expiration Date"), false, false, false, '')
                                                            end;
                                                        end;
                                                        EnterCell(RowNo, 73, Format(TempItemLedgEntry.Quantity), false, false, false, '');
                                                    end;
                                                until TempItemLedgEntry.Next() = 0;
                                        until ShipmentLine.Next() = 0;
                                end;
                            end;
                        Rec."Document Type"::"Posted Invoice":
                            begin
                                if SalesInvLine.Get(Rec."Document No.",
                                Rec."Line No.") then begin
                                    Clear(TempItemLedgEntry);
                                    TempItemLedgEntry.DeleteAll();
                                    Clear(ItemTrackingMgmt);
                                    RetrieveILEFromPostedInv(TempItemLedgEntry, SalesInvLine.RowID1);//ItemTrackingMgmt.RetrieveILEFromPostedInv
                                    if TempItemLedgEntry.FindSet() then
                                        Repeat
                                            if (TempItemLedgEntry."Serial No." <> '') or (TempItemLedgEntry."Lot No." <> '') then begin
                                                RowNo += 1;
                                                if TempItemLedgEntry."Serial No." <> '' then
                                                    EnterCell(RowNo, 70, Format(TempItemLedgEntry."Serial No."), false, false, false, '@');
                                                if TempItemLedgEntry."Lot No." <> '' then
                                                    EnterCell(RowNo, 71, Format(TempItemLedgEntry."Lot No."), false, false, false, '@');
                                                if TempItemLedgEntry."Expiration Date" <> 0D then
                                                    EnterCell(RowNo, 72, Format(TempItemLedgEntry."Expiration Date"), false, false, false, '')
                                                else begin
                                                    ItemLedgerEntry.Reset();
                                                    ItemLedgerEntry.SetRange("Item No.", TempItemLedgEntry."Item No.");
                                                    ItemLedgerEntry.SetRange("Variant Code", TempItemLedgEntry."Variant Code");
                                                    ItemLedgerEntry.SetRange("Lot No.", TempItemLedgEntry."Lot No.");
                                                    ItemLedgerEntry.SetRange("Serial No.", TempItemLedgEntry."Serial No.");
                                                    if ItemLedgerEntry.FindFirst() then begin
                                                        if ItemLedgerEntry."Expiration Date" <> 0D then
                                                            EnterCell(RowNo, 72, Format(ItemLedgerEntry."Expiration Date"), false, false, false, '')
                                                    end;
                                                end;
                                                EnterCell(RowNo, 73, Format(TempItemLedgEntry.Quantity), false, false, false, '');
                                            end;
                                        until TempItemLedgEntry.Next() = 0;
                                end;
                            end;
                        Rec."Document Type"::"Posted Credit Memo":
                            begin
                                if SalesCrMemoLine.Get(Rec."Document No.", Rec."Line No.") then begin
                                    Clear(TempItemLedgEntry);
                                    TempItemLedgEntry.DeleteAll();
                                    Clear(ItemTrackingMgmt);
                                    RetrieveILEFromPostedInv(TempItemLedgEntry, SalesCrMemoLine.RowID1);//ItemTrackingMgmt.RetrieveILEFromPostedInv
                                    if TempItemLedgEntry.FindSet() then
                                        Repeat
                                            if (TempItemLedgEntry."Serial No." <> '') or (TempItemLedgEntry."Lot No." <> '') then begin
                                                RowNo += 1;
                                                if TempItemLedgEntry."Serial No." <> '' then
                                                    EnterCell(RowNo, 70, Format(TempItemLedgEntry."Serial No."), false, false, false, '@');
                                                if TempItemLedgEntry."Lot No." <> '' then
                                                    EnterCell(RowNo, 71, Format(TempItemLedgEntry."Lot No."), false, false, false, '@');
                                                if TempItemLedgEntry."Expiration Date" <> 0D then
                                                    EnterCell(RowNo, 72, Format(TempItemLedgEntry."Expiration Date"), false, false, false, '')
                                                else begin
                                                    ItemLedgerEntry.Reset();
                                                    ItemLedgerEntry.SetRange("Item No.", TempItemLedgEntry."Item No.");
                                                    ItemLedgerEntry.SetRange("Variant Code", TempItemLedgEntry."Variant Code");
                                                    ItemLedgerEntry.SetRange("Lot No.", TempItemLedgEntry."Lot No.");
                                                    ItemLedgerEntry.SetRange("Serial No.", TempItemLedgEntry."Serial No.");
                                                    if ItemLedgerEntry.FindFirst() then begin
                                                        if ItemLedgerEntry."Expiration Date" <> 0D then
                                                            EnterCell(RowNo, 72, Format(ItemLedgerEntry."Expiration Date"), false, false, false, '')
                                                    end;
                                                end;
                                                EnterCell(RowNo, 73, Format(TempItemLedgEntry.Quantity), false, false, false, '');
                                            end;
                                        until TempItemLedgEntry.Next() = 0;
                                end;
                            end;
                    end;
                end;
            until Rec.Next() = 0;
        this.TempExcelBuffer.WriteSheet('Sales Inquiry', CompanyName, UserId);
        this.TempExcelBuffer.CloseBook();
        this.TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Sales Inquiry', CurrentDateTime, UserId));
        this.TempExcelBuffer.OpenExcel();
    end;

    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean; NumberFormat: Text[50]);
    begin
        TempExcelBuffer.Init();
        TempExcelBuffer.Validate("Row No.", RowNo);
        TempExcelBuffer.Validate("Column No.", ColumnNo);
        if NumberFormat = '@' then begin
            TempExcelBuffer.Validate("Cell Type", TempExcelBuffer."Cell Type"::Text);
        end;
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Italic := Italic;
        TempExcelBuffer.Underline := UnderLine;
        TempExcelBuffer.NumberFormat := NumberFormat;
        TempExcelBuffer.Insert();
    end;

    procedure RetrieveILEFromShptRcpt(var TempItemLedgEntry: Record "Item Ledger Entry" temporary; Type: Integer; Subtype: Integer; ID: Code[20]; BatchName: Code[10]; ProdOrderLine: Integer; RefNo: Integer);
    var
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    begin
        // retrieves a data set of Item Ledger Entries (Posted Shipments/Receipts)
        ItemEntryRelation.SetCurrentKey("Source ID", "Source Type");
        ItemEntryRelation.SetRange("Source Type", Type);
        ItemEntryRelation.SetRange("Source Subtype", Subtype);
        ItemEntryRelation.SetRange("Source ID", ID);
        ItemEntryRelation.SetRange("Source Batch Name", BatchName);
        ItemEntryRelation.SetRange("Source Prod. Order Line", ProdOrderLine);
        ItemEntryRelation.SetRange("Source Ref. No.", RefNo);
        if ItemEntryRelation.FindSet() then begin
            SignFactor := TableSignFactor(Type);
            Repeat
                ItemLedgEntry.Get(ItemEntryRelation."Item Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                AddTempRecordToSet(TempItemLedgEntry, SignFactor);
            until ItemEntryRelation.Next() = 0;
        end;
    end;

    procedure RetrieveILEFromPostedInv(var TempItemLedgEntry: Record "Item Ledger Entry" temporary; InvoiceRowID: Text[250]);
    var
        ValueEntryRelation: Record "Value Entry Relation";
        ValueEntry: Record "Value Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    begin
        // retrieves a data set of Item Ledger Entries (Posted Invoices)
        ValueEntryRelation.SetCurrentKey("Source RowId");
        ValueEntryRelation.SetRange("Source RowId", InvoiceRowID);
        if ValueEntryRelation.FindFirst() then begin
            SignFactor := TableSignFactor2(InvoiceRowID);
            Repeat
                ValueEntry.Get(ValueEntryRelation."Value Entry No.");
                ItemLedgEntry.Get(ValueEntry."Item Ledger Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                TempItemLedgEntry.Quantity := ValueEntry."Invoiced Quantity";
                if TempItemLedgEntry.Quantity <> 0 then
                    AddTempRecordToSet(TempItemLedgEntry, SignFactor);
            until ValueEntryRelation.Next() = 0;
        end;
    end;

    local procedure AddTempRecordToSet(var TempItemLedgEntry: Record "Item Ledger Entry" temporary; SignFactor: Integer);
    var
        TempItemLedgEntry2: Record "Item Ledger Entry" temporary;
    begin
        if SignFactor <> 1 then begin
            TempItemLedgEntry.Quantity *= SignFactor;
            TempItemLedgEntry."Remaining Quantity" *= SignFactor;
            TempItemLedgEntry."Invoiced Quantity" *= SignFactor;
        end;
        RetrieveAppliedExpDate(TempItemLedgEntry);
        TempItemLedgEntry2 := TempItemLedgEntry;
        TempItemLedgEntry.Reset();
        TempItemLedgEntry.SetRange("Serial No.", TempItemLedgEntry2."Serial No.");
        TempItemLedgEntry.SetRange("Lot No.", TempItemLedgEntry2."Lot No.");
        TempItemLedgEntry.SetRange("Warranty Date", TempItemLedgEntry2."Warranty Date");
        TempItemLedgEntry.SetRange("Expiration Date", TempItemLedgEntry2."Expiration Date");
        if TempItemLedgEntry.FindFirst() then begin
            TempItemLedgEntry.Quantity += TempItemLedgEntry2.Quantity;
            TempItemLedgEntry."Remaining Quantity" += TempItemLedgEntry2."Remaining Quantity";
            TempItemLedgEntry."Invoiced Quantity" += TempItemLedgEntry2."Invoiced Quantity";
            TempItemLedgEntry.Modify();
        end else begin
            TempItemLedgEntry.Insert();
        end;
        TempItemLedgEntry.Reset();
    end;

    local procedure TableSignFactor2(RowID: Text[250]): Integer;
    var
        TableNo: Integer;
    begin
        RowID := DelChr(RowID, '<', '"');
        RowID := CopyStr(RowID, 1, StrPos(RowID, '"') - 1);
        if Evaluate(TableNo, RowID) then
            exit(TableSignFactor(TableNo));
        exit(1);
    end;

    local procedure TableSignFactor(TableNo: Integer): Integer;
    begin
        if TableNo IN [
                       Database::"Sales Line",
                       Database::"Sales Shipment Line",
                       Database::"Sales Invoice Line",
                       Database::"Purch. Cr. Memo Line",
                       Database::"Prod. Order Component",
                       Database::"Transfer Shipment Line",
                       Database::"Return Shipment Line",
                       Database::"Planning Component",
                       Database::"Service Line",
                       Database::"Service Shipment Line",
                       Database::"Service Invoice Line"]
        then
            exit(-1);
        exit(1);
    end;

    procedure RetrieveAppliedExpDate(var TempItemLedgEntry: Record "Item Ledger Entry" temporary);
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemApplEntry: Record "Item Application Entry";
    begin
        if TempItemLedgEntry.Positive then
            exit;
        ItemApplEntry.Reset();
        ItemApplEntry.SetCurrentKey("Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application");
        ItemApplEntry.SetRange("Outbound Item Entry No.", TempItemLedgEntry."Entry No.");
        ItemApplEntry.SetRange("Item Ledger Entry No.", TempItemLedgEntry."Entry No.");
        if ItemApplEntry.FindFirst() then begin
            ItemLedgEntry.Get(ItemApplEntry."Inbound Item Entry No.");
            TempItemLedgEntry."Expiration Date" := ItemLedgEntry."Expiration Date";
        end;
    end;

    local procedure ItemCategoryCodeSearch(ItemCC: code[20]; var ParentCode: code[20]; var ParentName: text[100])
    var
        ItemCategory: Record "Item Category";
        ItemCategory2: Record "Item Category";
    begin
        ItemCategory.SetRange(Code, ItemCC);
        if ItemCategory.Findfirst() then begin
            ParentCode := ItemCategory."Parent Category";
            if ItemCategory2.Get(ParentCode) then begin
                ParentName := ParentCode + itemCategory2.Description
            end else begin
                ParentName := '';
            end;
        end else begin
            ParentCode := '';
            ParentName := '';
        end;
    end;

    local procedure SymbolConvert(DecimalValue: decimal): Decimal;
    var
    begin
        if DecimalValue < 0 then begin
            exit(-1);
        end else begin
            exit(1);
        end;
    end;
}