tableextension 60036 GenJournalBatch extends "Gen. Journal Batch"
{
    fields
    {
        field(60000; "Comments Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(60001; "Ext. Docuemnt No. Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        modify("Location Code")
        {
            trigger OnBeforeValidate()
            var
                Location: Record Location;
            begin
                Location.Get("Location Code");
                if Location."Blocked Location" = true then
                    Error('Location is blocked.');
            end;

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