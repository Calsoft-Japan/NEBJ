table 50000 "Sales Inquiry Line"
{
    Caption = 'Sales Inquiry Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)//Can find in FDD106
        {
            Caption = 'Document Type';
            OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order","Posted Invoice","Posted Credit Memo";
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Posted Invoice,Posted Credit Memo';
        }
        field(2; "Document No."; Code[20])//Can find in FDD106
        {
            Caption = 'Document No.';
        }
        field(3; "Line No."; Integer)//Can find in FDD106
        {
            Caption = 'Line No.';
        }
        field(4; "Sell-to Customer No."; Code[20])//Can find in FDD106
        {
            Caption = 'Sell-to Customer No.';
        }
        field(5; "Bill-to Customer No."; Code[20])//Can find in FDD106
        {
            Caption = 'Bill-to Customer No.';
        }
        field(6; "Bill-to Name"; Text[100])//Can find in FDD106
        {
            Caption = 'Bill-to Name';
        }
        field(9; "Ship-to Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Ship-to Code';
        }
        field(10; "Ship-to Name"; Text[100])//Can find in FDD106
        {
            Caption = 'Ship-to Name';
        }
        field(11; "Ship-to Address"; Text[100])//Can find in FDD106
        {
            Caption = 'Ship-to Address';
        }
        field(12; "Order Date"; Date)//Can find in FDD106
        {
            Caption = 'Order Date';
        }
        field(13; "Posting Date"; Date)//Can find in FDD106
        {
            Caption = 'Posting Date';
        }
        field(15; "Posting Description"; Text[100])//Can find in FDD106
        {
            Caption = 'Posting Description';
        }
        field(17; "Due Date"; Date)//Can find in FDD106
        {
            Caption = 'Due Date';
        }
        field(24; "Customer Posting Group"; Code[20])//Can find in FDD106
        {
            Caption = 'Customer Posting Group';
        }
        field(30; "Salesperson Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Salesperson Code';
        }
        field(54; "Reason Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Reason Code';
        }
        field(57; "Sell-to Customer Name"; Text[100])//Can find in FDD106
        {
            Caption = 'Sell-to Customer Name';
        }
        field(63; "Ship-to Post Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Ship-to Post Code';
        }
        field(67; "Document Date"; Date)//Can find in FDD106
        {
            Caption = 'Document Date';
        }
        field(68; "External Document No."; Code[35])//Can find in FDD106
        {
            Caption = 'External Document No.';
        }
        field(76; "User ID"; Text[50])//Can find in FDD106
        {
            Caption = 'User ID';
        }
        field(142; Type; Enum "Sales Line Type")//Can find in FDD106
        {
            Caption = 'Type';
        }
        field(143; "Item No."; Code[20])//Can find in FDD106
        {
            Caption = 'Item No.';
        }
        field(144; "Location Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Location Code';
        }
        field(146; "Shipment Date"; Date)//Can find in FDD106
        {
            Caption = 'Shipment Date';
        }
        field(147; Description; Text[100])//Can find in FDD106
        {
            Caption = 'Description';
        }
        field(148; "Description 2"; Text[100])//Can find in FDD106
        {
            Caption = 'Description 2';
        }
        field(149; "Unit of Measure"; Code[10])//Can find in FDD106
        {
            Caption = 'Unit of Measure';
        }
        field(150; "Quantity"; Decimal)//Can find in FDD106
        {
            Caption = 'Quantity';
        }
        field(152; "Qty. to Invoice"; Decimal)//Can find in FDD106
        {
            Caption = 'Qty. to Invoice';
        }
        field(153; "Qty. to Ship"; Decimal)//Can find in FDD106
        {
            Caption = 'Qty. to Ship';
        }
        field(154; "Unit Price"; Decimal)//Can find in FDD106
        {
            Caption = 'Unit Price';
        }
        field(155; "Unit Cost (LCY)"; Decimal)//Can find in FDD106
        {
            Caption = 'Unit Cost (LCY)';
        }
        field(156; "VAT %"; Decimal)//Can find in FDD106
        {
            Caption = 'VAT %';
        }
        field(157; "Line Discount %"; Decimal)//Can find in FDD106
        {
            Caption = 'Line Discount %';
        }
        field(158; "Line Discount Amount"; Decimal)//Can find in FDD106
        {
            Caption = 'Line Discount Amount';
        }
        field(159; "Amount"; Decimal)//Can find in FDD106
        {
            Caption = 'Amount';
        }
        field(160; "Amount Including VAT"; Decimal)//Can find in FDD106
        {
            Caption = 'Amount Including VAT';
        }
        field(162; "Gross Weight"; Decimal)//Can find in FDD106
        {
            Caption = 'Gross Weight';
        }
        field(163; "Net Weight"; Decimal)//Can find in FDD106
        {
            Caption = 'Net Weight';
        }
        field(167; "Shortcut Dimension 1 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 1 Code';
            CaptionClass = '1,2,1';
        }
        field(168; "Shortcut Dimension 2 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 2 Code';
            CaptionClass = '1,2,2';
        }
        field(170; "Job No."; Code[20])//Can find in FDD106
        {
            Caption = 'Job No.';
        }
        field(175; "Quantity Shipped"; Decimal)//Can find in FDD106
        {
            Caption = 'Quantity Shipped';
        }
        field(176; "Quantity Invoiced"; Decimal)//Can find in FDD106
        {
            Caption = 'Quantity Invoiced';
        }
        field(179; "Profit %"; Decimal)//Can find in FDD106
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
        }
        field(180; "Inv. Discount Amount"; Decimal)//Can find in FDD106
        {
            Caption = 'Inv. Discount Amount';
        }
        field(184; "Gen. Bus. Posting Group"; Code[20])//Can find in FDD106
        {
            Caption = 'Gen. Bus. Posting Group';
        }
        field(185; "Gen. Prod. Posting Group"; Code[20])//Can find in FDD106
        {
            Caption = 'Gen. Prod. Posting Group';
        }
        field(196; "VAT Bus. Posting Group"; Code[20])//Can find in FDD106
        {
            Caption = 'VAT Bus. Posting Group';
        }
        field(197; "VAT Prod. Posting Group"; Code[20])//Can find in FDD106
        {
            Caption = 'VAT Prod. Posting Group';
        }
        field(198; "Currency Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Currency Code';
        }
        field(201; "Reserved Quantity"; Decimal)//Can find in FDD106
        {
            Caption = 'Reserved Quantity';
        }
        field(243; "Variant Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Variant Code';
        }
        field(244; "Bin Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Bin Code';
        }
        field(247; "Unit of Measure Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Unit of Measure Code';
        }
        field(261; "Responsibility Center"; Code[10])//Can find in FDD106
        {
            Caption = 'Responsibility Center';
        }
        field(270; "Item Category Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Item Category Code';
        }
        field(273; "Product Group Code"; Code[10])//Can find in FDD106
        {
            Caption = 'Product Group Code';
        }
        field(280; "Requested Delivery Date"; Date)//Can find in FDD106
        {
            Caption = 'Requested Delivery Date';
        }
        field(281; "Promised Delivery Date"; Date)//Can find in FDD106
        {
            Caption = 'Promised Delivery Date';
        }
        field(284; "Planned Delivery Date"; Date)//Can find in FDD106
        {
            Caption = 'Planned Delivery Date';
        }
        field(285; "Planned Shipment Date"; Date)//Can find in FDD106
        {
            Caption = 'Planned Shipment Date';
        }
        field(309; "Shortcut Dimension 3 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 3 Code';
            CaptionClass = '1,2,3';
        }
        field(310; "Shortcut Dimension 4 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 4 Code';
            CaptionClass = '1,2,4';
        }
        field(311; "Shortcut Dimension 5 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 5 Code';
            CaptionClass = '1,2,5';
        }
        field(312; "Shortcut Dimension 6 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 6 Code';
            CaptionClass = '1,2,6';
        }
        field(313; "Shortcut Dimension 7 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 7 Code';
            CaptionClass = '1,2,7';
        }
        field(314; "Shortcut Dimension 8 Code"; Code[20])//Can find in FDD106
        {
            Caption = 'Shortcut Dimension 8 Code';
            CaptionClass = '1,2,8';
        }
        field(328; "Description(Bikou)"; Text[200])//Can find in FDD106
        {
            Caption = 'Description (Bikou)';
        }
        field(329; "StorageTemprature"; Text[20])//Can find in FDD106
        {
            Caption = 'Storage Temprature';
        }
        field(330; "ExternalDocumentNo."; Text[50])//Can find in FDD106
        {
            Caption = 'External Document No.';
        }
        field(332; "EU Description"; Text[50])//Can find in FDD106
        {
            Caption = 'EU Description';
        }
        field(335; "EU Division 1"; Text[100])//Can find in FDD106
        {
            Caption = 'EU Division 1';
        }
        field(336; "EU Division 2"; Text[100])//Can find in FDD106
        {
            Caption = 'EU Division 2';
        }
        field(337; "EU Division 3"; Text[100])//Can find in FDD106
        {
            Caption = 'EU Division 3';
        }
        field(338; "Customer Name 2"; Text[50])//Can find in FDD106
        {
            Caption = 'Customer Name 2';
        }
        field(339; "Item Category Description"; Text[50])//Can find in FDD106
        {
            Caption = 'Item Category Description';
        }
        field(340; "Product Group Description"; Text[50])//Can find in FDD106
        {
            Caption = 'Product Group Description';
        }
        field(341; "Customer Group"; Text[20])//Can find in FDD106
        {
            Caption = 'Customer Group';
        }
        field(342; "Customer Group Name"; Text[50])//Can find in FDD106
        {
            Caption = 'Customer Group Name';
        }
        field(343; "SerialNoType"; Text[10])//Can find in FDD106
        {
            Caption = 'Serial No. Type';
        }
        field(344; "SalesYear"; Integer)//Can find in FDD106
        {
            Caption = 'Sales Year';
        }
        field(345; "SalesMonth"; Integer)//Can find in FDD106
        {
            Caption = 'Sales Month';
        }
        field(346; "SalesQuater"; Text[10])//Can find in FDD106
        {
            Caption = 'Sales Quater';
        }
        field(347; "ItemToxicKBN"; Text[12])//Can find in FDD106
        {
            Caption = 'Item Toxic KBN';
        }
        field(348; "EndUser Group"; Text[30])//Can find in FDD106
        {
            Caption = 'EndUser Group';
        }
        field(349; "EndUser Group Name"; Text[50])//Can find in FDD106
        {
            Caption = 'EndUser Group Name';
        }
        field(351; "Item Description"; Text[100])//Can find in FDD106
        {
            Caption = 'Item Description';
        }
        field(350; "Creation Date"; Date)//New Field
        {
            Caption = 'Creation Date';
        }
        field(352; "EndUser"; Code[20])//Can find in FDD106
        {
            Caption = 'EndUser';
        }
        field(353; "Order Status"; Enum "Sales Document Status")//Can find in FDD106
        {
            Caption = 'Order Status';
        }
        field(355; GUID; GUID) //New Field
        {
            Caption = 'GUID';
        }
    }
    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}