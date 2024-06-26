tableextension 60003 Cust_ext extends Customer
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50002; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            Description = 'CCIT//Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Customer No.=FIELD(No.),Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),Currency Code=FIELD(Currency Filter),Posting Date=FIELD(UPPERLIMIT(Date Filter))))';
            Editable = false;
        }
        field(50003; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(18), "No." = field("No.")));


        }

        field(50004; "Shortcut Dimension 3 Code"; Code[20])
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
        field(50005; "Shortcut Dimension 4 Code"; Code[20])
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
        field(50006; "Shortcut Dimension 5 Code"; Code[20])
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
        field(50007; "Shortcut Dimension 6 Code"; Code[20])
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
        field(50008; "Shortcut Dimension 7 Code"; Code[20])
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
        field(50009; "Shortcut Dimension 8 Code"; Code[20])
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
