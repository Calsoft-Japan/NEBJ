codeunit 50008 "Item Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterSetupNewLine, '', false, false)]
    local procedure NEBJItemJnlLineOnAfterSetupNewLine(ItemJnlBatch: Record "Item Journal Batch"; var ItemJournalLine: Record "Item Journal Line")
    begin
        if ItemJnlBatch."Default Gen. Bus. Posting Grp." <> '' then
            ItemJournalLine."Gen. Bus. Posting Group" := ItemJnlBatch."Default Gen. Bus. Posting Grp.";
    end;
}