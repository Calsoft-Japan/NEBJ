pageextension 56628 pageextension70000049 extends "Sales Return Order Arc Subform"
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
            field("LotInformation"; "LotInformation")
            {
                Caption = 'ロット番号';
            }
        }
        addafter("Line Discount Amount")
        {
            field("EndUser"; "EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU"; "EU")
            {
                Caption = 'エンドユーザー';
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

