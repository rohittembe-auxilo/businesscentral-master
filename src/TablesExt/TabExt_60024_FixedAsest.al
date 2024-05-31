tableextension 60024 FixedAsest_ext extends "Fixed Asset"
{
    fields
    {
        field(50000; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50001; "Asset Tag no."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
    }
}
