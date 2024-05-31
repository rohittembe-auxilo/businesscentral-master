Table 50117 "Deferral G/L Entries"
{
    Caption = 'Deferral G/L Entries';
    //v  DrillDownPageID = UnknownPage50036;
    //v  LookupPageID = UnknownPage50036;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";

        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';

            trigger OnLookup()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                IncomingDocument.HyperlinkToDocument("Document No.", "Posting Date");
            end;
        }
        field(7; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(10; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = if ("Bal. Account Type" = const("G/L Account")) "G/L Account"
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const("Bank Account")) "Bank Account"
            else if ("Bal. Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Bal. Account Type" = const("IC Partner")) "IC Partner";
        }
        field(17; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(27; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //v   UserMgt.LookupUserID("User ID");
            end;
        }
        field(28; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(29; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
        }
        field(30; "Prior-Year Entry"; Boolean)
        {
            Caption = 'Prior-Year Entry';
        }
        field(41; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(42; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(43; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(45; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(46; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(47; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(48; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(49; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(50; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(51; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(52; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(53; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(54; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(55; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;
        }
        field(56; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(57; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(58; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = if ("Source Type" = const(Customer)) Customer
            else if ("Source Type" = const(Vendor)) Vendor
            else if ("Source Type" = const("Bank Account")) "Bank Account"
            else if ("Source Type" = const("Fixed Asset")) "Fixed Asset";
        }
        field(59; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(60; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(61; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(62; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(63; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(64; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(65; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(68; "Additional-Currency Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Additional-Currency Amount';
        }
        field(69; "Add.-Currency Debit Amount"; Decimal)
        {
            AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Add.-Currency Debit Amount';
        }
        field(70; "Add.-Currency Credit Amount"; Decimal)
        {
            AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Add.-Currency Credit Amount';
        }
        field(71; "Close Income Statement Dim. ID"; Integer)
        {
            Caption = 'Close Income Statement Dim. ID';
        }
        field(72; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(73; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(74; "Reversed by Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed by Entry No.';
            TableRelation = "G/L Entry";
        }
        field(75; "Reversed Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed Entry No.';
            TableRelation = "G/L Entry";
        }
        field(76; "G/L Account Name"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account No.")));
            Caption = 'G/L Account Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = true;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(5400; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
        }
        field(5600; "FA Entry Type"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Entry Type';
            OptionCaption = ' ,Fixed Asset,Maintenance';
            OptionMembers = " ","Fixed Asset",Maintenance;
        }
        field(5601; "FA Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'FA Entry No.';
            TableRelation = if ("FA Entry Type" = const("Fixed Asset")) "FA Ledger Entry"
            else if ("FA Entry Type" = const(Maintenance)) "Maintenance Ledger Entry";
        }
        field(5618; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        field(13702; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
        }
        field(16500; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(16616; "Tax Type"; Option)
        {
            Caption = 'Tax Type';
            OptionCaption = ' ,Sales Tax,Excise,Service Tax';
            OptionMembers = " ","Sales Tax",Excise,"Service Tax";
        }
        field(16619; "GST Bill-to/BuyFrom State Code"; Code[10])
        {
            Caption = 'GST Bill-to/BuyFrom State Code';
            Editable = true;
            //v     TableRelation = State;
        }
        field(50002; "Shortcut Dimension 3"; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = filter('DEPARTMENT')));
            FieldClass = FlowField;
        }
        field(50003; "Shortcut Dimension 4"; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = filter('PRODUCT SEGMENT')));
            FieldClass = FlowField;
        }
        field(50004; "Purchase Comment"; Text[100])
        {
            CalcFormula = lookup("Purch. Comment Line".Comment where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50005; "Shortcut Dimension 8"; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = filter('LAN')));
            FieldClass = FlowField;
        }
        field(50010; "Creation DateTime"; DateTime)
        {
        }
        field(50011; "Creation Date"; Date)
        {
        }
        field(50012; "Purchase Comments"; Text[100])
        {
            CalcFormula = lookup("Purch. Comment Line".Comment where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50013; "Approver ID"; Code[50])
        {
        }
        field(50014; "RCM Invoice No"; Code[35])
        {
            CalcFormula = lookup("Purch. Inv. Header"."RCM Invoice No." where("No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "RCM Payment No"; Code[35])
        {
            CalcFormula = lookup("Purch. Inv. Header"."RCM Payment No." where("No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Shortcut Dimension 5"; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = filter('INVESTMENT')));
            FieldClass = FlowField;
        }
        field(50017; "RCM Invoice No."; Code[35])
        {
            CalcFormula = lookup("Purch. Inv. Header"."RCM Invoice No." where("No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "RCM Payment No."; Code[35])
        {
            CalcFormula = lookup("Purch. Inv. Header"."RCM Payment No." where("No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "GSTCredit 50%"; Boolean)
        {
        }
        field(50020; "MSME Type"; Option)
        {
            OptionMembers = " ",A,B,C,D,E,F;
        }
        field(50021; "Purch. Order No."; Code[35])
        {
        }
        field(50022; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            begin
                //TESTFIELD(Open,TRUE);
            end;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "G/L Account No.", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key3; "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date", "Location Code")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key4; "G/L Account No.", "Business Unit Code", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key5; "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key6; "Document No.", "Posting Date", Amount)
        {
        }
        key(Key7; "Transaction No.")
        {
        }
        key(Key8; "IC Partner Code")
        {
        }
        key(Key9; "G/L Account No.", "Job No.", "Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key10; "Posting Date", "G/L Account No.", "Dimension Set ID")
        {
            SumIndexFields = Amount;
        }
        key(Key11; "Posting Date", "Source Code", "Transaction No.")
        {
        }
        key(Key12; "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Close Income Statement Dim. ID", "Posting Date", "Location Code")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "G/L Account No.", "Posting Date", "Document Type", "Document No.")
        {
        }
    }

    trigger OnInsert()
    var
        GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
    begin
        //v    GenJnlPostPreview.SaveDefferalGLEntry(Rec);
        "Creation DateTime" := CurrentDatetime;
        "Creation Date" := Today;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLSetupRead: Boolean;


    procedure GetCurrencyCode(): Code[10]
    begin
        if not GLSetupRead then begin
            GLSetup.Get;
            GLSetupRead := true;
        end;
        exit(GLSetup."Additional Reporting Currency");
    end;


    procedure ShowValueEntries()
    var
        GLItemLedgRelation: Record "G/L - Item Ledger Relation";
        ValueEntry: Record "Value Entry";
        TempValueEntry: Record "Value Entry" temporary;
    begin
        GLItemLedgRelation.SetRange("G/L Entry No.", "Entry No.");
        if GLItemLedgRelation.FindSet then
            repeat
                ValueEntry.Get(GLItemLedgRelation."Value Entry No.");
                TempValueEntry.Init;
                TempValueEntry := ValueEntry;
                TempValueEntry.Insert;
            until GLItemLedgRelation.Next = 0;

        Page.RunModal(0, TempValueEntry);
    end;


    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Entry No."));
    end;


    procedure UpdateDebitCredit(Correction: Boolean)
    begin
        if ((Amount > 0) and (not Correction)) or
           ((Amount < 0) and Correction)
        then begin
            "Debit Amount" := Amount;
            "Credit Amount" := 0
        end else begin
            "Debit Amount" := 0;
            "Credit Amount" := -Amount;
        end;

        if (("Additional-Currency Amount" > 0) and (not Correction)) or
           (("Additional-Currency Amount" < 0) and Correction)
        then begin
            "Add.-Currency Debit Amount" := "Additional-Currency Amount";
            "Add.-Currency Credit Amount" := 0
        end else begin
            "Add.-Currency Debit Amount" := 0;
            "Add.-Currency Credit Amount" := -"Additional-Currency Amount";
        end;
    end;


    procedure CopyFromGenJnlLine(GlobalGLEntry: Record "G/L Entry")
    begin
        "Posting Date" := GlobalGLEntry."Posting Date";
        "G/L Account No." := GlobalGLEntry."G/L Account No.";
        "Document Date" := GlobalGLEntry."Document Date";
        "Document Type" := GlobalGLEntry."Document Type";
        "Document No." := GlobalGLEntry."Document No.";
        "External Document No." := GlobalGLEntry."External Document No.";
        Description := GlobalGLEntry.Description;
        "Business Unit Code" := GlobalGLEntry."Business Unit Code";
        //v   "Tax Type" := GlobalGLEntry."Tax Type";
        Amount := GlobalGLEntry.Amount;
        "Debit Amount" := GlobalGLEntry."Debit Amount";
        "Credit Amount" := GlobalGLEntry."Credit Amount";
        "Global Dimension 1 Code" := GlobalGLEntry."Global Dimension 1 Code";
        "Global Dimension 2 Code" := GlobalGLEntry."Global Dimension 2 Code";
        "Dimension Set ID" := GlobalGLEntry."Dimension Set ID";
        "Source Code" := GlobalGLEntry."Source Code";
        "Source Type" := GlobalGLEntry."Source Type";
        "Source No." := GlobalGLEntry."Source No.";
        "Job No." := GlobalGLEntry."Job No.";
        Quantity := GlobalGLEntry.Quantity;
        "Journal Batch Name" := GlobalGLEntry."Journal Batch Name";
        "Reason Code" := GlobalGLEntry."Reason Code";
        "User ID" := UserId;
        //"No. Series" := GlobalGLEntry."Posting No. Series";
        "IC Partner Code" := GlobalGLEntry."IC Partner Code";
        //v    "Location Code" := GlobalGLEntry."Location Code";
    end;


    procedure CopyPostingGroupsFromGLEntry(GLEntry: Record "G/L Entry")
    begin
        "Gen. Posting Type" := GLEntry."Gen. Posting Type";
        "Gen. Bus. Posting Group" := GLEntry."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := GLEntry."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := GLEntry."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := GLEntry."VAT Prod. Posting Group";
        "Tax Area Code" := GLEntry."Tax Area Code";
        "Tax Liable" := GLEntry."Tax Liable";
        "Tax Group Code" := GLEntry."Tax Group Code";
        "Use Tax" := GLEntry."Use Tax";
    end;


    procedure CopyPostingGroupsFromVATEntry(VATEntry: Record "VAT Entry")
    begin
        "Gen. Posting Type" := VATEntry.Type;
        "Gen. Bus. Posting Group" := VATEntry."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := VATEntry."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := VATEntry."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := VATEntry."VAT Prod. Posting Group";
        "Tax Area Code" := VATEntry."Tax Area Code";
        "Tax Liable" := VATEntry."Tax Liable";
        "Tax Group Code" := VATEntry."Tax Group Code";
        "Use Tax" := VATEntry."Use Tax";
    end;


    procedure CopyPostingGroupsFromGenJnlLine(GenJnlLine: Record "Gen. Journal Line")
    begin
        "Gen. Posting Type" := GenJnlLine."Gen. Posting Type";
        "Gen. Bus. Posting Group" := GenJnlLine."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := GenJnlLine."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := GenJnlLine."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := GenJnlLine."VAT Prod. Posting Group";
        "Tax Area Code" := GenJnlLine."Tax Area Code";
        "Tax Liable" := GenJnlLine."Tax Liable";
        "Tax Group Code" := GenJnlLine."Tax Group Code";
        "Use Tax" := GenJnlLine."Use Tax";
    end;


    procedure CopyPostingGroupsFromDtldCVBuf(DtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; GenPostingType: Option " ",Purchase,Sale,Settlement)
    begin
        "Gen. Posting Type" := GenPostingType;
        "Gen. Bus. Posting Group" := DtldCVLedgEntryBuf."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := DtldCVLedgEntryBuf."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := DtldCVLedgEntryBuf."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := DtldCVLedgEntryBuf."VAT Prod. Posting Group";
        "Tax Area Code" := DtldCVLedgEntryBuf."Tax Area Code";
        "Tax Liable" := DtldCVLedgEntryBuf."Tax Liable";
        "Tax Group Code" := DtldCVLedgEntryBuf."Tax Group Code";
        "Use Tax" := DtldCVLedgEntryBuf."Use Tax";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
    end;


    procedure CopyFromDeferralPostBuffer(DeferralPostBuffer: Record "Deferral Posting Buffer")
    begin
        "System-Created Entry" := DeferralPostBuffer."System-Created Entry";
        "Gen. Bus. Posting Group" := DeferralPostBuffer."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := DeferralPostBuffer."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := DeferralPostBuffer."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := DeferralPostBuffer."VAT Prod. Posting Group";
        "Tax Area Code" := DeferralPostBuffer."Tax Area Code";
        "Tax Liable" := DeferralPostBuffer."Tax Liable";
        "Tax Group Code" := DeferralPostBuffer."Tax Group Code";
        "Use Tax" := DeferralPostBuffer."Use Tax";
    end;
}

