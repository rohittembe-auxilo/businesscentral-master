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
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                GLAccount: Record "G/L Account";
                PurchaseHeader: Record "Purchase Header";
                PurchaseLine: Record "Purchase Line";
                VendorGLAccount: Record "Vendor GL Account";
            begin
                //>> ST
                IF rec.Type = Type::"G/L Account" THEN BEGIN
                    PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
                    if not VendorGLAccount.Get(PurchaseHeader."Buy-from Vendor No.", Rec."No.") then
                        ERROR('Vendor G/L Account Not Available for this %1', PurchaseHeader."Buy-from Vendor No.");

                    GLAccount.get(rec."No.");
                    Validate("TDS Section Code", GLAccount."TDS");
                END;
                //<< ST
            end;
        }
    }
}
