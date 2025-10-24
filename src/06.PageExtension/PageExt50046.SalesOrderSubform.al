pageextension 50046 "Sales Order Subform EXT" extends "Sales Order Subform"
{
    layout
    {
        addafter(ShortcutDimCode8)
        {
            field(EU; Rec.EU)
            {
                ApplicationArea = All;
                trigger OnLookup(var Text: Text): Boolean
                var
                    EndUserSubform: Page "End User Subfrom";
                begin
                    Clear(EndUserSubform);
                    EndUserSubform.LookupMode(true);
                    if not (EndUserSubform.RunModal() = Action::LookupOK) then
                        exit(false)
                    else
                        Text := EndUserSubform.GetCurrentRecNo;
                    exit(true);
                end;
            }
            field("EU Description"; Rec."EU Description") { ApplicationArea = All; }
            field("EU Division 1"; Rec."EU Division 1") { ApplicationArea = All; }
            field("EU Division 2"; Rec."EU Division 2") { ApplicationArea = All; }
            field("EU Division 3"; Rec."EU Division 3") { ApplicationArea = All; }
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                ApplicationArea = All;
            }
            field("Description(Bikou2)"; Rec."Description(Bikou2)")
            {
                ApplicationArea = All;
            }
            field(StorageTemprature; Rec.StorageTemprature)
            {
                ApplicationArea = All;
                Caption = '保管温度';
            }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
            {
                ApplicationArea = All;
                Caption = '外部文書番号';
            }
        }
    }
}

