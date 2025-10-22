pageextension 50105 pageextension70000005 extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description(Bikou)"; "Description(Bikou)")
            {
                Caption = '備考';
            }
            field(StorageTemprature; StorageTemprature)
            {
                Caption = '保管温度';
            }
        }
        addafter("Unit of Measure Code")
        {
            field("EndUser"; "EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU Description"; "EU Description")
            {
                Caption = 'エンドユーザー名';
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

