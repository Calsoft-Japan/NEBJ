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
                field(CustNo; CustNo)
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    QuickEntry = false;
                }
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
                field("Customer Group"; Rec."Customer Group") { ApplicationArea = All; }
                field("City"; Rec."City") { ApplicationArea = All; }
                field("Division 1"; Rec."Division 1") { ApplicationArea = All; }
                field("Division 2"; Rec."Division 2") { ApplicationArea = All; }
                field("Division 3"; Rec."Division 3") { ApplicationArea = All; }
                field(Blocked; Rec.Blocked) { ApplicationArea = All; }
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
                    ApplyPageFilters();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        InitPageFilters();
    end;

    var
        CustNo: Text[20];
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

    local procedure InitPageFilters()
    begin
        BlockOption := BlockOption::ExclBlock;
        Rec.SetFilter("No.", '');
        Rec.SetFilter(Name, '');
        Rec.SetFilter("Customer Group", '');
        Rec.SetFilter("Division 1", '');
        Rec.SetFilter("Division 2", '');
        Rec.SetFilter("Division 3", '');
        Rec.SetFilter(Blocked, SetBlockOpt(BlockOption.AsInteger()));
    end;

    local procedure ApplyPageFilters()
    begin
        if CustNo = '' then begin
            Rec.SetFilter("No.", '*' + CustNo + '*');
            Rec.SetFilter(Name, '*' + CustName + '*');
            Rec.SetFilter("Customer Group", '*' + CustGroup + '*');
            Rec.SetFilter("Division 1", '*' + Division1 + '*');
            Rec.SetFilter("Division 2", '*' + Division2 + '*');
            Rec.SetFilter("Division 3", '*' + Division3 + '*');
            //Rec.SetFilter(Blocked, SetBlockOpt(BlockOption.AsInteger()));
            case BlockOption of
                BlockOption::ExclOnly:
                    Rec.SetFilter(Blocked, ''' ''');
                BlockOption::ExclBlock:
                    Rec.SetFilter(Blocked, ''' ''|Ship|Invoice');
                BlockOption::InclBlock:
                    Rec.SetFilter(Blocked, ''' ''|Ship|Invoice|All');
                BlockOption::Ship:
                    Rec.SetFilter(Blocked, ''' ''|Invoice');
                BlockOption::ShipOnly:
                    Rec.SetFilter(Blocked, 'Invoice');
                BlockOption::Invoice:
                    Rec.SetFilter(Blocked, ''' ''|Ship');
                BlockOption::InvoiceOnly:
                    Rec.SetFilter(Blocked, 'Ship');
            end;
        end;
    end;

    local procedure SetBlockOpt(BlockValue: Option ExclBlock,Ship,Invoice,Shiponly,InvoiceOnly,ExclOnly,InclBlock) SetValue: Text
    begin
        case BlockValue of
            BlockValue::ExclOnly:
                SetValue := ''' ''';
            BlockValue::ExclBlock:
                SetValue := ''' ''|Ship|Invoice';
            BlockValue::InclBlock:
                SetValue := ''' ''|Ship|Invoice|All';
            BlockValue::Ship:
                SetValue := ''' ''|Invoice';
            BlockValue::Shiponly:
                SetValue := 'Invoice';
            BlockValue::Invoice:
                SetValue := ''' ''|Ship';
            BlockValue::InvoiceOnly:
                SetValue := 'Ship';
        end;
    end;
}

