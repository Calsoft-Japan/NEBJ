pageextension 50046 "Sales Order Subform EXT" extends "Sales Order Subform"
{
    layout
    {
        modify("No.")
        {
            StyleExpr = NoLineStyle;
        }

        modify(Quantity)
        {
            StyleExpr = QtyLineStyle;
        }

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
                StyleExpr = TempLineStyle;

                trigger OnValidate()
                begin
                    SetLineStyle();
                    CurrPage.Update(false);
                end;
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
        ReservEntry: Record "Reservation Entry";
        AssignedQty: Decimal;
    begin
        //Default
        NoLineStyle := 'Standard';
        TempLineStyle := 'Standard';
        QtyLineStyle := 'Standard';

        //Storage Temperature = -80℃ 
        if (Rec.StorageTemprature = '-80℃') or (Rec.StorageTemprature = '-80') then
            TempLineStyle := 'Attention';

        //Toxic-KBN = YES 
        if (Rec.Type = Rec.Type::Item) and ItemRec.Get(Rec."No.") then begin
            if ItemRec."Toxic-KBN" then
                NoLineStyle := 'Attention';
        end;

        //Unassigned Lot 
        if (Rec.Type = Rec.Type::Item) and (Rec.Quantity <> 0) then begin
            AssignedQty := 0;

            ReservEntry.Reset();
            ReservEntry.SetRange("Source Type", DATABASE::"Sales Line");
            ReservEntry.SetRange("Source Subtype", 1); // Sales Order
            ReservEntry.SetRange("Source ID", Rec."Document No.");
            ReservEntry.SetRange("Source Ref. No.", Rec."Line No.");
            ReservEntry.SetRange("Item No.", Rec."No.");

            if ReservEntry.FindSet() then
                repeat
                    AssignedQty += Abs(ReservEntry.Quantity);
                until ReservEntry.Next() = 0;

            if AssignedQty <> Abs(Rec.Quantity) then
                QtyLineStyle := 'Attention';
        end;
    end;

    var
        NoLineStyle: Text;
        TempLineStyle: Text;
        QtyLineStyle: Text;

}

