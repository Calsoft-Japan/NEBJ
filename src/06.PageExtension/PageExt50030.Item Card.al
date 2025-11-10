pageextension 50030 "Item Card Ext" extends "Item Card"
{
    layout
    {
        /*
        addafter("No.")
        {

            field(FullName; Rec.FullName)
            {
                ApplicationArea = All;
                Caption = '正式名称';
            }
        }
        */

        addafter("Description")
        {
            field("Wholesales Rate"; Rec."Wholesales Rate")
            {
                ApplicationArea = All;
                Caption = '仕切り率 (テキストのみ)';
            }
            field("Inventory - Qty. on Sales Order"; InventoryDiff)
            {
                ApplicationArea = All;
                DecimalPlaces = 0 : 0;
                Caption = '在庫数量（在庫-受注残）';
            }
            field(AdditionalInformation1; Rec."AdditionalInformation1")
            {
                ApplicationArea = All;
                Caption = '備考1';
            }
            field(AdditionalInformation2; Rec."AdditionalInformation2")
            {
                ApplicationArea = All;
                Caption = '備考2';
            }
            field(AdditionalInformation3; Rec."AdditionalInformation3")
            {
                ApplicationArea = All;
                Caption = '備考3';
            }

            field(AdditionalInformation4; Rec."AdditionalInformation4")
            {
                ApplicationArea = All;
                Caption = '備考4';
            }
            field(AdditionalInformation5; Rec."AdditionalInformation5")
            {
                ApplicationArea = All;
                Caption = '備考5';
            }
            field("Specifications URL"; Rec."Specifications URL")
            {
                ApplicationArea = All;
                Caption = '製品情報URL';
            }
            field("MSDS URL"; Rec."MSDS URL")
            {
                ApplicationArea = All;
                Caption = 'SDS URL';
            }
            field("Poisonous URL"; Rec."Poisonous URL")
            {
                ApplicationArea = All;
                Caption = '毒劇 URL';
            }
            field("Cartagena URL"; Rec."Cartagena URL")
            {
                ApplicationArea = All;
                Caption = 'カルタヘナ URL';
            }
            field("Campaigne URL"; Rec."Campaigne URL")
            {
                ApplicationArea = All;
                Caption = 'キャンペーン URL';
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
            field(AdditionalInformation9; Rec.AdditionalInformation9)
            {
                ApplicationArea = All;
                Caption = '備考9';
            }
            field(AdditionalInformation10; Rec.AdditionalInformation10)
            {
                ApplicationArea = All;
                Caption = '備考10';
            }
            field(Volume; Rec.Volume)
            {
                ApplicationArea = All;
                Caption = '容量';
            }
            field(Size; Rec."Size")
            {
                ApplicationArea = All;
                Caption = 'サイズ';
            }
            field(StorageTemp; Rec.StorageTemp)
            {
                ApplicationArea = All;
                Caption = '保管温度';
            }
            field(ShippingTemp; Rec.ShippingTemp)
            {
                ApplicationArea = All;
                Caption = '出荷温度';
            }
            field("Campaigne YN"; Rec."Campaine YN")
            {
                ApplicationArea = All;
                Caption = 'キャンペーン区分';
            }
            field(Inspection; Rec."Inspection")
            {
                ApplicationArea = All;
                Caption = '検品除外品';
            }
            field(Sample; Rec."Sample")
            {
                ApplicationArea = All;
                Caption = 'サンプル';
            }
            field(Cartagena; Rec."Cartagena")
            {
                ApplicationArea = All;
                Caption = 'カルタヘナ';
            }
            field("Toxic-KBN"; Rec."Toxic-KBN")
            {
                ApplicationArea = All;
                Caption = '毒劇';
            }
            field("Item not for Web"; Rec."Item not for Web")
            {
                ApplicationArea = All;
                Caption = 'WEB在庫照会除外品';
            }
            field("Shelf Life"; Rec."Shelf Life")
            {
                ApplicationArea = All;
                Caption = '消費期限';
            }
        }
        addafter("Item Disc. Group")
        {
            field("Item Disc. Group 2"; Rec."Item Disc. Group 2")
            {
                ApplicationArea = All;
                Caption = 'アイテム割引グループ2';
            }
            field("Item Disc. Group 3"; Rec."Item Disc. Group 3")
            {
                ApplicationArea = All;
                Caption = 'アイテム割引グループ3';
            }
            field("Disable All Item Discount"; Rec."Disable All Item Discount")
            {
                ApplicationArea = All;
                Caption = '全品目割引対象外';

            }

        }
        addafter("Automatic Ext. Texts")
        {

            field("ItemGroup1"; Rec."ItemGroup1")
            {
                ApplicationArea = All;
                Caption = 'JP Reporting Category 1';

                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemGroups1: Page "Item Groups1";
                    Item_Group1: Record "Item Group1";
                begin
                    //ItemDiscGroupPage.SetGroupNumber(3);
                    ItemGroups1.LOOKUPMODE := true;
                    //ItemGroups1.CAPTION := FieldCaption(Rec."ItemGroup1");
                    if ItemGroups1.RUNMODAL = ACTION::LookupOK then begin
                        ItemGroups1.GETRECORD(Item_Group1);
                        Rec."ItemGroup1" := Item_Group1.Code;
                    end;
                end;
            }
            field("ItemGroup2"; Rec."ItemGroup2")
            {
                ApplicationArea = All;
                Caption = 'アイテムグループ2';

                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemGroups2: Page "Item Groups2";
                    Item_Group2: Record "Item Group2";
                begin
                    //ItemDiscGroupPage.SetGroupNumber(3);
                    ItemGroups2.LOOKUPMODE := true;
                    //ItemGroups2.CAPTION := FIELDCAPTION(ItemGroup2);
                    if ItemGroups2.RUNMODAL = ACTION::LookupOK then begin
                        ItemGroups2.GETRECORD(Item_Group2);
                        Rec.ItemGroup2 := Item_Group2.Code;
                    end;
                end;
            }
            field("ItemGroup3"; Rec."ItemGroup3")
            {
                ApplicationArea = All;
                Caption = 'アイテムグループ3';

                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemGroups3: Page "Item Groups3";
                    Item_Group3: Record "Item Group3";
                begin
                    //ItemDiscGroupPage.SetGroupNumber(3);
                    ItemGroups3.LOOKUPMODE := true;
                    //ItemGroups3.CAPTION := FIELDCAPTION(ItemGroup3);
                    if ItemGroups3.RUNMODAL = ACTION::LookupOK then begin
                        ItemGroups3.GETRECORD(Item_Group3);
                        Rec."ItemGroup3" := Item_Group3.Code;
                    end;
                end;
            }
            field("ItemGroup4"; Rec."ItemGroup4")
            {
                ApplicationArea = All;
                Caption = 'アイテムグループ4';

                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemGroups4: Page "Item Groups3";
                    Item_Group4: Record "Item Group3";
                begin
                    //ItemDiscGroupPage.SetGroupNumber(3);
                    ItemGroups4.LOOKUPMODE := true;
                    //ItemGroups4.CAPTION := FIELDCAPTION(ItemGroup4);
                    if ItemGroups4.RUNMODAL = ACTION::LookupOK then begin
                        ItemGroups4.GETRECORD(Item_Group4);
                        Rec."ItemGroup4" := Item_Group4.Code;
                    end;
                end;
            }

            group(MemoGroup)
            {
                Caption = 'メモ';
                field("Memo"; MemoGroup)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    MultiLine = true;
                    ShowCaption = false;
                    ToolTip = 'この品目に追加したいメモを記載。';

                    trigger OnValidate()
                    begin
                        SetMemoGroup(MemoGroup);
                    end;
                }
            }


        }

        addbefore("Item Category Code")
        {
            field(ItemCategoryParent; ItemCategoryParent)
            {
                Caption = '品目分類親コード（表示）';
                ApplicationArea = All;
                Editable = false;
            }
        }

        modify("Item Category Code")
        {
            trigger OnAfterValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                // 親カテゴリを検索してセット
                ItemCategoryParent := '';

                if Rec."Item Category Code" <> '' then begin
                    if ItemCategory.Get(Rec."Item Category Code") then
                        ItemCategoryParent := ItemCategory."Parent Category";
                end;
            end;
        }

    }

    var
        InventoryDiff: Decimal;
        MemoGroup: Text;
        ItemCategoryParent: Code[20];
        ItemCategory: Record "Item Category";


    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields("Inventory", "Qty. on Sales Order");
        InventoryDiff := Rec."Inventory" - Rec."Qty. on Sales Order";

        MemoGroup := GetMemoGroup();

        ItemCategoryParent := '';
        if Rec."Item Category Code" <> '' then
            if ItemCategory.Get(Rec."Item Category Code") then
                ItemCategoryParent := ItemCategory."Parent Category";
    end;

    procedure SetMemoGroup(NewMemoGroup: Text)
    var
        OutStream: OutStream;
    begin
        Rec."Memo".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewMemoGroup);

        Rec.Modify();
    end;

    procedure GetMemoGroup(): Text
    var
        InStream: InStream;
        TempText: Text;
    begin
        TempText := '';
        Rec."Memo".CreateInStream(InStream, TEXTENCODING::UTF8);
        InStream.ReadText(TempText);
        exit(TempText);
    end;
}


