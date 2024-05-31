Table 50109 "Advances Cust ID"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "RBI Code"; Code[20])
        {
        }
        field(4; "FIN Reference"; Code[20])
        {
        }
        field(5; "Cust ID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

