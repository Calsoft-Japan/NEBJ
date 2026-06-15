pageextension 50079 "Company Information Ext" extends "Company Information"
{
    layout
    {
        addafter("Use GLN in Electronic Document")
        {
            field("Web Inventory Inquiry News1"; Rec."Web Inventory Inquiry News1")
            {
                ApplicationArea = All;
                Caption = 'Web Inventory Inquiry News1';
                Editable = true;
            }
            field("Web Inventory Inquiry News2"; Rec."Web Inventory Inquiry News2")
            {
                ApplicationArea = All;
                Caption = 'Web Inventory Inquiry News2';
                Editable = true;
            }
            field("Web Inventory Inquiry News3"; Rec."Web Inventory Inquiry News3")
            {
                ApplicationArea = All;
                Caption = 'Web Inventory Inquiry News3';
                Editable = true;
            }
        }
    }
}