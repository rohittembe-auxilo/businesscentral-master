tableextension 60000 Loc_ext extends Location
{
    fields
    {
        field(50000; "RCM Invoice No. Nos."; Code[10])
        {
            Caption = 'Posted Dist. Invoice Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50001; "RCM payment No. Nos."; Code[10])
        {
            Caption = 'Posted Dist. Cr. Memo Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50002; "Blocked Location"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
    }
}
