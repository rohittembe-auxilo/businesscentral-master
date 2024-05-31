Table 50116 "G/l Tds Nature Of Deduction"
{

    fields
    {
        field(1; "G/L account No"; Code[20])
        {
            Description = '//CCIT_TK';
            TableRelation = "G/L Account";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = false;
            Description = '//CCIT_TK';
        }
        field(3; "TDS NOD"; Code[20])
        {
            Description = '//CCIT_TK';
            //v    TableRelation = "TDS Nature of Deduction";
        }
        field(4; "G/L Account Nmae"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L account No")));
            Description = '//CCIT_TK';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "G/L account No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

