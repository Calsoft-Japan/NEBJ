codeunit 50006 "Fixed Asset Enhancement"
{
    Subtype = Normal;

    // Auto update
    [EventSubscriber(ObjectType::Table, Database::"FA Ledger Entry",
        'OnAfterInsertEvent', '', true, true)]
    procedure OnAfterInsertFALedger(var Rec: Record "FA Ledger Entry")
    var
        FACalc: Codeunit "FA Acquisition Calc";
    begin
        FACalc.UpdateAcquisitionInfo(Rec."FA No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"FA Ledger Entry",
        'OnAfterModifyEvent', '', true, true)]
    procedure OnAfterModifyFALedger(var Rec: Record "FA Ledger Entry")
    var
        FACalc: Codeunit "FA Acquisition Calc";
    begin
        FACalc.UpdateAcquisitionInfo(Rec."FA No.");
    end;
}
