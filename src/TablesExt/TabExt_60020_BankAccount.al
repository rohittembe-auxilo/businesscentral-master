tableextension 60020 BankAccount_ext extends "Bank Account"
{
    fields
    {
        field(50000; IFSC; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"IFSC Masters"';
        }
        field(60000; "RTGS File Path"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnModify()
    begin
        //>> ST
        Blocked := true;
        //<< ST
    end;
}
