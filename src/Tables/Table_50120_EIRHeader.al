Table 50120 "EIR Header"
{

    fields
    {
        field(1; "No."; Code[25])
        {
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; "EIR Calculated"; Boolean)
        {
        }
        field(4; Batch; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "EIR Calculated")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        EIRLine.SetRange("Document No.", "No.");
        if EIRLine.FindSet then
            EIRLine.DeleteAll;
    end;

    trigger OnInsert()
    begin
        /*"Sales&ReceivableSetup".GET;
        "No." :=NoSeriesMgnt.GetNextNo("Sales&ReceivableSetup"."EIR No.",0D,TRUE);
        */

    end;

    var
        "Sales&ReceivableSetup": Record "Sales & Receivables Setup";
        NoSeriesMgnt: Codeunit NoSeriesManagement;
        EIRLine: Record "EIR Line";
}

