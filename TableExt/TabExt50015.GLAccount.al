tableextension 50015 "G/L Account Ext" extends "G/L Account"
{
    fields
    {

        field(50000; "Name 2"; Text[50]) { }
        field(50001; "Block Drill Down"; Boolean) { }
        field(50002; "Access Level"; Option) { OptionMembers = Common,Protected,Special; }

    }
}
