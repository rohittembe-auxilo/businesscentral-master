Table 50108 "Advances LanWise"
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
        field(5; "SCH Date"; Date)
        {
        }
        field(6; "Calculated Rate"; Decimal)
        {
        }
        field(7; "Repay Amount"; Decimal)
        {
        }
        field(8; "Balance For PFTCAL"; Decimal)
        {
        }
        field(9; DisbAmount; Decimal)
        {
        }
        field(10; PrincipalSchd; Decimal)
        {
        }
        field(11; ProfitSchd; Decimal)
        {
        }
        field(12; "CPZA Amount"; Decimal)
        {
        }
        field(13; "Closing Balance"; Decimal)
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
        key(Key2; Status, "SCH Date")
        {
            SumIndexFields = PrincipalSchd, "CPZA Amount";
        }
    }

    fieldgroups
    {
    }
}

