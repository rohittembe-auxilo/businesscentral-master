tableextension 60039 PurchSetupExtn extends "Purchases & Payables Setup"
{
    fields
    {
        field(60001; "SFTP Hostname"; Text[50])
        {
            Caption = 'SFTP Hostname';
            DataClassification = ToBeClassified;
        }
        field(60002; "SFTP Port"; Integer)
        {
            Caption = 'SFTP Port';
            DataClassification = ToBeClassified;
        }
        field(60003; "SFTP UserName"; Text[30])
        {
            Caption = 'SFTP UserName';
            DataClassification = ToBeClassified;
        }
        field(60004; "SFTP Password"; Text[30])
        {
            Caption = 'SFTP Password';
            DataClassification = ToBeClassified;
        }
        field(60005; "SFTP Path"; Text[250])
        {
            Caption = 'SFTP Path';
            DataClassification = ToBeClassified;
        }
    }
}
