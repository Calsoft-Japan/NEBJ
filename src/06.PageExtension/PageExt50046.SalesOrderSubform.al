pageextension 50046 pageextension70000031 extends "Sales Order Subform"
{
    layout
    {
        addafter(ShortcutDimCode8)
        {
            field(EU; Rec.EU)
            {
                Caption = 'EndUser';
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
<<<<<<< HEAD:src/06.PageExtension/SalesOrderSubform.PageExt.al
            field("EU Description"; Rec."EU Description") { ApplicationArea = All; }
            field("EU Division 1"; Rec."EU Division 1") { ApplicationArea = All; }
            field("EU Division 2"; Rec."EU Division 2") { ApplicationArea = All; }
            field("EU Division 3"; Rec."EU Division 3") { ApplicationArea = All; }
            field("Description(Bikou)"; Rec."Description(Bikou)") { ApplicationArea = All; }
            field("Description(Bikou2)"; Rec."Description(Bikou2)") { ApplicationArea = All; }
            field(StorageTemprature; Rec.StorageTemprature) { ApplicationArea = All; }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.") { ApplicationArea = All; }
=======
            field("EU Description"; Rec."EU Description") { }
            field("EU Division 1"; Rec."EU Division 1") { }
            field("EU Division 2"; Rec."EU Division 2") { }
            field("EU Division 3"; Rec."EU Division 3") { }
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                Caption = '備考2';
            }
            field("Description(Bikou2)"; Rec."Description(Bikou2)")
            {
                Caption = '備考';
            }
            field(StorageTemprature; Rec.StorageTemprature)
            {
                Caption = '保管温度';
            }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }

>>>>>>> ecef8043e4d5b42a8d34e616f0c9427e62e70b2d:src/06.PageExtension/PageExt50046.SalesOrderSubform.al
        }
    }
}

