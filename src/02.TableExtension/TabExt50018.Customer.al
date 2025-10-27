tableextension 50018 "Customer Ext" extends Customer
{
    fields
    {
        field(50000; "Use Post Code Master"; Boolean) { }
        field(50001; "NameTitle"; Text[50]) { }
        field(50002; "ContactTitle"; Text[50]) { }
        field(50003; "For Collective Invoice"; Boolean) { }
        field(50004; "Collective Invoice Code"; Option) { OptionMembers = "","Free","5th","10th","15th","20th","25th","End of Month"; }
        field(50005; "Invoice Issue Type"; Option) { OptionMembers = "",Print,Export,"Print+Export"; }
        field(50007; "VAT Rounding Type"; Option) { OptionMembers = Nearest,Up,Down; }
        field(50008; "VAT Calc. Per Line"; Boolean) { }
        field(50012; "Customer Group"; Text[20])
        {
            Caption = '顧客区分';
            TableRelation = "Customer Type";
        }
        field(50013; "Address3"; Text[50]) { }
        field(50014; "The number of Catalog"; Integer) { }
        field(50015; "Catalog Request"; Boolean) { }
        field(50016; "NEBExpressions Request"; Boolean) { }
        field(50017; "Enews Request"; Boolean) { }
        field(50018; "Data For President"; Boolean) { }
        field(50019; "for Sales Information"; Boolean) { }
        field(50020; "Macro"; Text[20]) { }
        field(50021; "Sample"; Boolean) { }
        field(50022; "Customer"; Text[20]) { }
        field(50023; "ID2"; Text[20]) { }
        field(50024; "Password"; Text[20]) { }
        field(50025; "Name in English"; Text[80]) { }
        field(50026; "Delivery Time"; Text[20]) { }
        field(50027; "No Delivery Slip Flag"; Boolean) { }
        field(50028; "No Delivery Slip No Add. Flag"; Boolean) { }
        field(50029; "Direct Shipping NDSF"; Boolean) { }
        field(50030; "Direct Shipping NDSNAF"; Boolean) { }
        field(50031; "Chemi-logi Delivery Slip"; Boolean) { }
        field(50032; "Yamato Delivery Slip"; Boolean) { }
        field(50033; "Delivery Slip Address"; Code[20]) { }
        field(50034; "Division 1"; Text[100]) { }
        field(50035; "Division 2"; Text[100]) { }
        field(50036; "Division 3"; Text[100]) { }
        field(50037; "Payment Exception"; Text[50]) { }
        field(50038; "Order Source"; Code[20]) { }
        field(50039; "Head Office Code"; Code[20]) { }
        field(50040; "ExternalCustomerID1"; Text[100]) { }
        field(50041; "ExternalCustomerID2"; Text[100]) { }
        field(50042; "ExternalCustomerID3"; Text[100]) { }
        field(50043; "WebCSV"; Boolean) { }
        field(50044; "Email for Online Invoice"; Text[30]) { }
        field(50045; "Okurijo Nittsu for CS"; Boolean) { }
        field(50046; "Online Order F"; Boolean) { }
        field(50047; "LDB_Kikan_CD"; Code[8]) { }
        field(50048; "LDB_Kikan_Name"; Text[50]) { }
        field(50049; "LDB_Soshiki_CD_Level1"; Code[8]) { }
        field(50050; "LDB_Soshiki_Name_Level1"; Text[60]) { }
        field(50051; "LDB_Soshiki_CD_Lowest"; Code[8]) { }
        field(50052; "LDB_Soshiki_Name_Lowest_Full"; Text[200]) { }
        field(50053; "LDB_Labo_Flg"; Code[1]) { }

    }
}
