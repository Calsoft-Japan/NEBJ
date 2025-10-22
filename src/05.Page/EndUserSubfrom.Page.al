page 50000 "End User Subfrom"
{
    Caption = 'End User Subform';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field(CustName; CustName)
            {
                Caption = 'Customer Name';
                QuickEntry = false;
            }
            field(CustGroup; CustGroup)
            {
                Caption = 'Customer Group';
                QuickEntry = false;
            }
            field(BlockOption; BlockOption)
            {
                Caption = 'Blocked';
                QuickEntry = false;
            }
            field(Division1; Division1)
            {
                Caption = 'Division 1';
                QuickEntry = false;
            }
            field(Division2; Division2)
            {
                Caption = 'Division 2';
                QuickEntry = false;
            }
            field(Division3; Division3)
            {
                Caption = 'Division 3';
                QuickEntry = false;
            }
            repeater(Group)
            {
                field("No."; Rec."No.") { QuickEntry = true; }
                field(Name; Rec.Name) { }
                field("City"; Rec."City") { }
                field("Division 1"; Rec."Division 1") { }
                field("Division 2"; Rec."Division 2") { }
                field("Division 3"; Rec."Division 3") { }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Search)
            {
                Caption = 'Search';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
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

