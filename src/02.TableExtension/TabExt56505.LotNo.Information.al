tableextension 56505 "Lot No. Information Ext" extends "Lot No. Information"
{
    fields
    {
        field(50001; "First Receiving Date"; Date) { Caption = '入荷検品日'; }
        field(50002; "Inspection Passed Date"; Date) { Caption = 'アッセイデート'; }
        field(50003; "Expiration Date"; Date)
        {
            Caption = '有効期限日付';
            FieldClass = FlowField;
            CalcFormula = Max("Item Ledger Entry"."Expiration Date" where(Positive = const(true), "Item No." = field("Item No."),
                              "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No."), "Location Code" = field("Location Filter")));
        }
    }
}

