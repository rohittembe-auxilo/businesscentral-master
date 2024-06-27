tableextension 60016 PurchRecpHead_ext extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
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
        field(50027; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50028; "Purch. Order No."; Code[35])
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
        field(50033; "E-Mail 2"; Text[180])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }
}
