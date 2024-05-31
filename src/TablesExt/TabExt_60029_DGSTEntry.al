tableextension 60029 DGSTEntry extends "Detailed GST Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Shortcut Dimention 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Vendor Invoice No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Purchase Invoice Comment"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Payment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Payment Doc No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "RCM Invoice No"; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "RCM Payment No"; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "RCM Invoice No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "RCM Payment No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "GST Credit 50%"; Boolean)
        {
            DataClassification = ToBeClassified;
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