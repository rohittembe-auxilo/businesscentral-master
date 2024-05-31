Table 50103 "Memorandom Entry"
{
    //DrillDownPageID = 50116;
    // LookupPageID = 50116;

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Document Type"; Text[30])
        {
        }
        field(6; "G/L Account No."; Code[20])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                GLAccount.Reset();
                GLAccount.SetRange("No.", "G/L Account No.");
                if GLAccount.Find('-') then begin
                    "Gen. Bus Posting Group" := GLAccount."Gen. Bus. Posting Group";
                    "Gen. Prod Posting Group" := GLAccount."Gen. Prod. Posting Group";
                    "Gen. Posting Type" := GLAccount."Gen. Posting Type";
                    "G/L Account Name" := GLAccount.Name;

                end;
            end;
        }
        field(7; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale';
            OptionMembers = " ",Purchase,Sale;
        }
        field(8; "Gen. Bus Posting Group"; Text[30])
        {
        }
        field(9; "Gen. Prod Posting Group"; Text[30])
        {
        }
        field(10; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount < 0 then begin
                    "Credit Amount" := Abs(Amount);
                    "Debit Amount" := 0;
                end else if Amount > 0 then begin
                    "Debit Amount" := (Amount);
                    "Credit Amount" := 0;
                end;
            end;
        }
        field(11; "Debit Amount"; Decimal)
        {
        }
        field(12; "Credit Amount"; Decimal)
        {
        }
        field(13; Posted; Boolean)
        {
        }
        field(14; "G/L Account Name"; Text[100])
        {
        }
        field(15; "General Journal Created"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "G/L Account No.", "Posting Date", Posted)
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Document No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        MemorandomEntry.Reset;
        MemorandomEntry.SetCurrentkey("Entry No.");
        if MemorandomEntry.FindLast then
            "Entry No." := MemorandomEntry."Entry No." + 1
        else
            "Entry No." := 1;
    end;

    var
        MemorandomEntry: Record "Memorandom Entry";
        GLAccount: Record "G/L Account";
}

