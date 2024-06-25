tableextension 60003 Cust_ext extends Customer
{
    fields
    {
        field(50001; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50002; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            Description = 'CCIT//Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Customer No.=FIELD(No.),Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),Currency Code=FIELD(Currency Filter),Posting Date=FIELD(UPPERLIMIT(Date Filter))))';
            Editable = false;
        }
        field(50003; Attachments; Boolean)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Document Attachment" where(
                                                            "Table ID" = const(18), "No." = field("No.")));


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
    begin
        //>> ST
        Blocked := Blocked::All;
        //<< ST
    end;
}
