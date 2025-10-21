tableextension 50036 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50028; "Direct Shipping Code"; Code[20]) { }
        field(50029; "Delivery Time"; Text[20]) { }
        field(50030; "Sell-to Address 3"; Text[50]) { }
        field(50031; "Bill-to Address 3"; Text[50]) { }
        field(50032; "Ship-to Address 3"; Text[50]) { }
        field(50033; "Picking Advice"; Text[50]) { }
        field(50034; "Delivery Note Reference"; Text[50]) { }
        field(50035; "Description"; Text[20]) { }
    }
}

