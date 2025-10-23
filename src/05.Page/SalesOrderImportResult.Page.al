page 50100 "Sales Order Import Result"
{
    Caption = 'Sales Order Import Result';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Order Import Result";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Batch No."; Rec."Batch No.") { ApplicationArea = All; }
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Proccessing Date"; Rec."Proccessing Date") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Error Comment"; Rec."Error Comment") { ApplicationArea = All; }
                field("Order Source Code"; Rec."Order Source Code") { ApplicationArea = All; }
                field("Order Source Order No."; Rec."Order Source Order No.") { ApplicationArea = All; }
                field("Item Code"; Rec."Item Code") { ApplicationArea = All; }
                field(Quantity; Rec.Quantity) { ApplicationArea = All; }
                field("Document No."; Rec."Document No.") { ApplicationArea = All; }
                field("Line No."; Rec."Line No.") { ApplicationArea = All; }
                field("User ID"; Rec."User ID") { ApplicationArea = All; }
            }
        }
    }
}