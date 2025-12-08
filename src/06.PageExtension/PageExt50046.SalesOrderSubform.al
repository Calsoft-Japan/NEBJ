pageextension 50046 "Sales Order Subform EXT" extends "Sales Order Subform"
{
    layout
    {
        addafter(ShortcutDimCode8)
        {
            field(EndUser; Rec.EndUser)
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
                StyleExpr = LineStyle;
            }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
            {
                ApplicationArea = All;
                Caption = '外部文書番号';
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        SetLineStyle();
    end;

    local procedure SetLineStyle()
    var
        ItemRec: Record Item;
    begin
        LineStyle := 'Standard'; //Default

        if (Rec.Type = Rec.Type::Item) and ItemRec.Get(Rec."No.") then begin

            if ItemRec."Toxic-KBN" then
                LineStyle := 'Attention';

            if (Rec.StorageTemprature = '-80℃') or (Rec.StorageTemprature = '-80') then
                LineStyle := 'Strong';
        end;
    end;

    var
        LineStyle: Text;

}

