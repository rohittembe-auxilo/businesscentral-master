Table 50102 "ALM Sequence"
{

    fields
    {
        field(1; "Seq. No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Source; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                Clear(GLAccList);
                GLAccList.LookupMode(true);
                if GLAccList.RunModal = Action::LookupOK then
                    Validate(Source, GLAccList.GetSelectionFilter);

            end;
        }
        field(4; "RBI Code"; Code[50])
        {
        }
        field(5; "RBI Code SUM"; Code[80])
        {
            Description = '//CCIT_kj';
        }
        field(6; Source_Date_Range; Option)
        {
            Description = '//CCIT_kj';
            OptionCaption = ' ,1 to 7 days,8 to 14 days,15 to 1 Month,1 Month to 2 Months,2 Month to 3 Months,3 Month To 6 Months,6 Month To 1 Year,1 Year to 3 Year,3 year to 5 Years,Over 5 Years';
            OptionMembers = " ","1 to 7 days","8 to 14 days","15 to 1 Month","1 Month to 2 Months","2 Month to 3 Months","3 Month To 6 Months","6 Month To 1 Year","1 Year to 3 Year","3 year to 5 Years","Over 5 Years";
        }
        field(7; "1 to 7 days"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "8 to 14 days"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; "15 to 1 Month"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "1 Month to 2 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(11; "2 Month to 3 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12; "3 Month To 6 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(13; "6 Month To 1 Year"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(14; "1 Year to 3 Year"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(15; "3 year to 5 Years"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(16; "Over 5 Years"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(Key1; "Seq. No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccList: Page "G/L Account List";
}

