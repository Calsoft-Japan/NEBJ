pageextension 50131 "Posted Sales Shpt. Subform Ext" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
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
        }
    }
}

