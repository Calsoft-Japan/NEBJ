pageextension 50135 pageextension70000007 extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("Description(Bikou)"; "Description(Bikou)")
            {
                Caption = '備考';
            }
            field(StorageTemprature; StorageTemprature)
            {
                Caption = '保管温度';
            }
            field("ExternaDocumentNo."; "ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }
        }
    }
}

