Table 50111 "Advances Interest Accrual"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Row Labels"; Code[20])
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Sum Of Interest Accrual"; Decimal)
        {
        }
        field(6; "RBI Code"; Code[20])
        {
        }
        field(7; Status; Option)
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
            SumIndexFields = "Sum Of Interest Accrual";
        }
    }

    fieldgroups
    {
    }
}

