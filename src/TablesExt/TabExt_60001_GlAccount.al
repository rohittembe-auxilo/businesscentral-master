tableextension 60001 GlAccount_ext extends "G/L Account"
{
    fields
    {
        field(50000; "Shortcut Dimension 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3");
            end;
        }
        field(50001; TDS; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'TDS Section';
            Caption = 'TDS Section';
            TableRelation = "TDS Section";
        }
        field(50002; "Creation Date"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50003; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Pending Approval,Approved';
            OptionMembers = "Pending Approval",Approved;
        }
        field(50004; "Balance at Date Memorandum"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance at Date Memorandum';
            DataClassification = ToBeClassified;
            Description = 'Sum("Memorandom Entry".Amount WHERE (Posted=CONST(Yes), G/L Account No.=FIELD(No.), Posting Date=FIELD(UPPERLIMIT(Date Filter))))';
            Editable = false;
        }
        field(50005; "Net Change Memorandum"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Net Change Memorandum';
            DataClassification = ToBeClassified;
            Description = 'Sum("Memorandom Entry".Amount WHERE (Posted=CONST(Yes), G/L Account No.=FIELD(No.), Posting Date=FIELD(Date Filter)))';
            Editable = false;
        }
        field(60000; "GST Ledger Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",CGST,IGST,SGST;
        }
        field(60001; "Location Filter"; Code[10])
        {
            Caption = 'Location filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
    }
    trigger OnModify()
    begin
        //>> ST
        Blocked := true;
        //<< ST
    end;
}
