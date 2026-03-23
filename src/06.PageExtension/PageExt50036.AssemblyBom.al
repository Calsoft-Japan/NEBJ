pageextension 50036 "Asseembly BOM Ext" extends "Assembly BOM"
{
    layout
    {
        addafter(Description)
        {
            field("Parent Item No."; Rec."Parent Item No.") { ApplicationArea = All; }
            field("Line No."; Rec."Line No.") { ApplicationArea = All; }
            field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
            field("End Date"; Rec."End Date") { ApplicationArea = All; }
        }
    }
}