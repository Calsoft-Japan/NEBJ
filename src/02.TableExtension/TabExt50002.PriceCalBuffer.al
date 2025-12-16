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
        field(50004; "NEBJ ShowAll"; Boolean)
        {
            Caption = 'ShowAll', Locked = true;
        }
    }
}