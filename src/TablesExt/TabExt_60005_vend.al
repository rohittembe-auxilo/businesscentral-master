tableextension 60005 vend_ext extends Vendor
{
    fields
    {
        field(50000; "GRN Qty"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50002; "LMS Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; MSME; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "MSME No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            Description = '//-Sum("Detailed Vendor Ledg. Entry".Amount WHERE (Vendor No.=FIELD(No.),Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),Currency Code=FIELD(Currency Filter),Posting Date=FIELD(UPPERLIMIT(Date Filter))))';
            Editable = false;
        }
        field(50006; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50007; "Creation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';

            trigger OnValidate()
            begin
                //IF "No." = '' THEN
                //"Creation Date" := DATI2VARIANT(TODAY,TIME);
            end;
        }
        field(50008; "Blocked Reason"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50009; "Related party transaction"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50010; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            TableRelation = "Incoming Document";

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                /*IF "Incoming Document Entry No." = xRec."Incoming Document Entry No." THEN
                      EXIT;
                    IF "Incoming Document Entry No." = 0 THEN
                      IncomingDocument.RemoveReferenceToWorkingDocument(xRec."Incoming Document Entry No.");*/
                //ELSE
                // IncomingDocument.SetVendorDoc(Rec);
            end;
        }
        field(60000; "E-Mail 2"; Text[80])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(60001; "Mobile No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60002; "Address 3"; Text[50])
        {
            Caption = 'Address 3';
            DataClassification = ToBeClassified;
        }
        modify("Location Code")
        {
            trigger OnBeforeValidate()
            var
                Location: Record Location;
            begin
                Location.Get("Location Code");
                if Location."Blocked Location" = true then
                    Error('Location is blocked.');
            end;

        }
    }
    trigger OnModify()
    begin
        //>> ST
        Blocked := Blocked::All;
        //<< ST
    end;
}
