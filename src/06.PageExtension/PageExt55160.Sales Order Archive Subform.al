pageextension 55160 pageextension70000038 extends "Sales Order Archive Subform"
{
    layout
    {
        addafter(Nonstock)
        {
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                Caption = '備考';
            }
            field(StorageTemprature; Rec."StorageTemprature")
            {
                Caption = '保管温度';
            }
            field("ExternaDocumentNo."; Rec."ExternaDocumentNo.")
            {
                Caption = '外部文書番号';
            }
        }
        addafter("VAT Prod. Posting Group")
        {
            field("EndUser"; Rec."EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU"; Rec."EU")
            {
                Caption = 'エンドユーザー';
            }
            field("LotInformation"; Rec."LotInformation")
            {
                Caption = 'ロット番号';
            }
            field("EU Description"; Rec."EU Description")
            {
                Caption = 'エンドユーザー名';
            }
            field("BOM Flag"; Rec."BOM Flag")
            {
                Caption = 'セット区分';
            }
            field("EU Division 1"; Rec."EU Division 1")
            {
                Caption = 'エンドユーザ所属1';
            }
            field("EU Division 2"; Rec."EU Division 2")
            {
                Caption = 'エンドユーザ所属2';
            }
            field("EU Division 3"; Rec."EU Division 3")
            {
                Caption = 'エンドユーザ所属3';
            }

        }
    }
}

