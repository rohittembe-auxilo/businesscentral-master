Table 50121 "EIR Line"
{

    fields
    {
        field(1; "Document No."; Code[25])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Repay Amount"; Decimal)
        {
        }
        field(4; "Balance for PFTCAL"; Decimal)
        {
        }
        field(5; "Disb Amount"; Decimal)
        {
        }
        field(6; "Principal SCHD"; Decimal)
        {
        }
        field(7; "Profit Calculation"; Decimal)
        {
        }
        field(8; "CPZ Amount"; Decimal)
        {
        }
        field(9; "Closing Balance"; Decimal)
        {
        }
        field(10; Income; Decimal)
        {
        }
        field(11; EIR; Decimal)
        {
            DecimalPlaces = 5 : 5;
        }
        field(12; "Opening Balance"; Decimal)
        {
        }
        field(13; "LAN No."; Code[10])
        {
        }
        field(14; "SCH Date"; Date)
        {
        }
        field(15; "Calculated Rate"; Decimal)
        {
        }
        field(16; "SCH Date Out"; Date)
        {
        }
        field(17; "Revised Disburshment Amt"; Decimal)
        {
        }
        field(18; "Repay Amount Out"; Decimal)
        {
        }
        field(19; Interest; Decimal)
        {
        }
        field(20; "Closing Balance Out"; Decimal)
        {
        }
        field(21; Amortization; Decimal)
        {
        }
        field(22; "Cumulative Amortization"; Decimal)
        {
        }
        field(23; Unamortization; Decimal)
        {
        }
        field(24; Cost; Decimal)
        {
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

    trigger OnInsert()
    begin
        CalculateEIR;
    end;

    trigger OnModify()
    begin
        CalculateEIR;
    end;

    local procedure CalculateEIR()
    var
        EIRLine: Record "EIR Line";
        EIRLine1: Record "EIR Line";
        EIRLine2: Record "EIR Line";
        DayDiff: Integer;
    begin

        "SCH Date Out" := "SCH Date";
        "Revised Disburshment Amt" := "Disb Amount" - Cost;
        "Repay Amount Out" := "Repay Amount";
        "Closing Balance Out" := "Opening Balance" + "Revised Disburshment Amt" - "Repay Amount Out" + Interest;
        Unamortization := Cost;


    end;
}

