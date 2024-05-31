Table 50105 "ALM Sheet2"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "File Name"; Text[30])
        {
        }
        field(4; Category; Code[10])
        {
        }
        field(5; Date; Date)
        {
        }
        field(6; Unamort; Decimal)
        {
        }
        field(7; "RBI Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

