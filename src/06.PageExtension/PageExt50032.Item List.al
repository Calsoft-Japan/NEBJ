pageextension 50032 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field(ImportNewChemical; Rec."ImportNewChemical")
            {
                ApplicationArea = All;
                Caption = '輸入新規化学物質該当';
            }
            field(PRTR; Rec."PRTR")
            {
                ApplicationArea = All;
                Caption = 'PRTR法該当';
            }
            field(WorkLaw; Rec."WorkLaw")
            {
                ApplicationArea = All;
                Caption = '労安法該当';
            }
            field(AdditionalInformation1; Rec."AdditionalInformation1")
            {
                ApplicationArea = All;
                Caption = '備考1';
            }
            field("Shelf Life"; Rec."Shelf Life")
            {
                ApplicationArea = All;
                Caption = '消費期限';
            }
            field("Wholesales Rate"; Rec."Wholesales Rate")
            {
                ApplicationArea = All;
                Caption = '仕切り率 (テキストのみ)';
            }
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
                Caption = '在庫数量';
            }
            field("In-transit (Qty.)"; Rec."In-transit (Qty.)")
            {
                ApplicationArea = All;
                Caption = '検品待ち';
                DecimalPlaces = 0 : 0;
            }
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Inventory - Qty. on Sales Order"; InventoryDiff)
            {
                ApplicationArea = All;
                DecimalPlaces = 0 : 0;
                Caption = '在庫数量（在庫-受注残）';
            }
            field(AdditionalInformation2; Rec.AdditionalInformation2)
            {
                ApplicationArea = All;
                Caption = '備考2';
            }
            field(AdditionalInformation3; Rec.AdditionalInformation3)
            {
                ApplicationArea = All;
                Caption = '備考3';
            }

            field(AdditionalInformation4; Rec.AdditionalInformation4)
            {
                ApplicationArea = All;
                Caption = '備考4';
            }
            field(AdditionalInformation5; Rec.AdditionalInformation5)
            {
                ApplicationArea = All;
                Caption = '備考5';
            }
            field(AdditionalInformation6; Rec.AdditionalInformation6)
            {
                ApplicationArea = All;
                Caption = 'WEB在庫照会用備考1';
            }
            field(AdditionalInformation7; Rec.AdditionalInformation7)
            {
                ApplicationArea = All;
                Caption = 'WEB在庫照会用備考2';
            }
            field(AdditionalInformation8; Rec.AdditionalInformation8)
            {
                ApplicationArea = All;
                Caption = '備考8';
            }
        }
        addafter("Routing No.")
        {
            field(StorageTemp; Rec.StorageTemp)
            {
                ApplicationArea = All;
                Caption = '保管温度';
            }
            field(FullName; Rec.FullName)
            {
                ApplicationArea = All;
                Caption = '正式名称';
            }
            field("Campaigne URL"; Rec."Campaigne URL")
            {
                ApplicationArea = All;
                Caption = 'キャンペーン URL';
            }
            field(ShippingTemp; Rec.ShippingTemp)
            {
                ApplicationArea = All;
                Caption = '出荷温度';
            }
            field("Toxic-KBN"; Rec."Toxic-KBN")
            {
                ApplicationArea = All;
                Caption = '毒劇';
            }
            field(Volume; Rec.Volume)
            {
                ApplicationArea = All;
                Caption = '容量';
            }
        }
        addafter("Base Unit of Measure")
        {
            field("Campaine YN"; Rec."Campaine YN")
            {
                ApplicationArea = All;
                Caption = 'キャンペーン区分';
            }
            field(Size; Rec."Size")
            {
                ApplicationArea = All;
                Caption = 'サイズ';
            }
            field(MSDS; Rec."MSDS")
            {
                ApplicationArea = All;
                Caption = 'SDS';
            }
            field(Inspection; Rec."Inspection")
            {
                ApplicationArea = All;
                Caption = '検品除外品';
            }
            field(ProductDescription; Rec."ProductDescription")
            {
                ApplicationArea = All;
                Caption = '商品説明書';
            }
        }
        addafter("Item Category Code")
        {
            field(ItemCategoryDescription; ItemCategoryDescription)
            {
                ApplicationArea = All;
                Caption = 'アイテムカテゴリー名';
            }
            field(ItemCategoryParent; ItemCategoryParent)
            {
                ApplicationArea = All;
                Caption = '品目分類親コード（表示）';
            }
        }
        //modify("Replenishment System")
        //{
        //    ApplicationArea = All;
        //    OptionCaption = '仕入,生産オーダー, ';
        //}

    }
    actions
    {
    }



    var
        ItemCategoryDescription: Text[50];
        ItemCategory: Record "Item Category";
        ProductGroupDescription: Text[50];
        ItemCategoryParent: code[20];

    local procedure ItemCategoryCodeSearch()
    var
        itemCategory: Record "Item Category";
    begin
        itemCategory.SetRange(code, Rec."Item Category Code");

        if itemCategory.Findfirst() then begin
            ItemCategoryParent := itemCategory."Parent Category";
        end else BEGIN
            ItemCategoryParent := '';
        END;

        ItemCategoryDescription := '';
        ItemCategory.Reset();
        ItemCategory.SETRANGE(ItemCategory.Code, Rec."Item Category Code");
        if ItemCategory.FINDSET then
            ItemCategoryDescription := ItemCategory.Description;
    end;

    var
        InventoryDiff: Decimal;

    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields("Inventory", "Qty. on Sales Order");
        InventoryDiff := Rec."Inventory" - Rec."Qty. on Sales Order";

        ItemCategoryCodeSearch();
    end;
}

