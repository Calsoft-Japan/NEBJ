codeunit 50003 "Purchase Enhancement"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', true, true)]
    procedure OnBeforeInsertReceiptHeader(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    begin
        PurchRcptHeader."CI Number" := PurchaseHeader."Vendor Invoice No.";
    end;
}