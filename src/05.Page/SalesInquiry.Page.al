/* page 50018 "NEBJ Sales Inquiry"
{
    Caption = 'NEBJ Sales Inquiry';
    DataCaptionExpression = '';
    PageType = Document;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(Include)
            {
                Caption = 'Include';
                field(SalesQuote; SalesQuote)
                {
                    Caption = 'Sales Quote';
                }
                field(SalesOrder; SalesOrder)
                {
                    Caption = 'Sales Order';
                }
                field(SalesInvoice; SalesInvoice)
                {
                    Caption = 'Sales Invoice';
                }
                field(SalesCreditMemo; SalesCreditMemo)
                {
                    Caption = 'Sales Credit Memo';
                }
                field(SalesReturnOrder; SalesReturnOrder)
                {
                    Caption = 'Sales Return Order';
                }
                field(PostedSalesInvoice; PostedSalesInvoice)
                {
                    Caption = 'Posted Sales Invoice';
                }
                field(PostedSalesCrMemo; PostedSalesCrMemo)
                {
                    Caption = 'Posted Sales Credit Memo';
                }
                field(ShowMode; ShowMode)
                {
                    Caption = 'Show Mode';
                    Importance = Promoted;
                    OptionCaption = 'Header + Line,Header Only,Line Only';

                    trigger OnValidate();
                    begin
                        CurrPage.SalesInquirySubform.PAGE.ControlShowMode(ShowMode);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
            group(Group)
            {
                Caption = 'Header Field Filter';
                field(SelltoCustomerFilter; SelltoCustomerFilter)
                {
                    Caption = 'Sell-to Customer Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        CustomerList: Page "Customer List";
                    begin
                        CLEAR(CustomerList);
                        CustomerList.LOOKUPMODE(TRUE);
                        IF CustomerList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += CustomerList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                        CurrPage.UPDATE;
                    end;
                }
                field(BilltoCustomerFilter; BilltoCustomerFilter)
                {
                    Caption = 'Bill-to Customer Filter';

                    trigger OnLookup(var Text: Text): Boolean;

                    var
                        CustomerList: Page "Customer List";
                    begin
                        CLEAR(CustomerList);
                        CustomerList.LOOKUPMODE(TRUE);
                        IF CustomerList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += CustomerList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field(PostingDateFilter; PostingDateFilter)
                {
                    Caption = 'Posting Date Filter';

                    trigger OnValidate();
                    begin
                        ApplMgt.MakeDateFilter(PostingDateFilter);
                        SalesInqLine.SETFILTER("Posting Date", PostingDateFilter);
                        PostingDateFilter := SalesInqLine.GETFILTER("Posting Date");
                    end;
                }
                field(OrderDateFilter; OrderDateFilter)
                {
                    Caption = 'Order Date Filter';

                    trigger OnValidate();
                    begin
                        ApplMgt.MakeDateFilter(OrderDateFilter);
                        SalesInqLine.SETFILTER("Order Date", OrderDateFilter);
                        OrderDateFilter := SalesInqLine.GETFILTER("Order Date");
                    end;
                }
            }
            group("Line Field Filter")
            {
                Caption = 'Line Field Filter';
                field(GLAccFilter; GLAccFilter)
                {
                    Caption = 'G/L Account Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        GLAccList: Page "G/L Account List";
                    begin
                        CLEAR(GLAccList);
                        GLAccList.LOOKUPMODE(TRUE);
                        IF GLAccList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += GLAccList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field(ItemFilter; ItemFilter)
                {
                    Caption = 'Item Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ItemList: Page "Item List";
                    begin
                        CLEAR(ItemList);
                        ItemList.LOOKUPMODE(TRUE);
                        IF ItemList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += ItemList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field(ResourceFilter; ResourceFilter)
                {
                    Caption = 'Resource Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ResourceList: Page "Resource List";
                    begin
                        CLEAR(ResourceList);
                        ResourceList.LOOKUPMODE(TRUE);
                        IF ResourceList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += ResourceList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field(FAFilter; FAFilter)
                {
                    Caption = 'Fixed Asset Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        FAList: Page "Fixed Asset List";
                    begin
                        CLEAR(FAList);
                        FAList.LOOKUPMODE(TRUE);
                        IF FAList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += FAList.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field(ItemChargeFilter; ItemChargeFilter)
                {
                    Caption = 'Item Charge Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ItemCharge: Page "Item Charges";
                    begin
                        CLEAR(ItemCharge);
                        ItemCharge.LOOKUPMODE(TRUE);
                        IF ItemCharge.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Text += ItemCharge.GetSelectionFilter;
                            EXIT(TRUE);
                        END ELSE
                            EXIT(FALSE);
                    end;
                }
                field("ShowDummyLine"; ShowDummyLine)
                {
                    Caption = 'Show Zero Amount Line',
                                JPN = '金額が０の行を表示';
                }
            }
            part(SalesInquirySubform; 50019)
            {
            }
            group(Total)
            {
                Caption = 'Total',
                            JPN = '合計';
                field(TotalQty; TotalQty)
                {
                    BlankZero = true;
                    Caption = 'Total Quantity (Base)',
                                JPN = '合計数量 (基本単位)';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Importance = Promoted;
                }
                field(TotalAmount; TotalAmount)
                {
                    AutoFormatType = 1;
                    BlankZero = true;
                    Caption = 'Total Amount (LCY)',
                                JPN = '合計金額 (基本通貨)';
                    Editable = false;
                    Importance = Promoted;
                }
                field(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatType = 1;
                    BlankZero = true;
                    Caption = 'Total Amount Incl. VAT (LCY)',
                                JPN = '税込合計金額 (基本通貨)';
                    Editable = false;
                    Importance = Promoted;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions',
                            JPN = '機能(&U)';
                action("&Show Data")
                {
                    Caption = '&Show Data',
                                JPN = 'データ表示(&S)';
                    Image = ViewPage;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        Window.OPEN(Text000);
                        CurrPage.SalesInquirySubform.PAGE.SetIncludeTable(
                          SalesQuote, SalesOrder, SalesInvoice, SalesCreditMemo, SalesReturnOrder, PostedSalesInvoice, PostedSalesCrMemo);
                        CurrPage.SalesInquirySubform.PAGE.SetHeaderFilter(
                          SelltoCustomerFilter, BilltoCustomerFilter, PostingDateFilter, OrderDateFilter);
                        CurrPage.SalesInquirySubform.PAGE.SetLineFilter(
                          GLAccFilter, ItemFilter, ResourceFilter, FAFilter, ItemChargeFilter, ShowDummyLine);
                        CurrPage.SalesInquirySubform.PAGE.FindRecords(CurrGUID);
                        CurrPage.SalesInquirySubform.PAGE.GetTotalValue(TotalQty, TotalAmount, TotalAmountInclVAT);
                        Window.CLOSE;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("&Clear Data")
                {
                    Caption = '&Clear Data',
                                JPN = 'データ消去(&C)';
                    Image = List;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        SelltoCustomerFilter := '';
                        BilltoCustomerFilter := '';
                        PostingDateFilter := '';
                        OrderDateFilter := '';
                        GLAccFilter := '';
                        ItemFilter := '';
                        ResourceFilter := '';
                        FAFilter := '';
                        ItemChargeFilter := '';
                        TotalQty := 0;
                        TotalAmount := 0;
                        TotalAmountInclVAT := 0;
                        CurrPage.SalesInquirySubform.PAGE.ClearInquiryData(CurrGUID);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Select &All")
                {
                    Caption = 'Select &All',
                                JPN = '検索対象全設定(&A)';
                    Image = Registered;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        SalesQuote := TRUE;
                        SalesOrder := TRUE;
                        SalesInvoice := TRUE;
                        SalesCreditMemo := TRUE;
                        SalesReturnOrder := TRUE;
                        PostedSalesInvoice := TRUE;
                        PostedSalesCrMemo := TRUE;
                    end;
                }
                action("&Deselect All")
                {
                    Caption = '&Deselect All',
                                JPN = '検索対象全消去(&D)';
                    Image = Stop;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        SalesQuote := FALSE;
                        SalesOrder := FALSE;
                        SalesInvoice := FALSE;
                        SalesCreditMemo := FALSE;
                        SalesReturnOrder := FALSE;
                        PostedSalesInvoice := FALSE;
                        PostedSalesCrMemo := FALSE;
                    end;
                }
                action("ExportDatawithoutlot")
                {
                    Caption = 'Export Data without LN/SN', JPN = 'ロット/シリアル番号なしでエクスポート(&E)';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.PAGE.ExportDataToExcel(FALSE);
                    end;
                }
                action("ExportDatawithlot")
                {
                    Caption = 'Export &Data with LN/SN/Expiration Date', JPN = 'ロット/シリアル/有効期限付きエクスポート(&D)';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.PAGE.ExportDataToExcel(TRUE);
                    end;
                }
                action("SalesForceImportData")
                {
                    Caption = 'Sales Force Import Data',
                                JPN = 'Sales Force取り込み用データエクスポート';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.PAGE.ExportSFDataToExcel(FALSE);
                    end;
                }

            }
        }
    }

    trigger OnClosePage();
    begin
        SalesInqLine.RESET;
        SalesInqLine.SETRANGE(GUID, CurrGUID);//PBCWEST
        SalesInqLine.DELETEALL;
    end;

    trigger OnInit();
    begin
        PostedSalesInvoice := TRUE;
        PostedSalesCrMemo := TRUE;
        ShowDummyLine := true;
        CurrPage.SalesInquirySubform.PAGE.ControlShowMode(ShowMode);
    end;

    trigger OnOpenPage();
    begin
        PBCJPSetup.GET;
        IF NOT PBCJPSetup."Use Sales Inquiry" THEN
            JPCKFunc.ShowJpckFuncNotUsed;
        CurrGUID := CREATEGUID;
        SalesInqLine.RESET;
        SalesInqLine.SETCURRENTKEY("Creation Date"); //PBCWEST
        SalesInqLine.SETRANGE("Creation Date", TODAY - 3);
        IF NOT SalesInqLine.ISEMPTY THEN
            SalesInqLine.DELETEALL;

        SalesInqLine.RESET;
    end;

    var
        PBCJPSetup: Record "PBCJP Setup";
        SalesInqLine: Record "Sales Inquiry Line" temporary;
        JPCKFunc: Codeunit "NEB JPCK_Functions";
        ApplMgt: Codeunit "TextManagement";
        CurrGUID: Guid;
        SelltoCustomerFilter: Text;
        BilltoCustomerFilter: Text;
        PostingDateFilter: Text;
        OrderDateFilter: Text;
        GLAccFilter: Text;
        ItemFilter: Text;
        ResourceFilter: Text;
        FAFilter: Text;
        ItemChargeFilter: Text;
        NoFilterCount: Integer;
        ShowMode: Option "Header + Line","Header Only","Line Only";
        ShowDummyLine: Boolean;
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
        Window: Dialog;
        Text000: TextConst ENU = 'Now searching.\Please wait ...', JPN = '検索中。\お待ち下さい ・・・';
}

 */