Table 50107 "Advance Cl Balances"
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
        field(4; FINReference; Code[20])
        {
        }
        field(5; "Customer Name"; Text[50])
        {
        }
        field(6; "Sch Date"; Date)
        {
        }
        field(7; "Closing Balance"; Decimal)
        {
        }
        field(8; "Sch Method"; Code[20])
        {
        }
        field(9; "Q Date"; Date)
        {
        }
        field(14; Status; Option)
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
        key(Key2; Status, "Sch Date")
        {
            SumIndexFields = "Closing Balance";
        }
        key(Key3; Status)
        {
            SumIndexFields = "Closing Balance";
        }
    }

    fieldgroups
    {
    }
}

