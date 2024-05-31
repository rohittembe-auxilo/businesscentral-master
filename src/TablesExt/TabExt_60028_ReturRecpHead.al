tableextension 60028 ReturRecpHead_ext extends "Return Receipt Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        modify("Location Code")
        {
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false), "Blocked Location" = CONST(false));
        }
    }
}
