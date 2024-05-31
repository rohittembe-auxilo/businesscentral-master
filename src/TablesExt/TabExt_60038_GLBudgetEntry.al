tableextension 60038 GLBudgetEntry extends "G/L Budget Entry"
{
    fields
    {
        field(50000; "Remaining Amount"; Decimal)
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