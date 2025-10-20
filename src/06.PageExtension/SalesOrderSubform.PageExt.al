pageextension 50129 pageextension70000031 extends "Sales Order Subform"
{
    layout
    {
        addafter("ShortcutDimCode8")
        {
            field(EU; Rec.EU)
            {
                Caption = 'EndUser';
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
            field("EU Description"; Rec."EU Description") { }
            field("EU Division 1"; Rec."EU Division 1") { }
            field("EU Division 2"; Rec."EU Division 2") { }
            field("EU Division 3"; Rec."EU Division 3") { }
            field("Description(Bikou)"; Rec."Description(Bikou)") { }
            field("Description(Bikou2)"; Rec."Description(Bikou2)") { }
            field(StorageTemprature; Rec.StorageTemprature) { }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.") { }
        }
    }
}

