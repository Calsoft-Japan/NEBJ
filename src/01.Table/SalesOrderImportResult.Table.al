table 50022 "Sales Order Import Result"
{
    Caption = 'Sales Orer Import Result';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Order Source Code"; Text[30]) { }
        field(3; "Order Source Order No."; Text[30]) { }
        field(4; "Item Code"; Text[30]) { }
        field(5; "Quantity"; Text[30]) { }
        field(6; "Proccessing Date"; DateTime) { }
        field(7; "Status"; Option) { OptionMembers = Skip,Success; }
        field(8; "Error Comment"; Text[200]) { }
        field(9; "User ID"; Code[50]) { }
        field(10; "Document No."; Code[20]) { }
        field(11; "Line No."; Integer) { }
        field(12; "Batch No."; Integer) { }
        field(13; "Import Line Count"; Integer) { }
    }
}

