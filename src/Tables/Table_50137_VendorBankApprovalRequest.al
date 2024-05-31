table 50137 "Vendor Bank Approval"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "User ID"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Approver 1"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

        }
        field(5; "Approver 2"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

        }
        field(6; "Approved 1"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Approved 2"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Rejected 1"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Rejected 2"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Approved,Rejected;

        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}