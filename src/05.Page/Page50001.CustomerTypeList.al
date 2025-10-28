page 50001 "Customer Type List"
{
    Caption = '顧客区分';
    ApplicationArea = All;
    PageType = Card;
    SourceTable = 50039;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec."Code")
                {
                }
                field("Customer Type Name"; Rec."Customer Type Name")
                {
                }
                field("Caption"; Rec."Caption")
                {
                }
            }
        }
    }
    actions
    {
    }
}

