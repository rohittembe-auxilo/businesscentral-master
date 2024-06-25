Table 50101 "ALM Lines"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Sequence; Text[30])
        {
        }
        field(4; Desc; Text[250])
        {
        }
        field(5; "BS Figure"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(6; "1 to 7 days"; Decimal)
        {
        }
        field(7; "8 to 14 days"; Decimal)
        {
        }
        field(8; "15 to 1 Month"; Decimal)
        {
        }
        field(9; "1 Month to 2 Months"; Decimal)
        {
        }
        field(10; "2 Month to 3 Months"; Decimal)
        {
        }
        field(11; "3 Month To 6 Months"; Decimal)
        {
        }
        field(12; "6 Month To 1 Year"; Decimal)
        {
        }
        field(13; "1 Year to 3 Year"; Decimal)
        {
        }
        field(14; "3 year to 5 Years"; Decimal)
        {
        }
        field(15; "Over 5 Years"; Decimal)
        {
        }
        field(16; Source; Text[250])
        {
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;// //

            trigger OnLookup()
            begin
                Clear(GLAccList);
                GLAccList.LookupMode(true);
                if GLAccList.RunModal = Action::LookupOK then
                    Validate(Source, GLAccList.GetSelectionFilter);

            end;
        }
        field(17; "RBI Code"; Code[50])
        {
        }
        field(18; "RBI Code SUM"; Code[80])
        {
            Description = '//CCIT_kj';
        }
        field(19; Source_Date_Range; Option)
        {
            Description = '//CCIT_kj';
            OptionCaption = ' ,1 to 7 days,8 to 14 days,15 to 1 Month,1 Month to 2 Months,2 Month to 3 Months,3 Month To 6 Months,6 Month To 1 Year,1 Year to 3 Year,3 year to 5 Years,Over 5 Years';
            OptionMembers = " ","1 to 7 days","8 to 14 days","15 to 1 Month","1 Month to 2 Months","2 Month to 3 Months","3 Month To 6 Months","6 Month To 1 Year","1 Year to 3 Year","3 year to 5 Years","Over 5 Years";
        }
        field(20; "1to 7 days"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(21; "8to 14 days"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(22; "15to 1 Month"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(23; "1Month to 2 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(24; "2Month to 3 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(25; "3Month To 6 Months"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(26; "6Month To 1 Year"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(27; "1Year to 3 Year"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(28; "3year to 5 Years"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(29; "Over5 Years"; Text[250])
        {
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(30; Difference; Decimal)
        {
            Description = 'CCIT AN';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
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

