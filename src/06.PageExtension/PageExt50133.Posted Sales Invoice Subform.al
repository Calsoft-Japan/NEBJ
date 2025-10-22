pageextension 50133 pageextension70000005 extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                Caption = '備考';
            }
            field(StorageTemprature; Rec.StorageTemprature)
            {
                Caption = '保管温度';
            }
        }
        addafter("Unit of Measure Code")
        {
            field("EndUser"; Rec."EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU Description"; Rec."EU Description")
            {
                Caption = 'エンドユーザー名';
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

