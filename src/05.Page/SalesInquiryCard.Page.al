page 50018 "Sales Inquiry Card"
{
    ApplicationArea = All;
    Caption = 'NEBJ Sales Inquiry';
    PageType = Document;
    UsageCategory = Tasks;
    DataCaptionExpression = '';

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
                        CurrPage.SalesInquirySubform.Page.ControlShowMode(ShowMode);
                        CurrPage.Update(false);
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
                        Clear(CustomerList);
                        CustomerList.LookupMode(true);
                        if CustomerList.RunModal() = Action::LookupOK then begin
                            Text += CustomerList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                        CurrPage.Update;
                    end;
                }
                field(BilltoCustomerFilter; BilltoCustomerFilter)
                {
                    Caption = 'Bill-to Customer Filter';

                    trigger OnLookup(var Text: Text): Boolean;

                    var
                        CustomerList: Page "Customer List";
                    begin
                        Clear(CustomerList);
                        CustomerList.LookupMode(true);
                        if CustomerList.RunModal() = Action::LookupOK then begin
                            Text += CustomerList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(PostingDateFilter; PostingDateFilter)
                {
                    Caption = 'Posting Date Filter';
                    trigger OnValidate();
                    begin
                        ApplMgt.MakeDateFilter(PostingDateFilter);
                        SalesInqLine.SetFilter("Posting Date", PostingDateFilter);
                        PostingDateFilter := SalesInqLine.GetFilter("Posting Date");
                    end;
                }
                field(OrderDateFilter; OrderDateFilter)
                {
                    Caption = 'Order Date Filter';
                    trigger OnValidate();
                    begin
                        ApplMgt.MakeDateFilter(OrderDateFilter);
                        SalesInqLine.SetFilter("Order Date", OrderDateFilter);
                        OrderDateFilter := SalesInqLine.GetFilter("Order Date");
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
                        Clear(GLAccList);
                        GLAccList.LookupMode(true);
                        if GLAccList.RunModal() = Action::LookupOK then begin
                            Text += GLAccList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(ItemFilter; ItemFilter)
                {
                    Caption = 'Item Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ItemList: Page "Item List";
                    begin
                        Clear(ItemList);
                        ItemList.LookupMode(true);
                        if ItemList.RunModal() = Action::LookupOK then begin
                            Text += ItemList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(ResourceFilter; ResourceFilter)
                {
                    Caption = 'Resource Filter';
                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ResourceList: Page "Resource List";
                    begin
                        Clear(ResourceList);
                        ResourceList.LookupMode(true);
                        if ResourceList.RunModal() = Action::LookupOK then begin
                            Text += ResourceList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(FAFilter; FAFilter)
                {
                    Caption = 'Fixed Asset Filter';
                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        FAList: Page "Fixed Asset List";
                    begin
                        Clear(FAList);
                        FAList.LookupMode(true);
                        if FAList.RunModal() = Action::LookupOK then begin
                            Text += FAList.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(ItemChargeFilter; ItemChargeFilter)
                {
                    Caption = 'Item Charge Filter';
                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ItemCharge: Page "Item Charges";
                    begin
                        Clear(ItemCharge);
                        ItemCharge.LookupMode(true);
                        if ItemCharge.RunModal() = Action::LookupOK then begin
                            Text += ItemCharge.GetSelectionFilter;
                            exit(true);
                        end else
                            exit(false);
                    end;
                }
                field(ShowDummyLine; ShowDummyLine)
                {
                    ApplicationArea = All;
                    Caption = 'Show Zero Amount Line';
                }
            }
            part(SalesInquirySubform; "Sales Inquiry Subform") { }
            group(Total)
            {
                Caption = 'Total';
                field(TotalQty; TotalQty)
                {
                    BlankZero = true;
                    Caption = 'Total Quantity (Base)';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Importance = Promoted;
                }
                field(TotalAmount; TotalAmount)
                {
                    AutoFormatType = 1;
                    BlankZero = true;
                    Caption = 'Total Amount (LCY)';
                    Editable = false;
                    Importance = Promoted;
                }
                field(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatType = 1;
                    BlankZero = true;
                    Caption = 'Total Amount Incl. VAT (LCY)';
                    Editable = false;
                    Importance = Promoted;
                }
            }
        }
    }

    Actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                Action(ShowData)
                {
                    Caption = 'Show Data';
                    Image = ViewPage;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        Window.Open(Text000);
                        CurrPage.SalesInquirySubform.Page.SetIncludeTable(
                          SalesQuote, SalesOrder, SalesInvoice, SalesCreditMemo, SalesReturnOrder, PostedSalesInvoice, PostedSalesCrMemo);
                        CurrPage.SalesInquirySubform.Page.SetHeaderFilter(
                          SelltoCustomerFilter, BilltoCustomerFilter, PostingDateFilter, OrderDateFilter);
                        CurrPage.SalesInquirySubform.Page.SetLineFilter(
                          GLAccFilter, ItemFilter, ResourceFilter, FAFilter, ItemChargeFilter, ShowDummyLine);
                        CurrPage.SalesInquirySubform.Page.FindRecords(CurrGUID);
                        CurrPage.SalesInquirySubform.Page.GetTotalValue(TotalQty, TotalAmount, TotalAmountInclVAT);
                        Window.Close();
                        CurrPage.Update(false);
                    end;
                }
                Action(ClearData)
                {
                    Caption = 'Clear Data';
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
                        CurrPage.SalesInquirySubform.Page.ClearInquiryData(CurrGUID);
                        CurrPage.Update(false);
                    end;
                }
                Action(SelectAll)
                {
                    Caption = 'Select All';
                    Image = Registered;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        SalesQuote := true;
                        SalesOrder := true;
                        SalesInvoice := true;
                        SalesCreditMemo := true;
                        SalesReturnOrder := true;
                        PostedSalesInvoice := true;
                        PostedSalesCrMemo := true;
                    end;
                }
                Action(DeselectAll)
                {
                    Caption = 'Deselect All';
                    Image = Stop;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        SalesQuote := false;
                        SalesOrder := false;
                        SalesInvoice := false;
                        SalesCreditMemo := false;
                        SalesReturnOrder := false;
                        PostedSalesInvoice := false;
                        PostedSalesCrMemo := false;
                    end;
                }
                Action(ExportDatawithoutLot)
                {
                    Caption = 'Export Data without LN/SN';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.Page.ExportDataToExcel(false);
                    end;
                }
                Action(ExportDatawithLot)
                {
                    Caption = 'Export Data with LN/SN/Expiration Date';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.Page.ExportDataToExcel(true);
                    end;
                }
                Action(SalesForceImportData)
                {
                    Caption = 'Sales Force Import Data';
                    Image = ExportToExcel;
                    Promoted = true;
                    PromotedIsBig = true;
                    trigger OnAction();
                    begin
                        CurrPage.SalesInquirySubform.Page.ExportSFDataToExcel(false);
                    end;
                }
            }
        }
    }

    trigger OnClosePage();
    begin
        SalesInqLine.Reset();
        SalesInqLine.SetRange(Guid, CurrGUID);
        SalesInqLine.DeleteAll();
    end;

    trigger OnInit();
    begin
        PostedSalesInvoice := true;
        PostedSalesCrMemo := true;
        ShowDummyLine := true;
        CurrPage.SalesInquirySubform.Page.ControlShowMode(ShowMode);
    end;

    trigger OnOpenPage();
    begin
        CurrGUID := CreateGuid();
        SalesInqLine.Reset();
        SalesInqLine.SetCurrentKey("Creation Date");
        SalesInqLine.SetRange("Creation Date", Today() - 3);
        if not SalesInqLine.IsEmpty then
            SalesInqLine.DeleteAll();
        SalesInqLine.Reset();
    end;

    var
        SalesInqLine: Record "Sales Inquiry Line" temporary;
        ApplMgt: Codeunit "Filter Tokens";
        ShowMode: Option "Header + Line","Header Only","Line Only";
        SelltoCustomerFilter: Text;
        BilltoCustomerFilter: Text;
        PostingDateFilter: Text;
        OrderDateFilter: Text;
        ItemChargeFilter: Text;
        ResourceFilter: Text;
        GLAccFilter: Text;
        ItemFilter: Text;
        FAFilter: Text;
        CurrGUID: Guid;
        NoFilterCount: Integer;
        TotalQty: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        ShowDummyLine: Boolean;
        SalesQuote: Boolean;
        SalesOrder: Boolean;
        SalesInvoice: Boolean;
        SalesCreditMemo: Boolean;
        SalesReturnOrder: Boolean;
        PostedSalesInvoice: Boolean;
        PostedSalesCrMemo: Boolean;
        Window: Dialog;
        Text000: Label 'Now searching.\Please wait ...';
}
