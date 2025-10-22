pageextension 55160 pageextension70000038 extends "Sales Order Archive Subform"
{
    layout
    {
        addafter(Nonstock)
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
        addafter("VAT Prod. Posting Group")
        {
            field("EndUser"; "EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU"; "EU")
            {
                Caption = 'エンドユーザー';
            }
            field("LotInformation"; "LotInformation")
            {
                Caption = 'ロット番号';
            }
            field("EU Description"; "EU Description")
            {
                Caption = 'エンドユーザー名';
            }
            field("BOM Flag"; "BOM Flag")
            {
                Caption = 'セット区分';
            }
            field("EU Division 1"; "EU Division 1")
            {
                Caption = 'エンドユーザ所属1';
            }
            field("EU Division 2"; "EU Division 2")
            {
                Caption = 'エンドユーザ所属2';
            }
            field("EU Division 3"; "EU Division 3")
            {
                Caption = 'エンドユーザ所属3';
            }

        }
    }
}

