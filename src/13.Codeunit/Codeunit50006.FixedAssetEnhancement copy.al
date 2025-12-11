codeunit 50006 "Fixed Asset Enhancement"
{
    Subtype = Normal;

    // Auto Update
    [EventSubscriber(ObjectType::Table, Database::"FA Ledger Entry", 'OnAfterInsertEvent', '', true, true)]
    procedure OnAfterInsertFALedger(var Rec: Record "FA Ledger Entry")
    begin
        UpdateAcquisitionInfo(Rec."FA No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"FA Ledger Entry", 'OnAfterModifyEvent', '', true, true)]
    procedure OnAfterModifyFALedger(var Rec: Record "FA Ledger Entry")
    begin
        UpdateAcquisitionInfo(Rec."FA No.");
    end;

    // Manual Update
    trigger OnRun()
    var
        FixedAsset: Record "Fixed Asset";
    begin
        if not Confirm(
            'すべての固定資産の取得日・取得価額を再計算します。', false) then
            exit;

        if FixedAsset.FindSet() then
            repeat
                UpdateAcquisitionInfo(FixedAsset."No.");
            until FixedAsset.Next() = 0;

        Message('固定資産の取得情報の再計算が完了しました。');
    end;


    // Common local procedure
    local procedure UpdateAcquisitionInfo(FANo: Code[20])
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

        FALedger.Reset();
        FALedger.SetRange("FA No.", FANo);
        FALedger.SetRange("FA Posting Type", FALedger."FA Posting Type"::"Acquisition Cost");

        if FALedger.FindSet() then
            repeat
                TotalAmount += FALedger.Amount;

                if IsFirst then begin
                    FirstDate := FALedger."Posting Date";
                    IsFirst := false;
                end else
                    if FALedger."Posting Date" < FirstDate then
                        FirstDate := FALedger."Posting Date";

            until FALedger.Next() = 0;

        // Set to Fixed Asset only if changed
        if (FixedAsset."Acquisition Date" <> FirstDate) or
           (FixedAsset."Acquisition Cost" <> TotalAmount) then begin

            FixedAsset."Acquisition Date" := FirstDate;
            FixedAsset."Acquisition Cost" := TotalAmount;
            FixedAsset.Modify();
        end;
    end;
}
