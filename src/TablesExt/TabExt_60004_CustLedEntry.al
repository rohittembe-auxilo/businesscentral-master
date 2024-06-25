tableextension 60004 CustLedEntry_ext extends "Cust. Ledger Entry"
{
    fields
    {
        field(50010; "Creation DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT-tk-200919';
        }
        field(50011; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(21), "No." = field("Document No.")));


        }

    }
}
