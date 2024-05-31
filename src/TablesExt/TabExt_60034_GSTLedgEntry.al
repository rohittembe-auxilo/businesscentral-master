tableextension 60034 GSTLedgEntry extends "GST Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50011; "GST Credit 50%"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}