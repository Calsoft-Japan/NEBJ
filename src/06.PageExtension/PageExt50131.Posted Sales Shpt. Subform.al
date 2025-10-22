pageextension 50131 pageextension70000003 extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("EndUser"; Rec."EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU Description"; Rec."EU Description")
            {
                Caption = 'エンドユーザー名';
            }
        }
    }
}

