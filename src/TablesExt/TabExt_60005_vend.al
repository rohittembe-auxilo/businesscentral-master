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
        field(50011; "Shortcut Dimension 3 Code"; Code[20])
        {

            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50012; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50013; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            DataClassification = ToBeClassified;

            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50014; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50015; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            DataClassification = ToBeClassified;

            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50016; "Shortcut Dimension 8 Code"; Code[20])
        {

            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                          Blocked = CONST(false),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                // added code to vlidate dimesnion set id
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(60000; "E-Mail 2"; Text[180])
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
        field(60003; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(23), "No." = field("No.")));


        }
        modify("Preferred Bank Account Code")
        {
            trigger OnBeforeValidate()
            var
                VendBankAccount: Record "Vendor Bank Account";
            begin
                VendBankAccount.reset();
                VendBankAccount.SetRange("Vendor No.", Rec."No.");
                VendBankAccount.SetRange(Code, "Preferred Bank Account Code");
                if VendBankAccount.find('-') then begin
                    if VendBankAccount.Blocked = true then
                        Error('Bank Account is blocked.');

                    "E-Mail" := VendBankAccount."E-Mail";
                End;
            end;
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
