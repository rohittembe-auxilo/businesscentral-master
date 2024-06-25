tableextension 60002 GLEntry_ext extends "G/L Entry"
{
    fields
    {
        field(50002; "Shortcut Dimension 3"; Code[20])
        {
            Description = 'CCIT_PurchDimFlow-TK//Lookup("Dimension Set Entry"."Dimension Value Code" WHERE (Dimension Set ID=FIELD(Dimension Set ID),Dimension Code=FILTER(DEPARTMENT)))';
        }
        field(50003; "Shortcut Dimension 4"; Code[20])
        {
            Description = 'CCIT_PurchDimFlow-TK//Lookup("Dimension Set Entry"."Dimension Value Code" WHERE (Dimension Set ID=FIELD(Dimension Set ID),Dimension Code=FILTER(PRODUCT SEGMENT)))';
        }
        field(50004; "Purchase Comment"; Text[100])
        {
            Description = 'CCIT-TK-310719/Lookup("Purch. Comment Line".Comment WHERE (No.=FIELD(Document No.)))//FlowField';
        }
        field(50005; "Shortcut Dimension 8"; Code[20])
        {
            Description = 'CCIT_PurchDimFlow-TK//Lookup("Dimension Set Entry"."Dimension Value Code" WHERE (Dimension Set ID=FIELD(Dimension Set ID),Dimension Code=FILTER(LAN)))//FlowField';
        }
        field(50010; "Creation DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Purchase Comments"; Text[100])
        {
            Description = 'CCIT_AUX//Lookup("Purch. Comment Line".Comment WHERE (No.=FIELD(Document No.)))//FlowField';
        }
        field(50013; "Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT Vikas';
        }
        field(50014; "RCM Invoice No"; Code[35])
        {
            Description = 'CCIT//Lookup("Purch. Inv. Header".Field20919332 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
            // FieldClass = FlowField;
        }
        field(50015; "RCM Payment No"; Code[35])
        {
            Description = 'CCIT//Lookup("Purch. Inv. Header".Field20919332 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50016; "Shortcut Dimension 5"; Code[20])
        {
            Description = 'CCIT_PurchDimFlow//Lookup("Dimension Set Entry"."Dimension Value Code" WHERE (Dimension Set ID=FIELD(Dimension Set ID),Dimension Code=FILTER(INVESTMENT)))';
        }
        field(50017; "RCM Invoice No."; Code[35])
        {
            Description = 'CCIT-tk//Lookup("Purch. Inv. Header".Field20919332 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50018; "RCM Payment No."; Code[35])
        {
            Description = 'CCIT-tk//Lookup("Purch. Inv. Header".Field20919332 WHERE (No.=FIELD(Document No.)))';
            Editable = false;
        }
        field(50019; "GSTCredit 50%"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50020; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50021; "Purch. Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50022; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';

            trigger OnValidate()
            begin
                //TESTFIELD(Open,TRUE);
            end;
        }
        field(50023; "Party Code"; Code[20])
        {
            Caption = 'Party Code';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN//Party.Code';
            Editable = false;

            trigger OnValidate()
            begin
                /* IF RecParty.GET() THEN
                         "Party Name" := RecParty.Name;

                     IF RecVendor.GET() THEN
                         "Party Name" := RecVendor.Name;

                    IF RecCust.GET() THEN
                       "Party Name" := RecCust.Name;
                      //CCIT AN --*/
            end;
        }
        field(50024; "Party Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            Editable = false;
        }
        field(50025; "Related Party Transaction"; Boolean)
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
        field(50032; "GST Bill-to/BuyFrom State Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50033; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(17), "No." = field("Document No.")));


        }

    }
}
