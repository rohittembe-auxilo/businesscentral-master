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
    trigger OnModify()
    var
        TDSConcessionalCode: Record "TDS Concessional Code";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.Get("Document Type", "Document No.");
        if (xRec."TDS Section Code" <> "TDS Section Code") and ("TDS Section Code" <> '') then begin
            TDSConcessionalCode.Reset();
            TDSConcessionalCode.SetRange("Vendor No.", "Buy-from Vendor No.");
            TDSConcessionalCode.SetRange(Section, "TDS Section Code");
            TDSConcessionalCode.SetFilter("Start Date", '<=%1', PurchaseHeader."Posting Date");
            TDSConcessionalCode.SetFilter("End Date", '>=%1', PurchaseHeader."Posting Date");
            TDSConcessionalCode.FindFirst();
        end;
    end;
}
