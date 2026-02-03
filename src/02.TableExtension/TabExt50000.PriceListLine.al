tableextension 50000 "Price List Line Ext" extends "Price List Line"
{
    fields
    {
        field(50000; EndUser; Code[20])
        {
            Caption = 'EndUser';
            TableRelation = Customer;
        }
        modify("Product No.")
        {
            TableRelation = if ("Asset Type" = const("Item Discount Group 2")) "Item Discount Group"
            else if ("Asset Type" = const("Item Discount Group 3")) "Item Discount Group";
        }
    }
}