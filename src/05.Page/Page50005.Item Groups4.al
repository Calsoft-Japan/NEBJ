page 50005 "Item Groups4"
{
    Caption = 'アイテムグループ4';
    ApplicationArea = All;
    PageType = Card;
    SourceTable = 50005;

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

