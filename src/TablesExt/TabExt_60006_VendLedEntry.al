tableextension 60006 VendLedEntry_ext extends "Vendor Ledger Entry"
{
    fields
    {
        field(50010; "Creation DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "RCM Invoice No"; Code[35])
        {
            Description = 'CCIT//Lookup("Purch. Inv. Header".Field27211732 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50014; "RCM Payment No"; Code[35])
        {
            Description = 'CCIT//Lookup("Purch. Inv. Header".Field27211732 WHERE (No.=FIELD(Document No.)))';
        }
        field(50017; "RCM Invoice No."; Code[35])
        {
            Description = 'CCIT-tk//Lookup("Purch. Inv. Header".Field27211732 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50018; "RCM Payment No."; Code[35])
        {
            Description = 'CCIT-tk//Lookup("Purch. Inv. Header".Field27211732 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50019; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50020; "Purch. Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Bank Account Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';

            trigger OnValidate()
            var
                BankAccount: Record "Vendor Bank Account";
                IFSCMaster: Record "Human Resource Comment Line";
            begin
            end;
        }
        field(50022; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50023; "Bank Account Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50024; "Bank Account IFSC"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"IFSC Masters" WHERE (Blocked=CONST(No))//CCIT AN';
        }
        field(50025; "Bank Account E-Mail"; Text[250])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            ExtendedDatatype = EMail;
        }
        field(50026; "Related party transaction"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50030; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Opex,Capex';
            OptionMembers = " ",Opex,Capex;
        }
        field(50031; "PO Sub Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Fixed,Variable,Semi - Variable';
            OptionMembers = " ","Fixed",Variable,"Semi - Variable";
        }
        field(50032; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(122), "No." = field("Document No.")));


        }
        field(50033; "E-Mail 2"; Text[180])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }

    }
}
