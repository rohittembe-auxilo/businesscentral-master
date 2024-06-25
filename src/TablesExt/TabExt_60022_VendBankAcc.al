tableextension 60022 VendBankAcc_ext extends "Vendor Bank Account"
{
    fields
    {
        field(50000; IFSC; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"IFSC Masters"';
            trigger OnValidate()
            var
                myInt: Integer;
                VenBankAcc: Record "Vendor Bank Account";
                Vendor: Record Vendor;
            begin
                VenBankAcc.RESET();
                VenBankAcc.SETRANGE(Code, Code);
                VenBankAcc.SETRANGE("Vendor No.", "Vendor No.");
                IF VenBankAcc.FIND('-') THEN BEGIN
                    IF IFSC <> VenBankAcc.IFSC THEN BEGIN
                        Vendor.RESET();
                        Vendor.SETRANGE("No.", VenBankAcc."Vendor No.");
                        IF Vendor.FINDFIRST THEN BEGIN
                            Vendor.Blocked := Vendor.Blocked::Payment;
                            Vendor."Blocked Reason" := 'IFSC Code has Changed';
                            Vendor.MODIFY(true);
                        END;
                        MESSAGE('This Vendor Account has been Blocked');
                    END;
                END;
                //CCIT AN Vendor Payment Blocked

            end;
        }
        field(50001; "Receiver A/c type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "10","11";
        }
        field(50002; "Vendor name"; Text[50])
        {
            // CalcFormula = lookup(Vendor.Name where ("No."=field("Vendor No.")));
            // Description = '//CCIT-TK-041220';
            // FieldClass = FlowField;
        }
        field(50003; "IFSC Description"; Text[50])
        {
            // Description = 'Lookup("IFSC Masters".Description WHERE (IFSC Code=FIELD(IFSC)))ccit//tk';
            // FieldClass = FlowField;
        }
        field(50004; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Sent for Approval","Approved","Rejected";
        }
        field(50005; "Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50006; "Approval DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(50007; "Blocked"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        modify(Name)
        {
            trigger OnBeforeValidate()
            var
                VenBankAcc: Record "Vendor Bank Account";
                Vendor: Record Vendor;
            begin
                VenBankAcc.RESET();
                VenBankAcc.SETRANGE(Code, Code);
                VenBankAcc.SETRANGE("Vendor No.", "Vendor No.");
                IF VenBankAcc.FIND('-') THEN BEGIN
                    IF Name <> VenBankAcc.Name THEN BEGIN
                        Vendor.RESET();
                        Vendor.SETRANGE("No.", VenBankAcc."Vendor No.");
                        IF Vendor.FINDFIRST THEN BEGIN
                            Vendor.Blocked := Vendor.Blocked::Payment;
                            Vendor."Blocked Reason" := 'Name has Changed';
                            Vendor.MODIFY(true);
                        END;
                        MESSAGE('This Vendor Account has been Blocked');
                    END;
                end;
            End;
        }
        modify("Bank Account No.")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
                VenBankAcc: Record "Vendor Bank Account";
                vendor: Record Vendor;
            begin
                //CCIT AN Vendor Payment Blocked
                VenBankAcc.RESET();
                VenBankAcc.SETRANGE(Code, Code);
                VenBankAcc.SETRANGE("Vendor No.", "Vendor No.");
                IF VenBankAcc.FIND('-') THEN BEGIN
                    IF "Bank Account No." <> VenBankAcc."Bank Account No." THEN BEGIN
                        Vendor.RESET();
                        Vendor.SETRANGE("No.", VenBankAcc."Vendor No.");
                        IF Vendor.FINDFIRST THEN BEGIN
                            Vendor.Blocked := Vendor.Blocked::Payment;
                            Vendor."Blocked Reason" := 'Bank Account No has Changed';
                            Vendor.MODIFY(true);
                        END;
                        MESSAGE('This Vendor Account has been Blocked');
                    END;
                END;
                //CCIT AN Vendor Payment Blocked

            end;
        }
    }
}
