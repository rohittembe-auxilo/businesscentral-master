Table 50127 "PLC Logs Details"
{

    fields
    {
        field(1; "PLC Log No."; Integer)
        {
            Description = 'Foreign key, Primary Key';
        }
        field(2; "Record No."; Integer)
        {
        }
        field(3; "Identifier 1"; Text[30])
        {
            Description = 'Key value of the record';
        }
        field(4; Sucess; Boolean)
        {
        }
        field(5; Error; Text[250])
        {
            Description = 'In case there was an error a descriptive text';
        }
        field(6; "Identifier 2"; Text[30])
        {
        }
        field(7; "Identifier 3"; Text[30])
        {
        }
        field(8; "Identifier 4"; Text[30])
        {
        }
        field(9; "Date & Time"; DateTime)
        {
            Description = 'CCIT Vikas';
        }
        field(10; Date; Date)
        {
            Description = 'CCIT Vikas';
        }
        field(11; Filename; Text[250])
        {
            Description = 'CCIT Kritika';
        }
    }

    keys
    {
        key(Key1; "PLC Log No.", "Record No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

