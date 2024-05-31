Table 50100 "ALM Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Starting Date"; Date)
        {
        }
        field(4; "Ending Date"; Date)
        {
        }
        field(5; "Lock ALM Sheet"; Boolean)
        {
            Description = 'CCIT AN';
        }
        field(6; "Lac/Cr. ALM Sheet"; Option)
        {
            Description = 'CCIT AN';
            OptionMembers = " ",Hundred,Thousand,Lakhs,Crore;
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

