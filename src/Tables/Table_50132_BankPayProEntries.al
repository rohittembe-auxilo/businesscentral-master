Table 50132 "Bank Pay Pro Entries-New"
{
    Permissions = TableData "Bank Account Ledger Entry" = rimd;

    fields
    {
        field(1; "Bank No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Payment Method identifier"; Text[1])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Method".Code;
        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Value Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Beneficiary Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Beneficiary Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Beneficiary Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Beneficiary Address 3"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Beneficiary City"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Beneficiary State"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "PIN Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Bene Account Number"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Email ID of beneficiary"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(15; "Email Body"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Debit Account Number"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "CRN (Narration  / Remarks)"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Receiver IFSC"; Text[11])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Receiver A/c type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "10","11";
        }
        field(20; "Print Branch"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Payable Location"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Instrument Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Payment Details 1"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Payment Details 2"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Payment Details 3"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Payment Details 4"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Payment Details 5"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Payment Details 6"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Payment Details 7"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Payment Details 8"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Payment Details 9"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Payment Details 10"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Payment Details 11"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Payment Details 12"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Payment Details 13"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Payment Details 14"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Payment Details 15"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Payment Details 16"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Payment Details 17"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Payment Details 18"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Payment Details 19"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Additional Info 99"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(43; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Phone No"; Text[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(45; "Exported to File"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(46; "RTGS Ref No"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(47; "Vendor Ledger Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(48; "Bank Ledger Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(49; "External Document No."; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Bank No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        LCRecBankLedgerEntries: Record "Bank Account Ledger Entry";
    begin

        LCRecBankLedgerEntries.SetRange("Entry No.", Rec."Bank Ledger Entry No");
        if LCRecBankLedgerEntries.FindFirst then begin
            LCRecBankLedgerEntries."PayPro Entry Exit" := false;
            LCRecBankLedgerEntries.Modify;
        end;
    end;
}

