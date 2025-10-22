pageextension 50148 pageextension70000052 extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("ShortcutDimCode7")
        {
            field("EndUser"; EndUser)
            {
                CaptionML = ENU = 'EndUser', JPN = 'エンドユーザー';
            }

            field("EU Description"; "EU Description")
            {
            }
            field("EU Division 1"; "EU Division 1")
            {
            }
            field("EU Division 2"; "EU Division 2")
            {
            }
            field("EU Division 3"; "EU Division 3")
            {
            }
            field("Description(Bikou)"; "Description(Bikou)")
            {
                Caption = '備考';
            }
            field("Description(Bikou2)"; "Description(Bikou2)")
            {
                Caption = '備考2';
            }
            field("ExternaDocumentNo."; "ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }
        }
    }
}

