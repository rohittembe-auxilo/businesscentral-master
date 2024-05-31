tableextension 60014 SalesInvHead_ext extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50002; "Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }
        field(50003; "Approver Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
            end;
        }
        field(50004; "Shortcut Dimension 4"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50005; "Shortcut Dimension 5"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50006; "Shortcut Dimension 6"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50007; "Shortcut Dimension 7"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50008; "Shortcut Dimension 8"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
    }
}
