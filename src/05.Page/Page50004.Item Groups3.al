page 50004 "Item Groups3"
{
    Caption = 'アイテムグループ3';
    ApplicationArea = All;
    PageType = Card;
    SourceTable = 50004;

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

