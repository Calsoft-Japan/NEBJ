pageextension 50135 pageextension70000007 extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                ApplicationArea = All;
                Caption = '備考';
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

