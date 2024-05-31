tableextension 60033 BankAccReconciliation extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "CRDR"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Amt; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "TxnPostedDate"; DateTime)
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