tableextension 60027 ReturnShiphead_ext extends "Return Shipment Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        modify("Location Code")
        {
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false), "Blocked Location" = CONST(false));
        }
    }
}
