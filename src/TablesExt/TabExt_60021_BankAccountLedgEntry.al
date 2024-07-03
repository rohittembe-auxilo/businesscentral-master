tableextension 60021 BankAccountLedgEntry_ext extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "Shortcut Dimension 4"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Shortcut Dimension 8"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Bank Account Code"; Code[10])
        {
            Description = 'CCIT AN//Lookup("Vendor Ledger Entry".Field8604520 WHERE (Document No.=FIELD(Document No.)))';

            trigger OnValidate()
            var
                BankAccount: Record "Vendor Bank Account";
                IFSCMaster: Record "Human Resource Comment Line";
            begin
            end;
        }
        field(50022; "VenBank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            Description = 'CCIT AN//Lookup("Vendor Ledger Entry".Field8604520 WHERE (Document No.=FIELD(Document No.)))';
        }
        field(50023; "Bank Account Name"; Text[50])
        {
            Caption = 'Name';
            Description = 'CCIT AN//Lookup("Vendor Ledger Entry".Field8604520 WHERE (Document No.=FIELD(Document No.)))';
        }
        field(50024; "Bank Account IFSC"; Code[20])
        {
            Description = '"IFSC Masters" WHERE (Blocked=CONST(No))//Lookup("Vendor Ledger Entry".Field8604520 WHERE (Document No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50025; "Bank Account E-Mail"; Text[250])
        {
            Caption = 'E-Mail';
            Description = 'CCIT AN//Lookup("Vendor Ledger Entry".Field8604520 WHERE (Document No.=FIELD(Document No.)))';
            Editable = false;
            ExtendedDatatype = EMail;
        }
        field(50026; "Party Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50027; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(271), "No." = field("Document No.")));


        }
        field(50028; "E-Mail 2"; Text[180])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }

        field(60000; "RTGS Entry Exist"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60001; "Recipient Bank Account"; Code[10])
        {
            Description = 'Lookup("Vendor Ledger Entry"."Recipient Bank Account" WHERE (Document No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(60002; "PayPro Entry Exit"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
