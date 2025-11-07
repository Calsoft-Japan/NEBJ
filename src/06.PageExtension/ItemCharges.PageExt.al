pageextension 50001 "Item Charges Ext" extends "Item Charges"
{
    procedure GetSelectionFilter(): Text
    var
        ItemCharge: Record "Item Charge";
    begin
        CurrPage.SetSelectionFilter(ItemCharge);
        exit(GetSelectionFilterForItemCharge(ItemCharge));
    end;

    procedure GetSelectionFilterForItemCharge(var ItemCharge: Record "Item Charge"): Text
    var
        RecRef: RecordRef;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        RecRef.GetTable(ItemCharge);
        exit(SelectionFilterManagement.GetSelectionFilter(RecRef, ItemCharge.FieldNo("No.")));
    end;
}