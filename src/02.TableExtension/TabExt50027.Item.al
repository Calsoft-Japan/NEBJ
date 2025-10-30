tableextension 50027 "Item Ext" extends Item
{
    fields
    {
        field(50001; "FullName"; Text[100]) { }
        field(50002; "StorageTemp"; Text[20]) { }
        field(50004; "Campaigne URL"; Text[100]) { }
        field(50005; "Toxic"; Text[30]) { }
        field(50006; "ShippingTemp"; Text[30]) { }
        field(50007; "Volume"; Text[30]) { }
        field(50008; "Campaine YN"; Boolean) { }
        field(50009; "MSDS"; Boolean) { }
        field(50010; "Size"; Text[10]) { }
        field(50011; "Inspection"; Boolean) { }
        field(50012; "ProductDescription"; Boolean) { }
        field(50013; "ImportNewChemical"; Boolean) { }
        field(50014; "PRTR"; Boolean) { }
        field(50015; "WorkLaw"; Boolean) { }
        field(50016; "AdditionalInformation1"; Text[100]) { }
        field(50017; "Inventory(Actual - Assigned)"; Decimal) { }
        field(50018; "AdditionalInformation2"; Text[100]) { }
        field(50019; "AdditionalInformation3"; Text[100]) { }
        field(50020; "AdditionalInformation4"; Text[100]) { }
        field(50021; "AdditionalInformation5"; Text[100]) { }
        field(50022; "AdditionalInformation6"; Text[100]) { }
        field(50023; "AdditionalInformation7"; Text[100]) { }
        field(50024; "AdditionalInformation8"; Text[100]) { }
        field(50027; "Shelf Life"; Text[10]) { }
        field(50028; "ItemGroup1"; Code[10])
        {
            Caption = 'アイテムグループ1';
        }
        field(50029; "ItemGroup2"; Code[10]) { }
        field(50030; "ItemGroup3"; Code[10]) { }
        field(50031; "ItemGroup4"; Code[10]) { }
        field(50032; "Specifications URL-D"; Code[10]) { }
        field(50033; "MSDS URL-D"; Code[10]) { }
        field(50034; "Poisonous URL -D"; Code[10]) { }
        field(50035; "Cartagena URL -D"; Code[10]) { }
        field(50036; "Specifications URL"; Text[100]) { }
        field(50037; "MSDS URL"; Text[400]) { }
        field(50038; "Poisonous URL"; Text[100]) { }
        field(50039; "Cartagena URL"; Text[100]) { }
        field(50040; "Cartagena"; Boolean) { }
        field(50041; "Toxic-KBN"; Boolean) { }
        field(50042; "Sample"; Boolean) { }
        field(50043; "Wholesales Rate"; Text[20]) { }
        field(50044; "Item not for Web"; Boolean) { }
        field(50045; "In-transit (Qty.)"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = FILTER(1),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            FieldClass = FlowField;
        }
        field(50050; "Item Disc. Group 2"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Discount Group";
        }
        field(50051; "Item Disc. Group 3"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Discount Group";
        }
        field(50052; "Disable All Item Discount"; Boolean) { }
        field(50053; "AdditionalInformation9"; Text[100]) { }
        field(50054; "AdditionalInformation10"; Text[100]) { }
        field(50055; "Okurijo Nittsu"; Boolean) { }
        field(50056; "Memo"; BLOB) { }
    }
}

