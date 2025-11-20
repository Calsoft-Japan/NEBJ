pageextension 50002 "Item Reclass. Jornal Ext" extends "Item Reclass. Journal"
{
    actions
    {
        addafter("&Print_Promoted")
        {
            actionref(ImportGoodsRcpt_Promoted; ImportGoodsRcpt) { }
        }
        addafter("&Print")
        {
            action(ImportGoodsRcpt)
            {
                ApplicationArea = All;
                Caption = 'Import Goods Receipt Insp. Data';
                Image = Import;
                RunObject = report "Import Goods Rcpt. Insp. Data";
            }
        }
    }
}