pageextension 50108 "Posted Purchase Receipt Ext" extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Buy-from Contact")
        {
            field("CI Number"; Rec."CI Number")
            {
                ApplicationArea = All;
                Caption = '仕入先請求書番号';
            }
        }
    }
}

