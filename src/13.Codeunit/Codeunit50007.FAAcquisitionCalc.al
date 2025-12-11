codeunit 50007 "FA Acquisition Calc"
{
    Subtype = Normal;
    procedure UpdateAcquisitionInfo(FANo: Code[20])
    var
        FixedAsset: Record "Fixed Asset";
        FALedger: Record "FA Ledger Entry";
        TotalAmount: Decimal;
        FirstDate: Date;
        IsFirst: Boolean;
    begin
        if not FixedAsset.Get(FANo) then
            exit;

        TotalAmount := 0;
        FirstDate := 0D;
        IsFirst := true;

        // 取得価額（Acquisition Cost）のみ対象
        FALedger.Reset();
        FALedger.SetRange("FA No.", FANo);
        FALedger.SetRange("Depreciation Book Code", 'DEFAULT');
        FALedger.SetRange("FA Posting Category", 0);
        FALedger.SetRange(
            "FA Posting Type",
            FALedger."FA Posting Type"::"Acquisition Cost");

        if FALedger.FindSet() then
            repeat
                // 取得価額 合計
                TotalAmount += FALedger.Amount;

                // 最古の取得日
                if IsFirst then begin
                    FirstDate := FALedger."Posting Date";
                    IsFirst := false;
                end else
                    if FALedger."Posting Date" < FirstDate then
                        FirstDate := FALedger."Posting Date";

            until FALedger.Next() = 0;

        // 値が変わる場合のみ更新
        if (FixedAsset."Acquisition Date" <> FirstDate) or
           (FixedAsset."Acquisition Cost" <> TotalAmount) then begin

            FixedAsset."Acquisition Date" := FirstDate;
            FixedAsset."Acquisition Cost" := TotalAmount;
            FixedAsset.Modify();
        end;
    end;
}
