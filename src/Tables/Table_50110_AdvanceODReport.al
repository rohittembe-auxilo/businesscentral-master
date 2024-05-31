Table 50110 "Advances OD Report"
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
        field(6; "Cust Short Name"; Text[50])
        {
        }
        field(7; FINODSchdDate; Date)
        {
        }
        field(8; FINCURODDays; Decimal)
        {
        }
        field(9; FINCURODAMT; Decimal)
        {
        }
        field(10; FINCURODPRI; Decimal)
        {
        }
        field(11; FINCURODPFT; Decimal)
        {
        }
        field(12; Status; Option)
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
            SumIndexFields = FINCURODAMT;
        }
    }

    fieldgroups
    {
    }
}

