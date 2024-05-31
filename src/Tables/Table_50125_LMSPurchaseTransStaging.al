Table 50125 "LMS Purchase Trans. Stagings"
{

    fields
    {
        field(1; "Document Type"; Text[30])
        {
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Buy-from Vendor No."; Code[20])
        {
        }
        field(4; "Buy-from Vendor Name"; Code[50])
        {
        }
        field(5; "Document Date"; Date)
        {
        }
        field(6; "Order Date"; Date)
        {
        }
        field(7; "Posting Date"; Date)
        {
        }
        field(8; "Payment Terms Code"; Code[10])
        {
        }
        field(9; "Location Code"; Code[10])
        {
        }
        field(10; "Shortcut Dimension 1 Code"; Code[20])
        {
        }
        field(11; "Shortcut Dimension 2 Code"; Code[20])
        {
        }
        field(12; "Shortcut Dimension 3 Code"; Code[20])
        {
        }
        field(13; "Shortcut Dimension 4 Code"; Code[20])
        {
        }
        field(14; "Shortcut Dimension 5 Code"; Code[20])
        {
        }
        field(15; "Shortcut Dimension 6 Code"; Code[20])
        {
        }
        field(16; "Shortcut Dimension 7 Code"; Code[20])
        {
        }
        field(17; "Shortcut Dimension 8 Code"; Code[10])
        {
        }
        field(18; "Vendor Posting Group"; Text[30])
        {
        }
        field(19; "Vendor Invoice No."; Code[35])
        {
        }
        field(20; "Gen. Bus. Posting Group"; Code[10])
        {
        }
        field(21; Structure; Code[10])
        {
        }
        field(22; "GST Vendor Type"; Text[30])
        {
        }
        field(23; "Line No."; Integer)
        {
        }
        field(24; Type; Text[30])
        {
        }
        field(25; "No."; Code[20])
        {
        }
        field(26; Description; Text[50])
        {
        }
        field(27; "Description 2"; Text[50])
        {
        }
        field(28; Quantity; Decimal)
        {
        }
        field(29; "Direct Unit Cost"; Decimal)
        {
        }
        field(30; Amount; Decimal)
        {
        }
        field(31; "TDS Nature of Deduction"; Code[10])
        {
        }
        field(32; "GST Credit"; Text[30])
        {
        }
        field(33; "GST Group Code"; Code[20])
        {
        }
        field(34; "GST Group Type"; Text[30])
        {
        }
        field(35; "HSN/SAC Code"; Code[8])
        {
        }
        field(36; "GST Base Amount"; Decimal)
        {
        }
        field(37; "GST %"; Decimal)
        {
        }
        field(38; "Total GST Amount"; Decimal)
        {
        }
        field(39; Exempted; Boolean)
        {
        }
        field(40; "GST Jurisdiction Type"; Text[30])
        {
        }
        field(41; "Entry No"; Integer)
        {
        }
        field(42; "PLC Log No."; Integer)
        {
        }
        field(43; Comment; Text[250])
        {
        }
        field(44; "PH Comment"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

