tableextension 60017 PurcInvHead_ext extends "Purch. Inv. Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No."=const(3));
        }
        field(50002; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Approver Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; MSME; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "MSME No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "TDS Amount"; Decimal)
        {
        // CalcFormula = sum("Purch. Inv. Line".Field20919332 where ("Document No."=field("No.")));
        // FieldClass = FlowField;
        }
        field(50014; "GST Amount"; Decimal)
        {
        // CalcFormula = sum("Purch. Inv. Line".Field20919332 where ("Document No."=field("No.")));
        // FieldClass = FlowField;
        }
        field(50015; PHComment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Vendor GSTIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50017; "Location GSTIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50018; "RCM Invoice No."; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50019; "GST Group Code"; Code[20])
        {
        // CalcFormula = lookup("Purch. Inv. Line".Field20919332 where ("Document No."=field("No.")));
        // Caption = 'GST Group Code';
        // Description = 'CCIT//"GST Group"';
        // Editable = false;
        // FieldClass = FlowField;
        }
        field(50020; "GST Reverse Charge"; Boolean)
        {
        // CalcFormula = lookup("Purch. Inv. Line".Field20919332 where ("Document No."=field("No.")));
        // Description = 'CCIT';
        // Editable = false;
        // FieldClass = FlowField;
        }
        field(50021; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50022; "Bank Account IFSC"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50023; "Bank Account Email"; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50024; "RCM Payment No."; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50025; "Bank Account Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT//"Vendor Bank Account".Code WHERE (Vendor No.=FIELD(Buy-from Vendor No.))';

            trigger OnValidate()
            var
                BankAccount: Record "Vendor Bank Account";
            begin
            end;
        }
        field(50026; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50027; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ", A, B, C, D, E, F;
        }
        field(50028; "Purch. Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Opex,Capex';
            OptionMembers = " ", Opex, Capex;
        }
        field(50031; "PO Sub Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Fixed,Variable,Semi - Variable';
            OptionMembers = " ", "Fixed", Variable, "Semi - Variable";
        }
    }
}
