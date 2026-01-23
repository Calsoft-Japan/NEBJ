tableextension 50002 "Price Cal. Buffer Ext" extends "Price Calculation Buffer"
{
    fields
    {
        field(50000; "NEBJ Customer No."; Code[20])
        {
            Caption = 'Customer No.', Locked = true;
        }
        field(50001; "NEBJ Contact No."; Code[20])
        {
            Caption = 'Contact No.', Locked = true;
        }
        field(50002; "NEBJ Cust. Disc. Grp."; Code[20])
        {
            Caption = 'Cust. Disc. Grp.', Locked = true;
        }
        field(50003; "NEBJ EndUser"; Code[20])
        {
            Caption = 'EndUser', Locked = true;
        }
        field(50004; "NEBJ Item No."; Code[20])
        {
            Caption = 'Item No.', Locked = true;
        }
        field(50005; "NEBJ Item Disc. Grp2"; Code[20])
        {
            Caption = 'Cust. Disc. Grp2', Locked = true;
        }
        field(50006; "NEBJ Item Disc. Grp3"; Code[20])
        {
            Caption = 'Cust. Disc. Grp3', Locked = true;
        }
    }
}