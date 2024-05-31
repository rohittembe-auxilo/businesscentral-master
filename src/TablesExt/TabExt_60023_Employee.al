tableextension 60023 Employee_ext extends Employee
{
    fields
    {
        field(50000; "ESI No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50001; "PF No."; Code[15])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50002; "UAN No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50003; "Aadhar No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50004; "Bank A/C No."; Code[15])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50005; "Bank Name"; Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50006; "IFSC Code"; Code[11])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50007; Branch; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50008; "Reporting Manager"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            TableRelation = Employee."No.";
        }
        field(50009; "Emergency Contact Person"; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            TableRelation = "Employee Relative"."Relative Code" where("Employee No."=field("No."));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
            // //ABS 1225 18092020 BEGIN
            // IF "Emergency Contact Person"<>'' THEN BEGIN
            //  IF "Emergency Contact No."<>'' THEN BEGIN
            //    Rec_EmployeeRelative.RESET;
            //    Rec_EmployeeRelative.SETRANGE("Employee No.","No.");
            //    Rec_EmployeeRelative.SETRANGE("Relative Code","Emergency Contact Person");
            //    IF Rec_EmployeeRelative.FINDSET THEN BEGIN
            //      "Emergency Contact No.":=Rec_EmployeeRelative."Phone No.";
            //    END;
            //  END;
            // END;
            // //ABS 1225 18092020 END
            end;
        }
        field(50010; "Emergency Contact No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50011; "Permanent Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50012; "Permanent Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50013; "Permanent Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            Description = 'ABS 1225//IF (Country/Region Code=CONST()) "Post Code" ELSE IF (Country/Region Code=FILTER(<>'''')) "Post Code" WHERE (Country/Region Code=FIELD(Country/Region Code))';

            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
            trigger OnValidate()
            begin
            //PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(50014; "Permanent City"; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            Description = 'ABS 1225//IF (Country/Region Code=CONST()) "Post Code".City ELSE IF (Country/Region Code=FILTER(<>'''')) "Post Code".City WHERE (Country/Region Code=FIELD(Country/Region Code))';

            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
            trigger OnValidate()
            begin
            //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(50015; "Permanent Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            TableRelation = "Country/Region";
        }
        field(50016; "Probationary Review Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50017; "Recruitment Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            OptionCaption = ' ,Online Portal,Recruitment Agency,Employee Referral, Walk In';
            OptionMembers = " ", "Online Portal", "Recruitment Agency", "Employee Referral", " Walk In";

            trigger OnValidate()
            begin
            // IF "Recruitment Type"<>"Recruitment Type"::"Recruitment Agency" THEN BEGIN
            //  CLEAR("Reffered By");
            // END;
            end;
        }
        field(50018; "Reffered By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
            // IF "Recruitment Type"<>"Recruitment Type"::"Employee Referral" THEN BEGIN
            //  ERROR('Recruitment Type can not be %1',"Recruitment Type");
            // END;
            end;
        }
        field(50019; "SIM Card"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
            OptionCaption = ' ,Owned,Ralco';
            OptionMembers = " ", Owned, Ralco;
        }
        field(50020; "Eligible Tele. Expense Amt."; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50021; "Eligible Travel Length in KM"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
        field(50022; "Petty Cash User"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'ABS 1225';
        }
    }
}
