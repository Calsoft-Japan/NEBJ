tableextension 50115 "Sales Cr.Memo Line Ext" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50002; "EndUser"; Code[10]) { }
        field(50007; "EU"; Code[10]) { }
        field(50008; "Description(Bikou)"; Text[200]) { }
        field(50009; "StorageTemprature"; Text[20]) { }
        field(50010; "ExternaDocumentNo."; Text[20]) { }
        field(50011; "LotInformation"; Code[20]) { }
        field(50012; "EU Description"; Text[50]) { }
        field(50016; "EU Division 1"; Text[100]) { }
        field(50017; "EU Division 2"; Text[100]) { }
        field(50018; "EU Division 3"; Text[100]) { }
        field(50019; "Filler"; Code[20]) { }
        field(50020; "Description(Bikou2)"; Text[200]) { }
    }
}

