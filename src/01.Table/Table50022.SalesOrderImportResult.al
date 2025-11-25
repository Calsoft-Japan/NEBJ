table 50022 "Sales Order Import Result"
{
    Caption = 'Sales Orer Import Result';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Order Source Code"; Text[30])
        {
            Caption = 'Order Source Code';
        }
        field(3; "Order Source Order No."; Text[30])
        {
            Caption = 'Order Source Order No.';
        }
        field(4; "Item Code"; Text[30])
        {
            Caption = 'Item Code';
        }
        field(5; "Quantity"; Text[30])
        {
            Caption = 'Quantity';
        }
        field(6; "Processing Date"; DateTime)
        {
            Caption = 'Processing Date';
        }
        field(7; "Status"; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Skip,Success';
            OptionMembers = Skip,Success;
        }
        field(8; "Error Comment"; Text[200])
        {
            Caption = 'Error Comment';
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(10; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(11; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(12; "Batch No."; Integer)
        {
            Caption = 'Batch No.';
        }
        field(13; "Import Line Count"; Integer)
        {
            Caption = 'Import Line Count';
        }
    }
}

