tableextension 60031 DVLE extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Opex,Capex;
        }
        field(50001; "PO Sub Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Fixed,Variable,"Semi - Variable";
        }
        field(50002; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(380), "No." = field("Document No.")));


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