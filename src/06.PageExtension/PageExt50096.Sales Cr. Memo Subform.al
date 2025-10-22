pageextension 50096 pageextension70000052 extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("ShortcutDimCode7")
        {
            field("EndUser"; Rec.EndUser)
            {
                Caption = 'エンドユーザー';
            }

            field("EU Description"; Rec."EU Description")
            {
            }
            field("EU Division 1"; Rec."EU Division 1")
            {
            }
            field("EU Division 2"; Rec."EU Division 2")
            {
            }
            field("EU Division 3"; Rec."EU Division 3")
            {
            }
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                Caption = '備考';
            }
            field("Description(Bikou2)"; Rec."Description(Bikou2)")
            {
                Caption = '備考2';
            }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }
        }
    }
}

