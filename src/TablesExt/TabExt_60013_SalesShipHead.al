tableextension 60013 SalesShipHead_ext extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No."=const(3));
        }
    }
}
