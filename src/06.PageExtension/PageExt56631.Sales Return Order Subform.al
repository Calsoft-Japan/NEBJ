pageextension 56631 pageextension70000050 extends "Sales Return Order Subform"
{
    layout
    {
        addafter("Cross-Reference No.")
        {
            field("EndUser"; "EndUser")
            {
                CaptionML = 'エンドユーザー';
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
            }
            field("ExternaDocumentNo."; "ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }
        }
    }
}

