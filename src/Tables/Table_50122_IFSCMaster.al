Table 50122 "IFSC Masters"
{

    fields
    {
        field(1; "IFSC Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
            Description = 'change from 50 to 100';
        }
        field(3; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "IFSC Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

