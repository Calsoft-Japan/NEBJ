pageextension 50112 "Customer List Ext" extends "Customer List"
{
    layout
    {
        addafter("No.")
        {
            field("Head Office Code"; Rec."Head Office Code")
            {
                ApplicationArea = All;
                Caption = '本社コード';
            }
            field(Address; Address)
            {
            }
        }
        addafter(Name)
        {
            field(County; County)
            {
            }
            field(City; City)
            {
            }
            field("Address 2"; "Address 2")
            {
            }
            field("Name 2"; "Name 2")
            {
            }
        }
        addafter("Post Code")
        {
            field("Division 1"; Rec."Division 1")
            {
                ApplicationArea = All;
                Caption = '所属部署1';
            }
            field("Division 2"; Rec."Division 2")
            {
                ApplicationArea = All;
                Caption = '所属部署2';
            }
            field("Division 3"; Rec."Division 3")
            {
                ApplicationArea = All;
                Caption = '所属部署3';
            }
        }
        addafter("Shipping Advice")
        {
            field("Customer Group"; Rec."Customer Group")
            {
                trigger OnLookup(var Text: Text): Boolean
                var
                    CustomerTypePage: Page "Customer Type List";
                    CustomerType: Record "Customer Type";
                begin
                    CustomerTypePage.LOOKUPMODE := true;
                    if CustomerTypePage.RUNMODAL = ACTION::LookupOK then begin
                        CustomerTypePage.GETRECORD(CustomerType);
                        Rec.Validate("Customer Group", CustomerType.Code);
                    end;
                end;

            }

            //field(Address3; Rec.Address3)
            //{
            //Caption = '住所3';
            //}
        }

        addafter("Shipping Agent Code")
        {
            field("for Sales Information"; Rec."for Sales Information")
            {
                Caption = '即販情報取決め';
            }
            field(Sample; Rec.Sample)
            {
                Caption = 'サンプル試薬';
            }
            field(Customer; Rec.Customer)
            {
                Caption = '販売店';
            }
            field(Password; Rec.Password)
            {
                Caption = 'パスワード';
            }
            field("Name in English"; Rec."Name in English")
            {
                Caption = '英語名';
            }
            field("Order Source"; Rec."Order Source")
            {
                Caption = '発注先';
            }
            field("LDB_Kikan_CD"; Rec."LDB_Kikan_CD")
            {
                ApplicationArea = All;
                Caption = 'LDB_Kikan_CD';
            }
            field("LDB_Kikan_Name"; Rec."LDB_Kikan_Name")
            {
                ApplicationArea = All;
                Caption = 'LDB_Kikan_Name';
            }
            field("LDB_Soshiki_CD_Level1"; Rec."LDB_Soshiki_CD_Level1")
            {
                ApplicationArea = All;
                Caption = 'LDB_Soshiki_CD_Level1';
            }
            field("LDB_Soshiki_Name_Level1"; Rec."LDB_Soshiki_Name_Level1")
            {
                ApplicationArea = All;
                Caption = 'LDB_Soshiki_Name_Level1';
            }
            field("LDB_Soshiki_CD_Lowest"; Rec."LDB_Soshiki_CD_Lowest")
            {
                ApplicationArea = All;
                Caption = 'LDB_Soshiki_CD_Lowest';
            }
            field("LDB_Soshiki_Name_Lowest_Full"; Rec."LDB_Soshiki_Name_Lowest_Full")
            {
                ApplicationArea = All;
                Caption = 'LDB_Soshiki_Name_Lowest_Full';
            }
            field("LDB_Labo_Flg"; Rec."LDB_Labo_Flg")
            {
                ApplicationArea = All;
                Caption = 'LDB_Labo_Flg';
            }
        }
    }
}

