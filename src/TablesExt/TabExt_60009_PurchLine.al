tableextension 60009 PurchLine_ext extends "Purchase Line"
{
    fields
    {
        field(50001; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'CCIT-TK-291119';
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
