Table 50124 "LMS Vendor Data Stagings"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; Address; Text[50])
        {
        }
        field(4; "Address 2"; Text[50])
        {
        }
        field(5; City; Text[30])
        {
        }
        field(6; Contact; Text[50])
        {
        }
        field(7; "Phone No."; Text[30])
        {
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
        }
        field(10; "Vendor Posting Group"; Code[10])
        {
        }
        field(11; "Payment Terms Code"; Code[10])
        {
        }
        field(12; "Country/Region Code"; Code[10])
        {
        }
        field(13; "Payment Method Code"; Code[10])
        {
        }
        field(14; "Gen. Bus. Posting Group"; Code[10])
        {
        }
        field(15; "Post Code"; Code[20])
        {
        }
        field(16; "E-Mail"; Text[80])
        {
        }
        field(17; "P.A.N. No."; Code[20])
        {
        }
        field(18; "State Code"; Code[10])
        {
        }
        field(19; Structure; Code[10])
        {
        }
        field(20; "GST Registration No."; Code[15])
        {
        }
        field(21; "GST Vendor Type"; Text[30])
        {
        }
        field(22; "Entry No"; Integer)
        {
        }
        field(23; "PLC Log No."; Integer)
        {
        }
        field(24; "No. Series"; Code[20])
        {
        }
        field(25; VendorBankCode; Code[20])
        {
        }
        field(26; "Bank Name"; Text[50])
        {
        }
        field(27; "Account No"; Code[20])
        {
        }
        field(28; "IFSC Code"; Code[30])
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

