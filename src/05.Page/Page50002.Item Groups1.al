page 50002 "Item Groups1"
{
    Caption = 'アイテムグループ1';
    ApplicationArea = All;
    PageType = Card;
    SourceTable = 50002;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;

                }
            }
        }

    }
}

