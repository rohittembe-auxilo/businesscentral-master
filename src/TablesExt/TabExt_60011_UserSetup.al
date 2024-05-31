tableextension 60011 UserSetup_ext extends "User Setup"
{
    fields
    {
        field(50000; "User Name"; Text[30])
        {
        // CalcFormula = lookup(User."Full Name" where ("User Name"=field("User ID")));
        // Editable = false;
        // FieldClass = FlowField;
        }
        field(50001; "Approver Name"; Text[30])
        {
            Description = 'Lookup(User."Full Name" WHERE (User Name=FIELD(Approver ID)))';
            Editable = false;
        }
        field(50002; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN User Setup App';
        }
    }
}
