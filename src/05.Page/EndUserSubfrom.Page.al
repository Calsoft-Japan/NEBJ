page 50000 "End User Subfrom"
{
    ApplicationArea = All;
    Caption = 'End User Subform';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(CustName; CustName)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    QuickEntry = false;
                }
                field(CustGroup; CustGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Group';
                    QuickEntry = false;
                }
                field(BlockOption; BlockOption)
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';
                    QuickEntry = false;
                }
                field(Division1; Division1)
                {
                    ApplicationArea = All;
                    Caption = 'Division 1';
                    QuickEntry = false;
                }
                field(Division2; Division2)
                {
                    ApplicationArea = All;
                    Caption = 'Division 2';
                    QuickEntry = false;
                }
                field(Division3; Division3)
                {
                    ApplicationArea = All;
                    Caption = 'Division 3';
                    QuickEntry = false;
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    QuickEntry = true;
                }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("City"; Rec."City") { ApplicationArea = All; }
                field("Division 1"; Rec."Division 1") { ApplicationArea = All; }
                field("Division 2"; Rec."Division 2") { ApplicationArea = All; }
                field("Division 3"; Rec."Division 3") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Search)
            {
                ApplicationArea = All;
                Caption = 'Search';
                Image = Find;
                ShortcutKey = 'F3';
                trigger OnAction()
                begin
                    Rec.SetFilter(Name, '*' + CustName + '*');
                    Rec.SetFilter("Division 1", '*' + Division1 + '*');
                    Rec.SetFilter("Division 2", '*' + Division2 + '*');
                    Rec.SetFilter("Division 3", '*' + Division3 + '*');
                    Rec.SetFilter(Blocked, SelectBlock(BlockOption));
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Search_Promoted; Search)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        BlockOption := BlockOption::ExclBlock;
        Rec.SetFilter(Name, '');
        Rec.SetFilter("Division 1", '');
        Rec.SetFilter("Division 2", '');
        Rec.SetFilter("Division 3", '');
        Rec.SetFilter(Blocked, SelectBlock(BlockOption));
    end;

    var
        CustName: Text[100];
        CustGroup: Text[20];
        Division1: Text[100];
        Division2: Text[100];
        Division3: Text[100];
        BlockOption: Enum "Block Option";

    procedure GetCurrentRecNo() SetCustNo: Code[20]
    begin
        SetCustNo := Rec."No.";
    end;

    local procedure SelectBlock(BlockValue: Enum "Block Option") SetValue: Text
    begin
        case BlockValue of
            BlockValue::ExclBlock:
                SetValue := ''' ''|Ship|Invoice';
            BlockValue::Ship:
                SetValue := ''' ''|Invoice';
            BlockValue::Invoice:
                SetValue := ''' ''|Ship';
            BlockValue::InclBlock:
                SetValue := ''' ''|Ship|Invoice|All';
            BlockValue::Shiponly:
                SetValue := 'Invoice';
            BlockValue::InvoiceOnly:
                SetValue := 'Ship';
            BlockValue::ExclOnly:
                SetValue := ''' ''';
        end;
    end;
}

