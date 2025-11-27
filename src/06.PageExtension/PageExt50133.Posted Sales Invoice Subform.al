pageextension 50133 "PostedSalesInvoiceSubform Ext" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
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
        addafter("Unit of Measure Code")
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

