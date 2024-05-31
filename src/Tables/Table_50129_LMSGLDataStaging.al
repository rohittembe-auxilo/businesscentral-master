Table 50129 "LMS GL Data Stagings"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; "Document Type"; Text[30])
        {
        }
        field(4; "External Document No."; Code[35])
        {
        }
        field(5; "Account Type"; Text[30])
        {
        }
        field(6; "Account No."; Code[20])
        {
        }
        field(7; Description; Text[50])
        {
        }
        field(8; "Location Code"; Code[20])
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
        }
        field(11; "Bal. Account Type"; Text[30])
        {
        }
        field(12; "Bal. Account No."; Code[20])
        {
        }
        field(13; "Bank Payment Type"; Text[30])
        {
        }
        field(14; "GST Group Code"; Code[20])
        {
        }
        field(15; "GST Group Type"; Text[30])
        {
        }
        field(16; "GST Base Amount"; Decimal)
        {
        }
        field(17; "GST %"; Decimal)
        {
        }
        field(18; "Total GST Amount"; Decimal)
        {
        }
        field(19; "GST Customer Type"; Text[30])
        {
        }
        field(20; "GST Vendor Type"; Text[30])
        {
        }
        field(21; "HSN/SAC Code"; Code[8])
        {
        }
        field(22; Exempted; Boolean)
        {
        }
        field(23; "GST Bill-to/BuyFrom State Code"; Code[10])
        {
        }
        field(24; "GST Ship-to State Code"; Code[10])
        {
        }
        field(25; "Location State Code"; Code[10])
        {
        }
        field(26; "GST Input Service Distribution"; Boolean)
        {
        }
        field(27; "Shortcut Dimension 3 Code"; Code[20])
        {
        }
        field(28; "Shortcut Dimension 4 Code"; Code[50])
        {
        }
        field(29; "Shortcut Dimension 5 Code"; Code[20])
        {
        }
        field(30; "Shortcut Dimension 6 Code"; Code[20])
        {
        }
        field(31; "Shortcut Dimension 7 Code"; Code[20])
        {
        }
        field(32; "Shortcut Dimension 8 Code"; Code[20])
        {
        }
        field(33; "Document No."; Code[30])
        {
        }
        field(34; "Document Date"; Date)
        {
        }
        field(35; "Debit Amount"; Decimal)
        {
        }
        field(36; "Credit Amount"; Decimal)
        {
        }
        field(37; "Entry No"; Integer)
        {
        }
        field(38; "PLC Log No."; Integer)
        {
        }
        field(39; "Journal Template Name"; Code[10])
        {
        }
        field(40; "Journal Batch Name"; Code[10])
        {
        }
        field(41; "GST Reg. No"; Code[15])
        {
        }
        field(42; Comment; Text[250])
        {
        }
        field(43; "Recurring Method"; Text[250])
        {
            Caption = 'Recurring Method';

            trigger OnValidate()
            begin
                /*IF "Recurring Method" IN
                   ["Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance"]
                THEN
                  TESTFIELD("Currency Code",'');
                  */

            end;
        }
        field(44; "Expiration Date"; Date)
        {
        }
        field(45; "Recurring Frequency"; DateFormula)
        {
        }
        field(46; "Direct Upload"; Boolean)
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

