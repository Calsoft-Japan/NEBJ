tableextension 50233 "Item Journal Batch Ext" extends "Item Journal Batch"
{
    fields
    {
<<<<<<< HEAD
        field(50000; "Default Gen. Bus. Posting Grp."; Code[20])
        {
            Caption = 'Default Gen. Bus. Posting Group';
        }
    }
}
=======
        field(50000; "Default Gen. Bus. Posting Gr."; Code[10])
        {
            Caption = '規定一般ビジネス転記グループ';
            TableRelation = "Gen. Business Posting Group";
        }

    }
}

>>>>>>> ea1acab7b1d3a7acc2510ffb63b92d0db251cd69
