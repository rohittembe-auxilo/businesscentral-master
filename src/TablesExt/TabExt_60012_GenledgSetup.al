tableextension 60012 GenledSetup_ext extends "General Ledger Setup"
{
    fields
    {
        field(50000; "Bank Pay Pro File Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
