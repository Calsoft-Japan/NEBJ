pageextension 56628 pageextension70000049 extends "Sales Return Order Arc Subform"
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
            field("LotInformation"; Rec."LotInformation")
            {
                Caption = 'ロット番号';
            }
        }
        addafter("Line Discount Amount")
        {
            field("EndUser"; Rec."EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU"; Rec."EU")
            {
                Caption = 'エンドユーザー';
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

