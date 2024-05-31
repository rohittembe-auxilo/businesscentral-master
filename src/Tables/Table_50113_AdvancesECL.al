Table 50113 "Advances ECL"
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
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Cust ID"; Code[20])
        {
        }
        field(6; Stage; Text[30])
        {
        }
        field(7; ECL; Decimal)
        {
        }
        field(8; Status; Option)
        {
            OptionMembers = " ",Standard,"NPA-Non Standard","NPA-Doubtfull Loss";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Status)
        {
            SumIndexFields = ECL;
        }
    }

    fieldgroups
    {
    }
}

