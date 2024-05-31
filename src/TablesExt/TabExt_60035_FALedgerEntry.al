tableextension 60035 FALedgerEntry extends "FA Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "GSTCredit 50%"; Boolean)
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