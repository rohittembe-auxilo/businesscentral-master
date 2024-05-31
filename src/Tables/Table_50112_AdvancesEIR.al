Table 50112 "Advances EIR"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; LAN; Code[20])
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Rev Unmort"; Decimal)
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
    }

    fieldgroups
    {
    }
}

