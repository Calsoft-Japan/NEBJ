enum 50000 "Block Option"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(00; ExclBlock) { Caption = 'ExclBlock'; }
    value(05; Ship) { Caption = 'Ship'; }
    value(15; Invoice) { Caption = 'Invoice'; }
    value(20; "Shiponly") { Caption = 'ShipOnly'; }
    value(25; InvoiceOnly) { Caption = 'InvoiceOnly'; }
    value(30; ExclOnly) { Caption = 'ExclOnly'; }
    value(35; InclBlock) { Caption = 'InclBlock'; }
}