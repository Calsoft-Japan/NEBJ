tableextension 50233 "Item Journal Batch Ext" extends "Item Journal Batch"
{
    fields
    {
        field(50000; "Default Gen. Bus. Posting Gr."; Code[10])
        {
            Caption = '規定一般ビジネス転記グループ';
            TableRelation = "Gen. Business Posting Group";
        }

    }
}

