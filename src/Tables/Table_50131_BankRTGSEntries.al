Table 50131 "Bank RTGS Entries-New"
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
        field(3; "Payment Mode"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Method".Code;
        }
        field(4; "Corporate Code"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Customer Ref No"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Debit Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Bank Account";
        }
        field(7; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Transaction Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Beneficiary Name"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vendor Bank Account No"; Text[26])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Beneficiary Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Beneficiary Account Type"; Text[2])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(13; "Beneficiary Address1"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Beneficiary Address2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Beneficiary Address3"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Benficiary City"; Text[25])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Benficiary State"; Text[25])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Benficiary Pin Code"; Text[25])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Benficiary IFSC Code"; Text[11])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Beneficiary Bank Name"; Text[70])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Base Code"; Text[6])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Cheque No"; Text[6])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Cheque Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Payable Location"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Print Location"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Beneficiary Email address 1"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Beneficiary Email address 2"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Beneficiary Mobile Number"; Text[55])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Corp Batch No"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Company Code"; Text[8])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Product Code"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Extra 1"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Extra 2"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Extra 3"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Extra 4"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Extra 5"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37; PayType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",CUST,MERC,DIST,INTN,VEND;
        }
        field(38; CORP_EMAIL_ADDR; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Bank Ledger Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Vendor Ledger Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41; "Exported to File"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42; "Export File Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(43; "Transaction Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44; "User Department"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "RTGS Ref No"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
            LCRecBankLedgerEntries."RTGS Entry Exist" := false;
            LCRecBankLedgerEntries.Modify;
        end;
    end;
}

