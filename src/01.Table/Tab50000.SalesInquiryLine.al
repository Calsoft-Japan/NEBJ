table 50000 "Sales Inquiry Line"
{
    Caption = 'Sales Inquiry Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option) { OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order"; }
        field(2; "Document No."; Code[20]) { }
        field(3; "Line No."; Integer) { }
        field(4; "Sell-to Customer No."; Code[20]) { }
        field(5; "Bill-to Customer No."; Code[20]) { }
        field(6; "Bill-to Name"; Text[100]) { }
        field(7; "Bill-to Address"; Text[100]) { }
        field(8; "Your Reference"; Text[35]) { }
        field(9; "Ship-to Code"; Code[10]) { }
        field(10; "Ship-to Name"; Text[100]) { }
        field(11; "Ship-to Address"; Text[100]) { }
        field(12; "Order Date"; Date) { }
        field(13; "Posting Date"; Date) { }
        field(14; "Shipment Date (Hdr.)"; Date) { }
        field(15; "Posting Description"; Text[100]) { }
        field(16; "Payment Terms Code"; Code[10]) { }
        field(17; "Due Date"; Date) { }
        field(18; "Payment Discount ."; Decimal) { }
        field(19; "Pmt. Discount Date"; Date) { }
        field(20; "Shipment Method Code"; Code[10]) { }
        field(21; "Location Code (Hdr.)"; Code[10]) { }
        field(22; "Shortcut Dim. 1 Code (Hdr.)"; Code[20]) { }
        field(23; "Shortcut Dim. 2 Code (Hdr.)"; Code[20]) { }
        field(24; "Customer Posting Group"; Code[20]) { }
        field(25; "Currency Code (Hdr.)"; Code[10]) { }
        field(26; "Currency Factor"; Decimal) { }
        field(27; "Prices Including VAT"; Boolean) { }
        field(28; "Invoice Disc. Code"; Code[20]) { }
        field(29; "Language Code"; Code[10]) { }
        field(30; "Salesperson Code"; Code[20]) { }
        field(31; "Order No. (Hdr.)"; Code[20]) { }
        field(32; "Order Class"; Code[10]) { }
        field(33; "Comment"; Boolean) { }
        field(34; "No. Printed"; Integer) { }
        field(35; "On Hold"; Code[3]) { }
        field(36; "Applies-to Doc. Type"; Option) { OptionMembers = ,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund; }
        field(37; "Applies-to Doc. No."; Code[20]) { }
        field(38; "Bal. Account No."; Code[20]) { }
        field(39; "Ship"; Boolean) { }
        field(40; "Invoice"; Boolean) { }
        field(41; "Print Posted Documents"; Boolean) { }
        field(42; "Amount (Hdr.)"; Decimal) { }
        field(43; "Amount Including VAT (Hdr.)"; Decimal) { }
        field(44; "Shipping No."; Code[20]) { }
        field(45; "Posting No."; Code[20]) { }
        field(46; "Last Shipping No."; Code[20]) { }
        field(47; "Last Posting No."; Code[20]) { }
        field(48; "Prepayment No."; Code[20]) { }
        field(49; "Last Prepayment No."; Code[20]) { }
        field(50; "Prepmt. Cr. Memo No."; Code[20]) { }
        field(51; "Last Prepmt. Cr. Memo No."; Code[20]) { }
        field(52; "VAT Registration No."; Code[20]) { }
        field(53; "Combine Shipments"; Boolean) { }
        field(54; "Reason Code"; Code[10]) { }
        field(55; "EU 3-Party Trade"; Boolean) { }
        field(56; "VAT Country.Region Code"; Code[10]) { }
        field(57; "Sell-to Customer Name"; Text[100]) { }
        field(58; "Sell-to Address"; Text[100]) { }
        field(59; "Bill-to Post Code"; Code[20]) { }
        field(60; "Bill-to Country.Region Code"; Code[10]) { }
        field(61; "Sell-to Post Code"; Code[20]) { }
        field(62; "Sell-to Country.Region Code"; Code[10]) { }
        field(63; "Ship-to Post Code"; Code[20]) { }
        field(64; "Ship-to Country.Region Code"; Code[10]) { }
        field(65; "Bal. Account Type"; Option) { OptionMembers = "G/L Account","Bank Account"; }
        field(66; "Correction"; Boolean) { }
        field(67; "Document Date"; Date) { }
        field(68; "External Document No."; Code[35]) { }
        field(69; "Payment Method Code"; Code[10]) { }
        field(70; "Package Tracking No."; Text[30]) { }
        field(71; "No. Series"; Code[20]) { }
        field(72; "Posting No. Series"; Code[20]) { }
        field(73; "Shipping No. Series"; Code[20]) { }
        field(74; "Order No. Series"; Code[20]) { }
        field(75; "Pre-Assigned No."; Code[20]) { }
        field(76; "User ID"; Text[50]) { }
        field(77; "Source Code"; Code[10]) { }
        field(78; "Applies-to ID"; Text[50]) { }
        field(79; "VAT Base Discount ."; Decimal) { }
        field(80; "Status"; Option) { OptionMembers = Open,Released,"Pending Approval","Pending Prepayment"; }
        field(81; "Invoice Discount Calculation"; Option) { OptionMembers = None,"%",Amount; }
        field(82; "Invoice Discount Value"; Decimal) { }
        field(83; "Send IC Document"; Boolean) { }
        field(84; "IC Status"; Option) { OptionMembers = New,Pending,Sent; }
        field(85; "Sell-to IC Partner Code"; Code[20]) { }
        field(86; "Bill-to IC Partner Code"; Code[20]) { }
        field(87; "IC Direction"; Option) { OptionMembers = Outgoing,Incoming; }
        field(88; "Prepayment . (Hdr.)"; Decimal) { }
        field(89; "Prepayment No. Series"; Code[20]) { }
        field(90; "Compress Prepayment"; Boolean) { }
        field(91; "Prepayment Due Date"; Date) { }
        field(92; "Prepmt. Cr. Memo No. Series"; Code[20]) { }
        field(93; "Prepmt. Posting Description"; Text[100]) { }
        field(94; "Prepayment Invoice"; Boolean) { }
        field(95; "Prepayment Order No."; Code[20]) { }
        field(96; "Prepmt. Pmt. Discount Date"; Date) { }
        field(97; "Prepmt. Payment Terms Code"; Code[10]) { }
        field(98; "Prepmt. Payment Discount ."; Decimal) { }
        field(99; "Quote No."; Code[20]) { }
        field(100; "Job Queue Status"; Option) { OptionMembers = ,"Scheduled for Posting",Error,Posting; }
        field(101; "Job Queue Entry ID"; GUID) { }
        field(102; "Dimension Set ID (Hdr.)"; Integer) { }
        field(103; "Authorization Required"; Boolean) { }
        field(104; "Credit Card No."; Code[20]) { }
        field(105; "No. of Archived Versions"; Integer) { }
        field(106; "Doc. No. Occurrence"; Integer) { }
        field(107; "Campaign No."; Code[20]) { }
        field(108; "Sell-to Customer Template Code"; Code[10]) { }
        field(109; "Sell-to Contact No."; Code[20]) { }
        field(110; "Bill-to Contact No."; Code[20]) { }
        field(111; "Bill-to Customer Template Code"; Code[10]) { }
        field(112; "Opportunity No."; Code[20]) { }
        field(113; "Responsibility Center (Hdr.)"; Code[10]) { }
        field(114; "Shipping Advice"; Option) { OptionMembers = Partial,Complete; }
        field(115; "Shipped Not Invoiced (Hdr.)"; Boolean) { }
        field(116; "Completely Shipped (Hdr.)"; Boolean) { }
        field(117; "Posting from Whse. Ref."; Integer) { }
        field(118; "Requested Delivery Date (Hdr.)"; Date) { }
        field(119; "Promised Delivery Date (Hdr.)"; Date) { }
        field(120; "Shipping Time (Hdr.)"; DateFormula) { }
        field(121; "Late Order Shipping"; Boolean) { }
        field(122; "Receive"; Boolean) { }
        field(123; "Return Receipt No. (Hdr.)"; Code[20]) { }
        field(124; "Return Receipt No. Series"; Code[20]) { }
        field(125; "Last Return Receipt No."; Code[20]) { }
        field(126; "Return Order No."; Code[20]) { }
        field(127; "Return Order No. Series"; Code[20]) { }
        field(128; "Allow Line Disc. (Hdr.)"; Boolean) { }
        field(129; "Get Shipment Used"; Boolean) { }
        field(130; "Assigned User ID"; Text[50]) { }
        field(131; "Expiration Date"; Date) { }
        field(132; "VAT Rounding Type"; Option) { OptionMembers = Nearest,Up,Down; }
        field(133; "VAT Calc. per Line"; Boolean) { }
        field(134; "Bank Account No."; Code[20]) { }
        field(135; "Invoice Type"; Option) { OptionMembers = ,Sales,Receipt; }
        field(136; "For Collective Invoice"; Boolean) { }
        field(137; "Collective Invoice Code"; Option) { OptionMembers = ,Free,"5th","10th","15th","20th","25th","End of Month"; }
        field(138; "End User"; Code[10]) { }
        field(139; "Dealer 1"; Code[10]) { }
        field(140; "Dealer 2"; Code[10]) { }
        field(141; "Dealer 3"; Code[10]) { }
        field(142; "Type"; Option) { OptionMembers = ,"G/L Account",Item,Resource,"Fixed Asset","Charge (Item)"; }
        field(143; "No."; Code[20]) { }
        field(144; "Location Code"; Code[10]) { }
        field(145; "Posting Group"; Code[20]) { }
        field(146; "Shipment Date"; Date) { }
        field(147; "Description"; Text[100]) { }
        field(148; "Description 2"; Text[50]) { }
        field(149; "Unit of Measure"; Code[10]) { }
        field(150; "Quantity"; Decimal) { }
        field(151; "Outstanding Quantity"; Decimal) { }
        field(152; "Qty. to Invoice"; Decimal) { }
        field(153; "Qty. to Ship"; Decimal) { }
        field(154; "Unit Price"; Decimal) { }
        field(155; "Unit Cost (LCY)"; Decimal) { }
        field(156; "VAT ."; Decimal) { }
        field(157; "Line Discount ."; Decimal) { }
        field(158; "Line Discount Amount"; Decimal) { }
        field(159; "Amount"; Decimal) { }
        field(160; "Amount Including VAT"; Decimal) { }
        field(161; "Allow Invoice Disc."; Boolean) { }
        field(162; "Gross Weight"; Decimal) { }
        field(163; "Net Weight"; Decimal) { }
        field(164; "Units per Parcel"; Decimal) { }
        field(165; "Unit Volume"; Decimal) { }
        field(166; "Appl.-to Item Entry"; Integer) { }
        field(167; "Shortcut Dimension 1 Code"; Code[20]) { }
        field(168; "Shortcut Dimension 2 Code"; Code[20]) { }
        field(169; "Customer Price Group"; Code[10]) { }
        field(170; "Job No."; Code[20]) { }
        field(171; "Work Type Code"; Code[10]) { }
        field(172; "Outstanding Amount"; Decimal) { }
        field(173; "Qty. Shipped Not Invoiced"; Decimal) { }
        field(174; "Shipped Not Invoiced"; Decimal) { }
        field(175; "Quantity Shipped"; Decimal) { }
        field(176; "Quantity Invoiced"; Decimal) { }
        field(177; "Shipment No."; Code[20]) { }
        field(178; "Shipment Line No."; Integer) { }
        field(179; "Profit ."; Decimal) { }
        field(180; "Inv. Discount Amount"; Decimal) { }
        field(181; "Purchase Order No."; Code[20]) { }
        field(182; "Purch. Order Line No."; Integer) { }
        field(183; "Drop Shipment"; Boolean) { }
        field(184; "Gen. Bus. Posting Group"; Code[20]) { }
        field(185; "Gen. Prod. Posting Group"; Code[20]) { }
        field(186; "VAT Calculation Type"; Option) { OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax"; }
        field(187; "Transaction Type"; Code[10]) { }
        field(188; "Transport Method"; Code[10]) { }
        field(189; "Attached to Line No."; Integer) { }
        field(190; "Exit Point"; Code[10]) { }
        field(191; "Area"; Code[10]) { }
        field(192; "Transaction Specification"; Code[10]) { }
        field(193; "Tax Area Code"; Code[20]) { }
        field(194; "Tax Liable"; Boolean) { }
        field(195; "Tax Group Code"; Code[20]) { }
        field(196; "VAT Bus. Posting Group"; Code[20]) { }
        field(197; "VAT Prod. Posting Group"; Code[20]) { }
        field(198; "Currency Code"; Code[10]) { }
        field(199; "Outstanding Amount (LCY)"; Decimal) { }
        field(200; "Shipped Not Invoiced (LCY)"; Decimal) { }
        field(201; "Reserved Quantity"; Decimal) { }
        field(202; "Reserve"; Option) { OptionMembers = Never,Optional,Always; }
        field(203; "Blanket Order No."; Code[20]) { }
        field(204; "Blanket Order Line No."; Integer) { }
        field(205; "VAT Base Amount"; Decimal) { }
        field(206; "Unit Cost"; Decimal) { }
        field(207; "System-Created Entry"; Boolean) { }
        field(208; "Line Amount"; Decimal) { }
        field(209; "VAT Difference"; Decimal) { }
        field(210; "Inv. Disc. Amount to Invoice"; Decimal) { }
        field(211; "VAT Identifier"; Code[20]) { }
        field(212; "IC Partner Ref. Type"; Option) { OptionMembers = ,"G/L Account",Item,,,"Charge (Item)","Cross Reference","Common Item No."; }
        field(213; "IC Partner Reference"; Code[20]) { }
        field(214; "Prepayment ."; Decimal) { }
        field(215; "Prepmt. Line Amount"; Decimal) { }
        field(216; "Prepmt. Amt. Inv."; Decimal) { }
        field(217; "Prepmt. Amt. Incl. VAT"; Decimal) { }
        field(218; "Prepayment Amount"; Decimal) { }
        field(219; "Prepmt. VAT Base Amt."; Decimal) { }
        field(220; "Prepayment VAT ."; Decimal) { }
        field(221; "Prepmt. VAT Calc. Type"; Option) { OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax"; }
        field(222; "Prepayment VAT Identifier"; Code[20]) { }
        field(223; "Prepayment Tax Area Code"; Code[20]) { }
        field(224; "Prepayment Tax Liable"; Boolean) { }
        field(225; "Prepayment Tax Group Code"; Code[20]) { }
        field(226; "Prepmt Amt to Deduct"; Decimal) { }
        field(227; "Prepmt Amt Deducted"; Decimal) { }
        field(228; "Prepayment Line"; Boolean) { }
        field(229; "Prepmt. Amount Inv. Incl. VAT"; Decimal) { }
        field(230; "Prepmt. Amount Inv. (LCY)"; Decimal) { }
        field(231; "IC Partner Code"; Code[20]) { }
        field(232; "Prepmt. VAT Amount Inv. (LCY)"; Decimal) { }
        field(233; "Prepayment VAT Difference"; Decimal) { }
        field(234; "Prepmt VAT Diff. to Deduct"; Decimal) { }
        field(235; "Prepmt VAT Diff. Deducted"; Decimal) { }
        field(236; "Dimension Set ID"; Integer) { }
        field(237; "Qty. to Assemble to Order"; Decimal) { }
        field(238; "Qty. to Asm. to Order (Base)"; Decimal) { }
        field(239; "ATO Whse. Outstanding Qty."; Decimal) { }
        field(240; "ATO Whse. Outstd. Qty. (Base)"; Decimal) { }
        field(241; "Job Task No."; Code[20]) { }
        field(242; "Job Contract Entry No."; Integer) { }
        field(243; "Variant Code"; Code[10]) { }
        field(244; "Bin Code"; Code[20]) { }
        field(245; "Qty. per Unit of Measure"; Decimal) { }
        field(246; "Planned"; Boolean) { }
        field(247; "Unit of Measure Code"; Code[10]) { }
        field(248; "Quantity (Base)"; Decimal) { }
        field(249; "Outstanding Qty. (Base)"; Decimal) { }
        field(250; "Qty. to Invoice (Base)"; Decimal) { }
        field(251; "Qty. to Ship (Base)"; Decimal) { }
        field(252; "Qty. Shipped Not Invd. (Base)"; Decimal) { }
        field(253; "Qty. Shipped (Base)"; Decimal) { }
        field(254; "Qty. Invoiced (Base)"; Decimal) { }
        field(255; "Reserved Qty. (Base)"; Decimal) { }
        field(256; "FA Posting Date"; Date) { }
        field(257; "Depreciation Book Code"; Code[10]) { }
        field(258; "Depr. until FA Posting Date"; Boolean) { }
        field(259; "Duplicate in Depreciation Book"; Code[10]) { }
        field(260; "Use Duplication List"; Boolean) { }
        field(261; "Responsibility Center"; Code[10]) { }
        field(262; "Out-of-Stock Substitution"; Boolean) { }
        field(263; "Substitution Available"; Boolean) { }
        field(264; "Originally Ordered No."; Code[20]) { }
        field(265; "Originally Ordered Var. Code"; Code[10]) { }
        field(266; "Cross-Reference No."; Code[20]) { }
        field(267; "Unit of Measure (Cross Ref.)"; Code[10]) { }
        field(268; "Cross-Reference Type"; Option) { OptionMembers = ,Customer,Vendor,"Bar Code"; }
        field(269; "Cross-Reference Type No."; Text[30]) { }
        field(270; "Item Category Code"; Code[20]) { }
        field(271; "Nonstock"; Boolean) { }
        field(272; "Purchasing Code"; Code[10]) { }
        field(273; "Product Group Code"; Code[10]) { }
        field(274; "Special Order"; Boolean) { }
        field(275; "Special Order Purchase No."; Code[20]) { }
        field(276; "Special Order Purch. Line No."; Integer) { }
        field(277; "Whse. Outstanding Qty."; Decimal) { }
        field(278; "Whse. Outstanding Qty. (Base)"; Decimal) { }
        field(279; "Completely Shipped"; Boolean) { }
        field(280; "Requested Delivery Date"; Date) { }
        field(281; "Promised Delivery Date"; Date) { }
        field(282; "Shipping Time"; DateFormula) { }
        field(283; "Outbound Whse. Handling Time"; DateFormula) { }
        field(284; "Planned Delivery Date"; Date) { }
        field(285; "Planned Shipment Date"; Date) { }
        field(286; "Shipping Agent Code"; Code[10]) { }
        field(287; "Shipping Agent Service Code"; Code[10]) { }
        field(288; "Allow Item Charge Assignment"; Boolean) { }
        field(289; "Qty. to Assign"; Decimal) { }
        field(290; "Qty. Assigned"; Decimal) { }
        field(291; "Return Qty. to Receive"; Decimal) { }
        field(292; "Return Qty. to Receive (Base)"; Decimal) { }
        field(293; "Return Qty. Rcd. Not Invd."; Decimal) { }
        field(294; "Ret. Qty. Rcd. Not Invd.(Base)"; Decimal) { }
        field(295; "Return Rcd. Not Invd."; Decimal) { }
        field(296; "Return Rcd. Not Invd. (LCY)"; Decimal) { }
        field(297; "Return Qty. Received"; Decimal) { }
        field(298; "Return Qty. Received (Base)"; Decimal) { }
        field(299; "Appl.-from Item Entry"; Integer) { }
        field(300; "BOM Item No."; Code[20]) { }
        field(301; "Return Receipt No."; Code[20]) { }
        field(302; "Return Receipt Line No."; Integer) { }
        field(303; "Return Reason Code"; Code[10]) { }
        field(304; "Allow Line Disc."; Boolean) { }
        field(305; "Customer Disc. Group"; Code[20]) { }
        field(306; "Collective Invoice No."; Code[20]) { }
        field(307; "Collective Invoice Line No."; Integer) { }
        field(308; "For Reduced VAT"; Boolean) { }
        field(309; "Shortcut Dimension 3 Code"; Code[20]) { }
        field(310; "Shortcut Dimension 4 Code"; Code[20]) { }
        field(311; "Shortcut Dimension 5 Code"; Code[20]) { }
        field(312; "Shortcut Dimension 6 Code"; Code[20]) { }
        field(313; "Shortcut Dimension 7 Code"; Code[20]) { }
        field(314; "Shortcut Dimension 8 Code"; Code[20]) { }
        field(315; "Shortcut Dimension 1"; Code[20]) { }
        field(316; "Shortcut Dimension 2"; Code[20]) { }
        field(317; "Shortcut Dimension 3"; Code[20]) { }
        field(318; "Shortcut Dimension 4"; Code[20]) { }
        field(319; "Shortcut Dimension 5"; Code[20]) { }
        field(320; "Shortcut Dimension 6"; Code[20]) { }
        field(321; "Shortcut Dimension 7"; Code[20]) { }
        field(322; "Shortcut Dimension 8"; Code[20]) { }
        field(323; "Total Qty. (Base)"; Decimal) { }
        field(324; "Total Amount (LCY)"; Decimal) { }
        field(325; "Total Amount Incl. VAT (LCY)"; Decimal) { }
        field(326; "Cancelled"; Boolean) { }
    }
    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}

