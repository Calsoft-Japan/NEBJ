pageextension 56628 "SalesReturnOrderArcSubform Ext" extends "Sales Return Order Arc Subform"
{
    layout
    {
        addafter(Nonstock)
        {
            field("Description(Bikou)"; Rec."Description(Bikou)")
            {
                ApplicationArea = All;
                Caption = '備考';
            }
            field(StorageTemprature; Rec."StorageTemprature")
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
        addafter("Line Discount Amount")
        {
            field("EndUser"; Rec."EndUser")
            {
                ApplicationArea = All;
                Caption = 'エンドユーザー';
            }
            field("EU Description"; Rec."EU Description")
            {
                ApplicationArea = All;
                Caption = 'エンドユーザー名';
            }
            field("EU Division 1"; Rec."EU Division 1")
            {
                ApplicationArea = All;
                Caption = 'エンドユーザ所属1';
            }
            field("EU Division 2"; Rec."EU Division 2")
            {
                ApplicationArea = All;
                Caption = 'エンドユーザ所属2';
            }
            field("EU Division 3"; Rec."EU Division 3")
            {
                ApplicationArea = All;
                Caption = 'エンドユーザ所属3';
            }
        }
    }
}

