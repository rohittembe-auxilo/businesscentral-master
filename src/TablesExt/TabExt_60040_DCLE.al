tableextension 60040 DCLE extends "Detailed Cust. Ledg. Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(379), "No." = field("Document No.")));


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