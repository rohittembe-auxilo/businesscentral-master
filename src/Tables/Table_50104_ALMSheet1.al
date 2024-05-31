Table 50104 "ALM Sheet1"
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
        field(4; Category; Text[30])
        {
        }
        field(5; "Sr No."; Text[30])
        {
        }
        field(6; Month; Text[30])
        {
        }
        field(7; "Due Date"; Date)
        {
        }
        field(8; ROI; Decimal)
        {
        }
        field(9; "Opening Balance"; Decimal)
        {
        }
        field(10; Disbursement; Decimal)
        {
        }
        field(11; Principal; Decimal)
        {
        }
        field(12; "Interest Due"; Decimal)
        {
        }
        field(13; Installment; Decimal)
        {
        }
        field(14; "Closing Balance"; Decimal)
        {
        }
        field(15; "RBI Code"; Code[20])
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

