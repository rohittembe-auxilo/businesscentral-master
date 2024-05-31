table 70000 "ABS Container setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Account Name"; Text[250])
        {
            Caption = 'Account Name';
        }
        field(3; "In Container Name"; Text[250])
        {
            Caption = 'Container Name';
            trigger OnValidate()
            begin
                "In Url" := 'https://' + "Account Name" + '.blob.core.windows.net/' + "In Container Name";
            end;
        }
        field(4; "Shared Access Key"; Text[250])
        {
            Caption = 'Shared Access Key';
        }
        field(5; "In Url"; text[2048])
        {

        }
        field(6; "Out Container Name"; Text[250])
        {
            Caption = 'Container Name';
            trigger OnValidate()
            begin
                "Out Url" := 'https://' + "Account Name" + '.blob.core.windows.net/' + "Out Container Name";
            end;
        }
        field(7; "Out Url"; text[2048])
        {

        }
        field(8; "Error Container Name"; Text[250])
        {
            Caption = 'Container Name';
            trigger OnValidate()
            begin
                "Error Url" := 'https://' + "Account Name" + '.blob.core.windows.net/' + "Error Container Name";
            end;
        }
        field(9; "Error Url"; text[2048])
        {

        }


    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}