Table 50123 "User Department"
{

    fields
    {
        field(1; "User ID"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(2; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
    }

    keys
    {
        key(Key1; "User ID", Department)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

