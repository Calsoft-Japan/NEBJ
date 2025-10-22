pageextension 50135 pageextension70000007 extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("Description(Bikou)"; Rec."Description(Bikou)")
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
        }
    }
}

