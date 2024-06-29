tableextension 60042 TDSEntryExt extends "TDS Entry"
{
    fields
    {
        field(50000; "Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(50001; "Party Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Party.Name where(Code = field("Party Code")));
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
}