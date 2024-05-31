Table 50119 "Vendor GL Account"
{

    fields
    {
        field(1; "Vendor No"; Code[20])
        {
        }
        field(2; "G/L Account No"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(4; "TDS NOD"; Code[20])
        {
            //v            TableRelation = "TDS Nature of Deduction";
        }
        field(5; "G/L Account Name"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account No")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Vendor No", "G/L Account No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

