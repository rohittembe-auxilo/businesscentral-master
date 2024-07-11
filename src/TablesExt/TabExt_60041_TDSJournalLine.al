tableextension 60041 TDSJournalLine extends "TDS Journal Line"
{
    fields
    {
        field(50003; Status; Enum CustomApprovalEnum)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
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
        TDSEntry: Record "TDS Entry";
}