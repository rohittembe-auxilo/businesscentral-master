Table 50126 "PLC Logs"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Interface Type"; Option)
        {
            Description = 'gl';
            OptionCaption = 'GL,Purchase,Vendor,Dimension,GL Direct,PO';
            OptionMembers = GL,Purchase,Vendor,Dimension,"GL Direct",PO;
        }
        field(3; "File Name"; Text[250])
        {
        }
        field(4; "Start Date Time"; DateTime)
        {
        }
        field(5; "End Date Time"; DateTime)
        {
        }
        field(6; "Total Records"; Integer)
        {
        }
        field(7; Success; Boolean)
        {
        }
        field(8; "Document No."; Code[20])
        {
        }
        field(9; "File Error"; Text[250])
        {
        }
        field(10; "Header Exported"; Boolean)
        {
        }
        field(11; "Line Exported"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Interface Type", "Document No.")
        {
        }
        key(Key3; "Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

