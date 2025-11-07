reportextension 51305 "Sales Ord Confirmation Ext" extends "Standard Sales - Order Conf."
{
    //RDLCLayout = '.\ReportLayout\SalesOrderConfirmation_NEBJ.rdlc';

    dataset
    {
        add(Header)
        {
            column(SellToName; Header."Sell-to Customer Name")
            {
            }
            column(SellToName2; Header."Sell-to Customer Name 2")
            {
            }
            column(SellToAddress; Header."Sell-to Address")
            {
            }
            column(SellToAddress2; Header."Sell-to Address 2")
            {
            }
            column(SellToPostCode; Header."Sell-to Post Code")
            {
            }
            column(CompanyName; CompanyInfo2."Name")
            {
            }
            column(CompanyFaxNo; CompanyInfo2."Fax No.")
            {
            }
            column(DirectShippingCode; Header."Direct Shipping Code")
            {
            }
            column(DirectShippingName; Customer2.Name)
            {
            }
            column(DirectShippingAddress; Customer2.Address)
            {
            }
        }

        modify(Header)
        {
            trigger OnAfterPreDataItem()
            begin
                CompanyInfo2.Get();
            end;

            trigger OnAfterAfterGetRecord()
            begin
                begin
                    if Header."Direct Shipping Code" <> '' then begin
                        if Customer2.Get(Header."Direct Shipping Code") then;
                    end else
                        Clear(Customer2);
                end;
            end;

        }

        // Use this section to add fields from Sales Line.

        add(Line)
        {
            // column(LineDiscountAmount; "Line Discount Amount")
            // {
            // }
            column(StorageTemp; "StorageTemprature")
            {
            }
            column(EU_Description; "EU Description")
            { }
            column(EU_Division_1; "EU Division 1")
            { }
            column(EU_Division_2; "EU Division 2")
            { }
            column(EU_Division_3; "EU Division 3")
            { }
            column(Description_Bikou_; "Description(Bikou)")
            { }
            column(Description_Bikou2_; "Description(Bikou2)")
            { }
            column(ExternaDocumentNo_; "ExternaDocumentNo.")
            { }
            column(Planned_Delivery_Date; "Planned Delivery Date")
            { }
            //2025-11-04
            column(ItemDescFromItem_Line; ItemDescFromItemTxt) { }
        }
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                SetItemDescFromItem(Line)
            end;
        }
    }

    var
        CompanyInfo2: Record "Company Information";
        Customer2: Record Customer;
        ItemRec: Record Item;
        ItemDescFromItemTxt: Text[100];

    local procedure SetItemDescFromItem(SalesLine: Record "Sales Line")
    begin
        Clear(ItemDescFromItemTxt);
        if SalesLine.Type = SalesLine.Type::Item then begin
            if ItemRec.Get(SalesLine."No.") then
                ItemDescFromItemTxt := ItemRec.Description      // ← from Item card
            else
                ItemDescFromItemTxt := '';                       // no item found
        end else
            ItemDescFromItemTxt := SalesLine.Description;        // keep text/GL lines readable
    end;
}