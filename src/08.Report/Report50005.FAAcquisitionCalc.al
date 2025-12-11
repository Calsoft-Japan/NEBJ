report 50005 "FA Acquisition Calc"
{
    ProcessingOnly = true;
    Caption = '固定資産 - 取得情報計算';

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            trigger OnAfterGetRecord()
            var
                FACalc: Codeunit "FA Acquisition Calc";
            begin
                // 固定資産ごとに取得情報を再計算
                FACalc.UpdateAcquisitionInfo(FixedAsset."No.");
            end;
        }
    }

    trigger OnPreReport()
    begin
        if not Confirm(
            '固定資産の取得日・取得価額を再計算します。', false) then
            Error('キャンセルされました。');
    end;

    trigger OnPostReport()
    begin
        Message('固定資産の取得情報の再計算が完了しました。');
    end;
}
