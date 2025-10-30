page 50003 "Item Groups2"
{
    Caption = 'アイテムグループ2';
    ApplicationArea = All;
    PageType = Card;
    SourceTable = 50003;

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

