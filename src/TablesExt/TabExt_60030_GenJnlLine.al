tableextension 60030 GenjnlLine extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Shortcut Dimension 8"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Shortcut Dimension 4"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Shortcut Dimension 5"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Shortcut Dimension 6"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Shortcut Dimension 7"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "GSTCredit 50%"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,A,B,C,D,E,F;
        }
        field(50009; "Purch. Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Rev. TDS Transaction No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Bank Account Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Bank Account IFSC"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Bank Account E-Mail"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Party Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Related party transaction"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Opex,Capex;
        }
        field(50019; "PO Sub Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Fixed,Variable,"Semi - Variable";
        }
        field(50020; "Payee name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(50021; "E-Mail 2"; Text[180])
        {

            DataClassification = ToBeClassified;

        }
        modify("Location Code")
        {
            trigger OnBeforeValidate()
            var
                Location: Record Location;
            begin
                Location.Get("Location Code");
                if Location."Blocked Location" = true then
                    Error('Location is blocked.');
            end;

        }
        modify("Recipient Bank Account")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                VenBankAcc: Record "Vendor Bank Account";
            begin
                //CCIT AN 14022023
                VenBankAcc.RESET();
                VenBankAcc.SETRANGE(Code, "Recipient Bank Account");
                VenBankAcc.SETRANGE("Vendor No.", "Account No.");
                IF VenBankAcc.FIND('-') THEN BEGIN
                    "Bank Account Code" := VenBankAcc.Code;
                    "Bank Account No." := VenBankAcc."Bank Account No.";
                    "Bank Account Name" := VenBankAcc.Name;
                    "Bank Account IFSC" := VenBankAcc.IFSC;
                    "Bank Account E-Mail" := VenBankAcc."E-Mail";
                END;
                //CCIT AN 14022023
            end;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}