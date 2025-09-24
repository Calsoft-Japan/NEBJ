reportextension 51305 "Sales Ord Confirmation Ext" extends "Standard Sales - Order Conf."
{
    RDLCLayout = '.\ReportLayout\SalesOrderConfirmation_NEBJ.rdlc';

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
        }

        modify(Header)
        {
            trigger OnAfterPreDataItem()
            begin
                CompanyInfo2.Get();
            end;

        }

        // Use this section to add fields from Sales Line.

        // add(Line)
        // {
        //     column(LineDiscountAmount; "Line Discount Amount")
        //     {
        //     }
        // }

    }

    var
        CompanyInfo2: Record "Company Information";
}
