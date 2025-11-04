tableextension 50037 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50002; "EndUser"; Code[10])
        {
            Caption = 'End User';
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Rec.EndUser <> '' then begin
                    if Customer.Get(EndUser) then;
                    "EU Description" := Customer.Name;
                    "EU Division 1" := Customer."Division 1";
                    "EU Division 2" := Customer."Division 2";
                    "EU Division 3" := Customer."Division 3";
                end;
            end;
        }
        field(50007; "EU"; Code[20])
        {
            Caption = 'End User';
        }
        field(50008; "Description(Bikou)"; Text[200])
        {
            Caption = 'Description (Bikou)';
        }
        field(50009; "StorageTemprature"; Text[20])
        {
            Caption = 'Storage Temprature';
        }
        field(50010; "ExternaDocumentNo."; Text[20])
        {
            Caption = 'Ext.Document No.';
        }
        field(50011; "LotInformation"; Code[20])
        {
            Caption = 'Lot Information';
        }
        field(50012; "EU Description"; Text[50])
        {
            Caption = 'EU Description';
        }
        field(50014; "End User Contact No."; Code[10])
        {
            Caption = 'End User Contact No.';
        }
        field(50015; "End User Contact Name"; Text[50])
        {
            Caption = 'End User Contact Name';
        }
        field(50016; "EU Division 1"; Text[100])
        {
            Caption = 'EU Division 1';
        }
        field(50017; "EU Division 2"; Text[100])
        {
            Caption = 'EU Division 2';
        }
        field(50018; "EU Division 3"; Text[100])
        {
            Caption = 'EU Division 3';
        }
        field(50019; "filler1"; Code[20])
        {
            Caption = 'Filler';
        }
        field(50020; "Description(Bikou2)"; Text[200])
        {
            Caption = 'Description (Bikou 2)';
        }
    }
}

