pageextension 50021 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            //field("Name 2"; "Name 2")
            //{
            //}
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
            field("Name in English"; Rec."Name in English")
            {
                ApplicationArea = All;
                Caption = '英語名';
            }
        }
        //addafter("Address 2")
        //{
        //    field(Address3; Rec."Address3")
        //    {
        //        ApplicationArea = All;
        //        Caption = '住所3';
        //    }
        //}
        addafter(ContactName)
        {
            field("Delivery Time"; Rec."Delivery Time")
            {
                ApplicationArea = All;
                Caption = '納品先配達時間指定';
            }
            field("No Delivery Slip Flag"; Rec."No Delivery Slip Flag")
            {
                ApplicationArea = All;
                Caption = '納品先送り状なし区分';
            }
            field("Chemi-logi Delivery Slip"; Rec."Chemi-logi Delivery Slip")
            {
                ApplicationArea = All;
                Caption = '送り状 ケミロジ';
            }
            field("Yamato Delivery Slip"; Rec."Yamato Delivery Slip")
            {
                ApplicationArea = All;
                Caption = '送り状 ヤマト';
            }
            field("Okurijo Nittsu for CS"; Rec."Okurijo Nittsu for CS")
            {
                ApplicationArea = All;
                Caption = '送り状 日通';
            }
            field("Delivery Slip Address"; Rec."Delivery Slip Address")
            {
                ApplicationArea = All;
                Caption = '送り状 得意先番号';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = '発注先';
            }
            field(WebCSV; Rec."WebCSV")
            {
                ApplicationArea = All;
                Caption = 'WebCSV';
            }
        }
        modify("Search Name")
        {
            Visible = true;
        }

        //        modify("VAT Calc. per Line")
        //        {
        //            Visible = true;
        //        }
        //        modify("VAT Rounding Type")
        //        {
        //            Visible = true;
        //        }

        addafter("Search Name")
        {
            field(NameTitle; Rec."NameTitle")
            {
                ApplicationArea = All;
                Caption = '敬称';
            }

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
        }
        addafter("Service Zone Code")
        {
            field("The number of Catalog"; Rec."The number of Catalog")
            {
                ApplicationArea = All;
                Caption = 'カタログ割付数';
            }
            field("ID"; Rec."ID2")
            {
                ApplicationArea = All;
                Caption = 'ID';
            }
            field("Password"; Rec."Password")
            {
                ApplicationArea = All;
                Caption = 'パスワード';
            }
            field("Online Order F"; Rec."Online Order F")
            {
                ApplicationArea = All;
                Caption = 'Online Order F';
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
        addafter("IC Partner Code")
        {
            //field("Telex No."; "Telex No.")
            //{
            //}
            field(ExternalCustomerID1; Rec."ExternalCustomerID1")
            {
                ApplicationArea = All;
                Caption = '外部顧客ID1';
            }
            field(ExternalCustomerID2; Rec."ExternalCustomerID2")
            {
                ApplicationArea = All;
                Caption = '外部顧客ID2';
            }
            field(ExternalCustomerID3; Rec."ExternalCustomerID3")
            {
                ApplicationArea = All;
                Caption = '外部顧客ID3';
            }
        }
        addafter("Copy Sell-to Addr. to Qte From")
        {
            field("Head Office Code"; Rec."Head Office Code")
            {
                ApplicationArea = All;
                Caption = '本社コード';
            }
            field("Payment Exception"; Rec."Payment Exception")
            {
                ApplicationArea = All;
                Caption = '支払例外メモ';
            }
            field("Email for Online Invoice"; Rec."Email for Online Invoice")
            {
                ApplicationArea = All;
                Caption = 'Email for Online Invoice';
            }
        }
    }
}

