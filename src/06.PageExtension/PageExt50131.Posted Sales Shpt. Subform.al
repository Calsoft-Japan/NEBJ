pageextension 50103 pageextension70000003 extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("EndUser"; "EndUser")
            {
                Caption = 'エンドユーザー';
            }
            field("EU Description"; "EU Description")
            {
                Caption = 'エンドユーザー名';
            }
        }
    }
}

