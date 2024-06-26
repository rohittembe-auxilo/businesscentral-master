tableextension 60007 PurchHeader_ext extends "Purchase Header"
{
    fields
    {
        field(50000; "Short Closed"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }
        field(50002; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }
        field(50003; "Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }
        field(50004; "Approver Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }


        field(50005; "Shortcut Dimension 8 Code"; Code[20])
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
        field(50006; "Shortcut Dimension 3 Code"; Code[20])
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
        field(50007; "Shortcut Dimension 4 Code"; Code[20])
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
        field(50008; "Shortcut Dimension 5 Code"; Code[20])
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
        field(50009; "Shortcut Dimension 6 Code"; Code[20])
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
        field(50010; "Shortcut Dimension 7 Code"; Code[20])
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
        field(50011; MSME; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "MSME No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "TDS Amount"; Decimal)
        {
            //CalcFormula = sum("Purchase Line".Field20923844 where ("Document No."=field("No.")));
            // FieldClass = FlowField;
        }
        field(50014; "GST Amount"; Decimal)
        {
            // CalcFormula = sum("Purchase Line".Field20923844 where ("Document No."=field("No.")));
            // FieldClass = FlowField;
        }
        field(50015; PHComment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Vendor GSTIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50017; "Location GSTIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50018; "RCM Invoice No."; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50021; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50022; "Bank Account IFSC"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50023; "Bank Account Email"; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50024; "RCM Payment No."; Code[35])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
        }
        field(50025; "Bank Account Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            TableRelation = "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Buy-from Vendor No."));
            trigger OnValidate()
            var
                myInt: Integer;
                BankAccount1: Record "Vendor Bank Account";
            begin
                VALIDATE("Bank Account No.");
                VALIDATE("Bank Account Name");
                VALIDATE("Bank Account IFSC");
                VALIDATE("Bank Account Email");
                BankAccount1.RESET();
                BankAccount1.SETRANGE(BankAccount1."Vendor No.", "Buy-from Vendor No.");
                BankAccount1.SETRANGE(BankAccount1.Code, "Bank Account Code");
                IF BankAccount1.FIND('-') THEN
                    REPEAT
                        "Bank Account No." := BankAccount1."Bank Account No.";
                        "Bank Account Name" := BankAccount1.Name;
                        "Bank Account IFSC" := BankAccount1.IFSC;
                        "Bank Account Email" := BankAccount1."E-Mail";
                    UNTIL BankAccount1.NEXT = 0;
                //  END;

            end;
        }
        field(50026; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT';
            Editable = false;
        }
        field(50027; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50028; "Purch. Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Payment Code Desc."; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
        }
        field(50030; "PO Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Opex,Capex';
            OptionMembers = " ",Opex,Capex;
        }
        field(50031; "PO Sub Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT AN';
            OptionCaption = ' ,Fixed,Variable,Semi - Variable';
            OptionMembers = " ","Fixed",Variable,"Semi - Variable";
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
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                Vend1: Record Vendor;
                BankAccount: Record "Vendor Bank Account";
            begin
                Vend1.get("Buy-from Vendor No.");
                MSME := Vend1.MSME;
                "MSME No." := Vend1."MSME No.";
                "Vendor GSTIN No." := Vend1."GST Registration No.";
                "MSME Type" := Vend1."MSME Type";
                //CCIT Vikas
                //CCIT AN 13022023
                BankAccount.RESET();
                BankAccount.SETRANGE("Vendor No.", "Buy-from Vendor No.");
                BankAccount.SETRANGE(Code, '');
                IF BankAccount.FIND('-') THEN
                    VALIDATE("Bank Account Code", BankAccount.Code);
                VALIDATE("Bank Account No.");
                VALIDATE("Bank Account Code");
                VALIDATE("Bank Account IFSC");
                VALIDATE("Bank Account Name");
                VALIDATE("Bank Account Email");
                //CCIT AN 13022023

            end;
        }
        modify("Payment Method Code")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                PayMeth: Record "Payment Method";
            begin
                //CCIT AN 13012023+
                PayMeth.RESET();
                PayMeth.SETRANGE(Code, "Payment Method Code");
                IF PayMeth.FIND('-') THEN BEGIN
                    "Payment Code Desc." := PayMeth.Description;
                END;

            end;
        }
        modify("Dimension Set ID")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                DimSetentry: Record "Dimension Set Entry";

            begin
                DimSetentry.reset();
                DimSetentry.SetRange("Dimension Set ID", rec."Dimension Set ID");
                if DimSetentry.Find('-') then
                    repeat
                        if DimSetentry."Global Dimension No." = 3 then begin
                            rec.Validate("Shortcut Dimension 3 Code", DimSetentry."Dimension Code")
                        end;
                        if DimSetentry."Global Dimension No." = 4 then begin
                            rec.Validate("Shortcut Dimension 4 Code", DimSetentry."Dimension Code")
                        end;
                        if DimSetentry."Global Dimension No." = 5 then begin
                            rec.Validate("Shortcut Dimension 5 Code", DimSetentry."Dimension Code")
                        end;
                        if DimSetentry."Global Dimension No." = 6 then begin
                            rec.Validate("Shortcut Dimension 6 Code", DimSetentry."Dimension Code")
                        end;
                        if DimSetentry."Global Dimension No." = 7 then begin
                            rec.Validate("Shortcut Dimension 7 Code", DimSetentry."Dimension Code")
                        end;
                        if DimSetentry."Global Dimension No." = 8 then begin
                            rec.Validate("Shortcut Dimension 8 Code", DimSetentry."Dimension Code")
                        end;
                    until DimSetentry.next = 0;

            end;
        }

    }
    trigger OnAfterInsert()
    var
        myInt: Integer;
        DimSetEnt: Record "Dimension Set Entry";
        DimSetEntPages: Record "Dimension Set Entry";

    begin
        "Created By" := USERID;
    end;
}
