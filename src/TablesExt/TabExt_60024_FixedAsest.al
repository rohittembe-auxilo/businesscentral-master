tableextension 60024 FixedAsest_ext extends "Fixed Asset"
{
    fields
    {
        field(50000; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }

        field(50001; "Asset Tag no."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Shortcut Dimension 3 Code"; Code[20])
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
        field(50003; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Pending Approval,Approved';
            OptionMembers = "Pending Approval",Approved;
        }
    }
}
