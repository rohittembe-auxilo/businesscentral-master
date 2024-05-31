tableextension 60032 Party extends Party
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "IFSC"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Bank Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Bank Address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Bank Address2"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Bank Branch No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Payment Method code"; Code[20])
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