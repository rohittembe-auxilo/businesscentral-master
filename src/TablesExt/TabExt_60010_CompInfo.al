tableextension 60010 CompInfo_ext extends "Company Information"
{
    fields
    {
        field(60000; "Corporate Email ID"; Text[50])
        {
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
}
