/*Table 50130 "Gen. Journal Line Archive New"
{
    // LS = changes made by LS Retail
    // LSIN7.00.03 Field Added "Retail Service"
    // LSIN7.10.01 BLL 25.07.2017 - LS India GST Localization.

    Caption = 'Gen. Journal Line Archive';
    Permissions = TableData UnknownTableData1221 = rimd;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                          Blocked = const(false))
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            var
                CompanyInfo: Record "Company Information";
                Location: Record Location;
            begin
            end;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(6; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(8; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(10; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = if ("Bal. Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                               Blocked = const(false))
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const("Bank Account")) "Bank Account"
            else if ("Bal. Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Bal. Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            var
                CompanyInfo: Record "Company Information";
                Location: Record Location;
            begin
            end;
        }
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            var
            //   JnlBankCharges: Record "Jnl. Bank Charges";
            begin
            end;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                CustLedgerEntry1: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                VendLedgEntry1: Record "Vendor Ledger Entry";
                DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
                TransactionType: Option Purchase,Sales,Transfer,Settlement;
            begin
            end;
        }
        field(14; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(15; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(16; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(17; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            Editable = false;
        }
        field(18; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(19; "Sales/Purch. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales/Purch. (LCY)';
        }
        field(20; "Profit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Profit (LCY)';
        }
        field(21; "Inv. Discount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount (LCY)';
        }
        field(22; "Bill-to/Pay-to No."; Code[20])
        {
            Caption = 'Bill-to/Pay-to No.';
            Editable = false;
            TableRelation = if ("Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const(Vendor)) Vendor;
        }
        field(23; "Posting Group"; Code[10])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group";
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(26; "Salespers./Purch. Code"; Code[10])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(29; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
        }
        field(30; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(34; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
        }
        field(35; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(36; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
                //v  ServTaxEntry: Record "Service Tax Entry";
                AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
                AccNo: Code[20];
                TransactionType: Option Purchase,Sales,Transfer;
            begin
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                TempGenJnlLine: Record "Gen. Journal Line" temporary;
                VendLedgEntry2: Record "Vendor Ledger Entry";
                //v  ServTaxEntry: Record UnknownRecord16473;
                CustLedgerEntry2: Record "Cust. Ledger Entry";
                TransactionType: Option Purchase,Sales,Transfer;
                NotOpenedLookUpErr: label 'Please Drill Down and Select Appropriate HSN when applying a GST Document';
            begin
            end;
        }
        field(38; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(39; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(40; "Payment Discount %"; Decimal)
        {
            Caption = 'Payment Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(42; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(43; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(44; "VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(45; "VAT Posting"; Option)
        {
            Caption = 'VAT Posting';
            Editable = false;
            OptionCaption = 'Automatic VAT Entry,Manual VAT Entry';
            OptionMembers = "Automatic VAT Entry","Manual VAT Entry";
        }
        field(47; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(48; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';
        }
        field(50; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(51; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(52; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(53; "Recurring Method"; Option)
        {
            BlankZero = true;
            Caption = 'Recurring Method';
            OptionCaption = ' ,F  Fixed,V  Variable,B  Balance,RF Reversing Fixed,RV Reversing Variable,RB Reversing Balance';
            OptionMembers = " ","F  Fixed","V  Variable","B  Balance","RF Reversing Fixed","RV Reversing Variable","RB Reversing Balance";
        }
        field(54; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(55; "Recurring Frequency"; DateFormula)
        {
            Caption = 'Recurring Frequency';
        }
        field(56; "Allocated Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Gen. Jnl. Allocation".Amount where("Journal Template Name" = field("Journal Template Name"),
                                                                   "Journal Batch Name" = field("Journal Batch Name"),
                                                                   "Journal Line No." = field("Line No.")));
            Caption = 'Allocated Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(58; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(59; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(60; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(61; "EU 3-Party Trade"; Boolean)
        {
            Caption = 'EU 3-Party Trade';
            Editable = false;
        }
        field(62; "Allow Application"; Boolean)
        {
            Caption = 'Allow Application';
            InitValue = true;
        }
        field(63; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(64; "Bal. Gen. Posting Type"; Option)
        {
            Caption = 'Bal. Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(65; "Bal. Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Bal. Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(66; "Bal. Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Bal. Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(67; "Bal. VAT Calculation Type"; Option)
        {
            Caption = 'Bal. VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(68; "Bal. VAT %"; Decimal)
        {
            Caption = 'Bal. VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(69; "Bal. VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Amount';
        }
        field(70; "Bank Payment Type"; Option)
        {
            AccessByPermission = TableData "Bank Account" = R;
            Caption = 'Bank Payment Type';
            OptionCaption = ' ,Computer Check,Manual Check';
            OptionMembers = " ","Computer Check","Manual Check";
        }
        field(71; "VAT Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
        }
        field(72; "Bal. VAT Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Base Amount';
        }
        field(73; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(75; "Check Printed"; Boolean)
        {
            AccessByPermission = TableData "Check Ledger Entry" = R;
            Caption = 'Check Printed';
            Editable = false;
        }
        field(76; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;
        }
        field(77; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(78; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(79; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = if ("Source Type" = const(Customer)) Customer
            else if ("Source Type" = const(Vendor)) Vendor
            else if ("Source Type" = const("Bank Account")) "Bank Account"
            else if ("Source Type" = const("Fixed Asset")) "Fixed Asset";
        }
        field(80; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(82; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(83; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(84; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(85; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(86; "Bal. Tax Area Code"; Code[20])
        {
            Caption = 'Bal. Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(87; "Bal. Tax Liable"; Boolean)
        {
            Caption = 'Bal. Tax Liable';
        }
        field(88; "Bal. Tax Group Code"; Code[10])
        {
            Caption = 'Bal. Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(89; "Bal. Use Tax"; Boolean)
        {
            Caption = 'Bal. Use Tax';
        }
        field(90; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(91; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(92; "Bal. VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'Bal. VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(93; "Bal. VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'Bal. VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(95; "Additional-Currency Posting"; Option)
        {
            Caption = 'Additional-Currency Posting';
            Editable = false;
            OptionCaption = 'None,Amount Only,Additional-Currency Amount Only';
            OptionMembers = "None","Amount Only","Additional-Currency Amount Only";
        }
        field(98; "FA Add.-Currency Factor"; Decimal)
        {
            Caption = 'FA Add.-Currency Factor';
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
        field(99; "Source Currency Code"; Code[10])
        {
            Caption = 'Source Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(100; "Source Currency Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Source Currency Amount';
            Editable = false;
        }
        field(101; "Source Curr. VAT Base Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Source Curr. VAT Base Amount';
            Editable = false;
        }
        field(102; "Source Curr. VAT Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Source Curr. VAT Amount';
            Editable = false;
        }
        field(103; "VAT Base Discount %"; Decimal)
        {
            Caption = 'VAT Base Discount %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(104; "VAT Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount (LCY)';
            Editable = false;
        }
        field(105; "VAT Base Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount (LCY)';
            Editable = false;
        }
        field(106; "Bal. VAT Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Bal. VAT Amount (LCY)';
            Editable = false;
        }
        field(107; "Bal. VAT Base Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Bal. VAT Base Amount (LCY)';
            Editable = false;
        }
        field(108; "Reversing Entry"; Boolean)
        {
            Caption = 'Reversing Entry';
            Editable = false;
        }
        field(109; "Allow Zero-Amount Posting"; Boolean)
        {
            Caption = 'Allow Zero-Amount Posting';
            Editable = false;
        }
        field(110; "Ship-to/Order Address Code"; Code[10])
        {
            Caption = 'Ship-to/Order Address Code';
            TableRelation = if ("Account Type" = const(Customer)) "Ship-to Address".Code where("Customer No." = field("Bill-to/Pay-to No."))
            else if ("Account Type" = const(Vendor)) "Order Address".Code where("Vendor No." = field("Bill-to/Pay-to No."))
            else if ("Bal. Account Type" = const(Customer)) "Ship-to Address".Code where("Customer No." = field("Bill-to/Pay-to No."))
            else if ("Bal. Account Type" = const(Vendor)) "Order Address".Code where("Vendor No." = field("Bill-to/Pay-to No."));
        }
        field(111; "VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            Editable = false;
        }
        field(112; "Bal. VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Difference';
            Editable = false;
        }
        field(113; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(114; "IC Direction"; Option)
        {
            Caption = 'IC Direction';
            OptionCaption = 'Outgoing,Incoming';
            OptionMembers = Outgoing,Incoming;
        }
        field(116; "IC Partner G/L Acc. No."; Code[20])
        {
            Caption = 'IC Partner G/L Acc. No.';
            TableRelation = "IC G/L Account";

            trigger OnValidate()
            var
                ICGLAccount: Record "IC G/L Account";
            begin
            end;
        }
        field(117; "IC Partner Transaction No."; Integer)
        {
            Caption = 'IC Partner Transaction No.';
            Editable = false;
        }
        field(118; "Sell-to/Buy-from No."; Code[20])
        {
            Caption = 'Sell-to/Buy-from No.';
            TableRelation = if ("Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const(Vendor)) Vendor;
        }
        field(119; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
            end;
        }
        field(120; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(121; Prepayment; Boolean)
        {
            Caption = 'Prepayment';
        }
        field(122; "Financial Void"; Boolean)
        {
            Caption = 'Financial Void';
            Editable = false;
        }
        field(165; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";

            trigger OnValidate()
            var
                IncomingDocument: Record "Incoming Document";
            begin
            end;
        }
        field(170; "Creditor No."; Code[20])
        {
            Caption = 'Creditor No.';
            Numeric = true;
        }
        field(171; "Payment Reference"; Code[50])
        {
            Caption = 'Payment Reference';
            Numeric = true;
        }
        field(172; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(173; "Applies-to Ext. Doc. No."; Code[35])
        {
            Caption = 'Applies-to Ext. Doc. No.';
        }
        field(288; "Recipient Bank Account"; Code[10])
        {
            Caption = 'Recipient Bank Account';
            TableRelation = if ("Account Type" = const(Customer)) "Customer Bank Account".Code where("Customer No." = field("Account No."))
            else if ("Account Type" = const(Vendor)) "Vendor Bank Account".Code where("Vendor No." = field("Account No."))
            else if ("Bal. Account Type" = const(Customer)) "Customer Bank Account".Code where("Customer No." = field("Bal. Account No."))
            else if ("Bal. Account Type" = const(Vendor)) "Vendor Bank Account".Code where("Vendor No." = field("Bal. Account No."));
        }
        field(289; "Message to Recipient"; Text[140])
        {
            Caption = 'Message to Recipient';
        }
        field(290; "Exported to Payment File"; Boolean)
        {
            Caption = 'Exported to Payment File';
            Editable = false;
        }
        field(291; "Has Payment Export Error"; Boolean)
        {
            CalcFormula = exist("Payment Jnl. Export Error Text" where("Journal Template Name" = field("Journal Template Name"),
                                                                        "Journal Batch Name" = field("Journal Batch Name"),
                                                                        "Journal Line No." = field("Line No.")));
            Caption = 'Has Payment Export Error';
            Editable = false;
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;
            end;
        }
        field(827; "Credit Card No."; Code[20])
        {
            Caption = 'Credit Card No.';
            TableRelation = if ("Account Type" = const(Customer),
                                "Document Type" = filter(Payment | Refund),
                                "Bal. Account Type" = const("Bank Account")) "DO Payment Credit Card" where("Customer No." = field("Account No."));

            trigger OnValidate()
            var
            //v DOPaymentMgt: Codeunit "do pay"
            begin
            end;
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        }
        field(1002; "Job Unit Price (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 2;
            Caption = 'Job Unit Price (LCY)';
            Editable = false;
        }
        field(1003; "Job Total Price (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 1;
            Caption = 'Job Total Price (LCY)';
            Editable = false;
        }
        field(1004; "Job Quantity"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            Caption = 'Job Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(1005; "Job Unit Cost (LCY)"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatType = 2;
            Caption = 'Job Unit Cost (LCY)';
            Editable = false;
        }
        field(1006; "Job Line Discount %"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatType = 1;
            Caption = 'Job Line Discount %';
        }
        field(1007; "Job Line Disc. Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Line Disc. Amount (LCY)';
            Editable = false;
        }
        field(1008; "Job Unit Of Measure Code"; Code[10])
        {
            Caption = 'Job Unit Of Measure Code';
            TableRelation = "Unit of Measure";
        }
        field(1009; "Job Line Type"; Option)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            Caption = 'Job Line Type';
            OptionCaption = ' ,Schedule,Contract,Both Schedule and Contract';
            OptionMembers = " ",Schedule,Contract,"Both Schedule and Contract";
        }
        field(1010; "Job Unit Price"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 2;
            Caption = 'Job Unit Price';
        }
        field(1011; "Job Total Price"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Total Price';
            Editable = false;
        }
        field(1012; "Job Unit Cost"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 2;
            Caption = 'Job Unit Cost';
            Editable = false;
        }
        field(1013; "Job Total Cost"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Total Cost';
            Editable = false;
        }
        field(1014; "Job Line Discount Amount"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Line Discount Amount';
        }
        field(1015; "Job Line Amount"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Line Amount';
        }
        field(1016; "Job Total Cost (LCY)"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatType = 1;
            Caption = 'Job Total Cost (LCY)';
            Editable = false;
        }
        field(1017; "Job Line Amount (LCY)"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            AutoFormatType = 1;
            Caption = 'Job Line Amount (LCY)';
            Editable = false;
        }
        field(1018; "Job Currency Factor"; Decimal)
        {
            Caption = 'Job Currency Factor';
        }
        field(1019; "Job Currency Code"; Code[10])
        {
            Caption = 'Job Currency Code';
        }
        field(1020; "Job Planning Line No."; Integer)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            BlankZero = true;
            Caption = 'Job Planning Line No.';

            trigger OnLookup()
            var
                JobPlanningLine: Record UnknownRecord1003;
            begin
            end;

            trigger OnValidate()
            var
                JobPlanningLine: Record UnknownRecord1003;
            begin
            end;
        }
        field(1030; "Job Remaining Qty."; Decimal)
        {
            AccessByPermission = TableData UnknownTableData167 = R;
            Caption = 'Job Remaining Qty.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                JobPlanningLine: Record UnknownRecord1003;
            begin
            end;
        }
        field(1200; "Direct Debit Mandate ID"; Code[35])
        {
            Caption = 'Direct Debit Mandate ID';
            TableRelation = if ("Account Type" = const(Customer)) "SEPA Direct Debit Mandate" where("Customer No." = field("Account No."));

            trigger OnValidate()
            var
                SEPADirectDebitMandate: Record UnknownRecord1230;
            begin
            end;
        }
        field(1220; "Data Exch. Entry No."; Integer)
        {
            Caption = 'Data Exch. Entry No.';
            Editable = false;
            TableRelation = "Data Exch.";
        }
        field(1221; "Payer Information"; Text[50])
        {
            Caption = 'Payer Information';
        }
        field(1222; "Transaction Information"; Text[100])
        {
            Caption = 'Transaction Information';
        }
        field(1223; "Data Exch. Line No."; Integer)
        {
            Caption = 'Data Exch. Line No.';
            Editable = false;
        }
        field(1224; "Applied Automatically"; Boolean)
        {
            Caption = 'Applied Automatically';
        }
        field(1700; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            TableRelation = "Deferral Template"."Deferral Code";

            trigger OnValidate()
            var
                DeferralUtilities: Codeunit UnknownCodeunit1720;
            begin
            end;
        }
        field(1701; "Deferral Line No."; Integer)
        {
            Caption = 'Deferral Line No.';
        }
        field(5050; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(5400; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            Editable = false;
        }
        field(5600; "FA Posting Date"; Date)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'FA Posting Date';
        }
        field(5601; "FA Posting Type"; Option)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'FA Posting Type';
            OptionCaption = ' ,Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Disposal,Maintenance';
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance;
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";
        }
        field(5603; "Salvage Value"; Decimal)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            AutoFormatType = 1;
            Caption = 'Salvage Value';
        }
        field(5604; "No. of Depreciation Days"; Integer)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            BlankZero = true;
            Caption = 'No. of Depreciation Days';
        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'Depr. until FA Posting Date';
        }
        field(5606; "Depr. Acquisition Cost"; Boolean)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'Depr. Acquisition Cost';
        }
        field(5609; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            TableRelation = Maintenance;
        }
        field(5610; "Insurance No."; Code[20])
        {
            Caption = 'Insurance No.';
            TableRelation = Insurance;
        }
        field(5611; "Budgeted FA No."; Code[20])
        {
            Caption = 'Budgeted FA No.';
            TableRelation = "Fixed Asset";
        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {
            Caption = 'Duplicate in Depreciation Book';
            TableRelation = "Depreciation Book";
        }
        field(5613; "Use Duplication List"; Boolean)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'Use Duplication List';
        }
        field(5614; "FA Reclassification Entry"; Boolean)
        {
            AccessByPermission = TableData UnknownTableData5600 = R;
            Caption = 'FA Reclassification Entry';
        }
        field(5615; "FA Error Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'FA Error Entry No.';
            TableRelation = "FA Ledger Entry";
        }
        field(5616; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(5617; "Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
        }
        field(5618; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        field(13701; "Source Curr. Excise Amount"; Decimal)
        {
            Caption = 'Source Curr. Excise Amount';
            Editable = false;
        }
        field(13702; "Source Curr. Tax Amount"; Decimal)
        {
            Caption = 'Source Curr. Tax Amount';
            Editable = false;
        }
        field(13703; "State Code"; Code[10])
        {
            Caption = 'State Code';
        }
        field(13706; "Excise Bus. Posting Group"; Code[10])
        {
            Caption = 'Excise Bus. Posting Group';
        }
        field(13707; "Excise Prod. Posting Group"; Code[10])
        {
            Caption = 'Excise Prod. Posting Group';
        }
        field(13708; "Excise Amount"; Decimal)
        {
            Caption = 'Excise Amount';
            Editable = false;
        }
        field(13709; "BED %"; Decimal)
        {
            Caption = 'BED %';
            Editable = false;
        }
        field(13710; "BED Calculation Type"; Option)
        {
            Caption = 'BED Calculation Type';
            OptionCaption = 'Excise %,Amount/Unit,% of Accessable Value,Excise %+Amount/Unit,% of MRP';
            OptionMembers = "Excise %","Amount/Unit","% of Accessable Value","Excise %+Amount/Unit","% of MRP";
        }
        field(13711; "Amount Including Excise"; Decimal)
        {
            Caption = 'Amount Including Excise';
            Editable = false;
        }
        field(13712; "Excise Base Amount"; Decimal)
        {
            Caption = 'Excise Base Amount';
            Editable = false;
        }
        field(13716; "TDS/TCS Amount"; Decimal)
        {
            Caption = 'TDS/TCS Amount';
            Editable = false;
        }
        field(13717; "Service Tax"; Decimal)
        {
            Caption = 'Service Tax';
        }
        field(13718; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DecimalPlaces = 0 : 4;
        }
        field(13736; PLA; Boolean)
        {
            Caption = 'PLA';
        }
        field(13737; "Tax %"; Decimal)
        {
            Caption = 'Tax %';
        }
        field(13744; "Tax Base Amount"; Decimal)
        {
            Caption = 'Tax Base Amount';
        }
        field(13746; Cenvat; Boolean)
        {
            Caption = 'Cenvat';
        }
        field(13747; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;

            trigger OnValidate()
            var
                GenJournalBatch: Record UnknownRecord232;
            begin
            end;
        }
        field(13750; "Source Curr. Tax Base Amount"; Decimal)
        {
            Caption = 'Source Curr. Tax Base Amount';
            Editable = false;
        }
        field(13753; "Tax Amount (LCY)"; Decimal)
        {
            Caption = 'Tax Amount (LCY)';
        }
        field(13754; "Tax Base Amount (LCY)"; Decimal)
        {
            Caption = 'Tax Base Amount (LCY)';
        }
        field(13758; "TDS Nature of Deduction"; Code[10])
        {
            Caption = 'TDS Nature of Deduction';
            TableRelation = "TDS Nature of Deduction";

            trigger OnValidate()
            var
                CompanyInfo: Record UnknownRecord79;
                Location: Record UnknownRecord14;
            begin
            end;
        }
        field(13759; "Assessee Code"; Code[10])
        {
            Caption = 'Assessee Code';
            Editable = false;
            TableRelation = "Assessee Code";
        }
        field(13760; "TDS/TCS %"; Decimal)
        {
            Caption = 'TDS/TCS %';
            Editable = false;
        }
        field(13761; "TDS/TCS Amt Incl Surcharge"; Decimal)
        {
            Caption = 'TDS/TCS Amt Incl Surcharge';
            Editable = false;
        }
        field(13763; "Bal. TDS/TCS Including SHECESS"; Decimal)
        {
            Caption = 'Bal. TDS/TCS Including SHECESS';
            Editable = false;
        }
        field(13764; "Party Type"; Option)
        {
            BlankNumbers = DontBlank;
            Caption = 'Party Type';
            InitValue = " ";
            OptionCaption = ' ,Party,Customer,Vendor';
            OptionMembers = " ",Party,Customer,Vendor;
        }
        field(13765; "Party Code"; Code[20])
        {
            Caption = 'Party Code';
            TableRelation = if ("Party Type" = const(Party)) Party.Code
            else if ("Party Type" = const(Vendor)) Vendor."No."
            else if ("Party Type" = const(Customer)) Customer."No.";
        }
        field(13773; "Form Code"; Code[10])
        {
            Caption = 'Form Code';
            TableRelation = "Form Codes";
        }
        field(13774; "Form No."; Code[10])
        {
            Caption = 'Form No.';
            TableRelation = "Tax Forms Details";
        }
        field(13779; "LC No."; Code[20])
        {
            Caption = 'LC No.';
            TableRelation = "LC Detail"."No." where(Closed = const(No),
                                                     Released = const(Yes));
        }
        field(13780; "Work Tax Base Amount"; Decimal)
        {
            Caption = 'Work Tax Base Amount';
            Editable = true;
        }
        field(13781; "Work Tax %"; Decimal)
        {
            Caption = 'Work Tax %';
            Editable = false;
        }
        field(13782; "Work Tax Amount"; Decimal)
        {
            Caption = 'Work Tax Amount';
            Editable = false;
        }
        field(13786; "TDS Category"; Option)
        {
            Caption = 'TDS Category';
            OptionCaption = ' ,A,C,S,T';
            OptionMembers = " ",A,C,S,T;
        }
        field(13787; "Surcharge %"; Decimal)
        {
            Caption = 'Surcharge %';
            Editable = false;
        }
        field(13788; "Surcharge Amount"; Decimal)
        {
            Caption = 'Surcharge Amount';
            Editable = false;
        }
        field(13789; "Concessional Code"; Code[10])
        {
            Caption = 'Concessional Code';
            Editable = false;
            TableRelation = "Concessional Codes";
        }
        field(13790; "Work Tax Paid"; Boolean)
        {
            Caption = 'Work Tax Paid';
            Editable = false;
        }
        field(16301; "Pay TDS"; Boolean)
        {
            Caption = 'Pay TDS';
            Editable = false;
        }
        field(16302; "Pay Work Tax"; Boolean)
        {
            Caption = 'Pay Work Tax';
            Editable = false;
        }
        field(16303; "TDS Entry"; Boolean)
        {
            Caption = 'TDS Entry';
        }
        field(16304; "Pay Excise"; Boolean)
        {
            Caption = 'Pay Excise';
        }
        field(16307; "TDS/TCS Base Amount"; Decimal)
        {
            Caption = 'TDS/TCS Base Amount';
            Editable = false;
        }
        field(16308; "Challan No."; Code[20])
        {
            Caption = 'Challan No.';
        }
        field(16309; "Challan Date"; Date)
        {
            Caption = 'Challan Date';
        }
        field(16310; Adjustment; Boolean)
        {
            Caption = 'Adjustment';
            Editable = false;
        }
        field(16312; "Pay Sales Tax"; Boolean)
        {
            Caption = 'Pay Sales Tax';
            Editable = false;
        }
        field(16313; "E.C.C. No."; Code[20])
        {
            Caption = 'E.C.C. No.';
            TableRelation = "E.C.C. Nos.";
        }
        field(16340; "Balance Work Tax Amount"; Decimal)
        {
            Caption = 'Balance Work Tax Amount';
            Editable = false;
        }
        field(16350; "Pay VAT"; Boolean)
        {
            Caption = 'Pay VAT';
        }
        field(16351; "VAT Claim Amount"; Decimal)
        {
            Caption = 'VAT Claim Amount';

            trigger OnValidate()
            var
                VATValidation: Codeunit UnknownCodeunit16350;
            begin
            end;
        }
        field(16352; "Refund VAT"; Boolean)
        {
            Caption = 'Refund VAT';
        }
        field(16353; "Balance Surcharge Amount"; Decimal)
        {
            Caption = 'Balance Surcharge Amount';
            Editable = false;
        }
        field(16354; "Cheque Date"; Date)
        {
            Caption = 'Cheque Date';
        }
        field(16358; "Surcharge Base Amount"; Decimal)
        {
            Caption = 'Surcharge Base Amount';
            Editable = false;
        }
        field(16359; "TDS Group"; Option)
        {
            Caption = 'TDS Group';
            Editable = false;
            OptionCaption = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others,Rent for Plant & Machinery,Rent for Land & Building,Banking Services,Compensation On Immovable Property,PF Accumulated,Payment For Immovable Property';
            OptionMembers = " ",Contractor,Commission,Professional,Interest,Rent,Dividend,"Interest on Securities",Lotteries,"Insurance Commission",NSS,"Mutual fund",Brokerage,"Income from Units","Capital Assets","Horse Races","Sports Association","Payable to Non Residents","Income of Mutual Funds",Units,"Foreign Currency Bonds","FII from Securities",Others,"Rent for Plant & Machinery","Rent for Land & Building","Banking Services","Compensation On Immovable Property","PF Accumulated","Payment For Immovable Property";
        }
        field(16360; "Work Tax Nature Of Deduction"; Code[10])
        {
            Caption = 'Work Tax Nature Of Deduction';
            TableRelation = "TDS Nature of Deduction";
        }
        field(16361; "Work Tax Group"; Option)
        {
            Caption = 'Work Tax Group';
            Editable = false;
            OptionCaption = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others';
            OptionMembers = " ",Contractor,Commission,Professional,Interest,Rent,Dividend,"Interest on Securities",Lotteries,"Insurance Commission",NSS,"Mutual fund",Brokerage,"Income from Units","Capital Assets","Horse Races","Sports Association","Payable to Non Residents","Income of Mutual Funds",Units,"Foreign Currency Bonds","FII from Securities",Others;
        }
        field(16362; "Balance TDS/TCS Amount"; Decimal)
        {
            Caption = 'Balance TDS/TCS Amount';
            Editable = false;
        }
        field(16363; "Temp TDS/TCS Base"; Decimal)
        {
            Caption = 'Temp TDS/TCS Base';
        }
        field(16364; "Excise Posting"; Boolean)
        {
            Caption = 'Excise Posting';
        }
        field(16365; "Product Type"; Option)
        {
            Caption = 'Product Type';
            OptionCaption = ',Item,FA';
            OptionMembers = ,Item,FA;
        }
        field(16366; "Excise Charge"; Boolean)
        {
            Caption = 'Excise Charge';
        }
        field(16370; "Deferred Claim FA Excise"; Boolean)
        {
            Caption = 'Deferred Claim FA Excise';
            Editable = false;
        }
        field(16372; "Cheque No."; Code[10])
        {
            Caption = 'Cheque No.';
        }
        field(16374; Deferred; Boolean)
        {
            Caption = 'Deferred';
        }
        field(16375; "Service Tax Type"; Option)
        {
            Caption = 'Service Tax Type';
            OptionCaption = 'Sale,Purchase,Charge';
            OptionMembers = Sale,Purchase,Charge;
        }
        field(16376; "Service Tax Group Code"; Code[20])
        {
            Caption = 'Service Tax Group Code';
            TableRelation = "Service Tax Groups".Code;
        }
        field(16377; "Service Tax Registration No."; Code[20])
        {
            Caption = 'Service Tax Registration No.';
            TableRelation = "Service Tax Registration Nos.".Code;
        }
        field(16378; "Service Tax Base Amount (LCY)"; Decimal)
        {
            Caption = 'Service Tax Base Amount (LCY)';
            Editable = true;

            trigger OnValidate()
            var
                ServiceTaxSetup: Record UnknownRecord16472;
            begin
            end;
        }
        field(16379; "Service Tax Amount"; Decimal)
        {
            Caption = 'Service Tax Amount';
            Editable = false;
        }
        field(16382; "Service Tax Entry"; Boolean)
        {
            Caption = 'Service Tax Entry';
        }
        field(16383; "eCESS %"; Decimal)
        {
            Caption = 'eCESS %';
            Editable = false;
        }
        field(16384; "eCESS on TDS/TCS Amount"; Decimal)
        {
            Caption = 'eCESS on TDS/TCS Amount';
            Editable = false;
        }
        field(16385; "Total TDS/TCS Incl. SHE CESS"; Decimal)
        {
            Caption = 'Total TDS/TCS Incl. SHE CESS';
            Editable = false;
        }
        field(16388; "Balance eCESS on TDS/TCS Amt"; Decimal)
        {
            Caption = 'Balance eCESS on TDS/TCS Amt';
        }
        field(16389; "Per Contract"; Boolean)
        {
            Caption = 'Per Contract';
        }
        field(16390; "Capital Item"; Boolean)
        {
            Caption = 'Capital Item';
        }
        field(16391; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(16406; "Service Tax eCess Amount"; Decimal)
        {
            Caption = 'Service Tax eCess Amount';
        }
        field(16460; "Goes to Excise Entry"; Boolean)
        {
            Caption = 'Goes to Excise Entry';
            Editable = false;
        }
        field(16461; "From Excise"; Boolean)
        {
            Caption = 'From Excise';
            Editable = false;
        }
        field(16478; "T.A.N. No."; Code[10])
        {
            Caption = 'T.A.N. No.';
            TableRelation = "T.A.N. Nos.";
        }
        field(16491; "VAT Type"; Option)
        {
            Caption = 'VAT Type';
            OptionCaption = ' ,Item,Capital Goods';
            OptionMembers = " ",Item,"Capital Goods";
        }
        field(16492; "TDS From Orders"; Boolean)
        {
            Caption = 'TDS From Orders';
        }
        field(16493; "Consignment Note No."; Code[20])
        {
            Caption = 'Consignment Note No.';
        }
        field(16494; "Declaration Form (GTA)"; Boolean)
        {
            Caption = 'Declaration Form (GTA)';

            trigger OnValidate()
            begin
                //CalculateServiceTax;
            end;
        }
        field(16496; "Service Type (Rev. Chrg.)"; Option)
        {
            Caption = 'Service Type (Rev. Chrg.)';
            OptionCaption = ' ,Inward,Outward Stock Transfer,Outward Input Service,Outward';
            OptionMembers = " ",Inward,"Outward Stock Transfer","Outward Input Service",Outward;
        }
        field(16500; "TCS Nature of Collection"; Code[10])
        {
            Caption = 'TCS Nature of Collection';
            TableRelation = "TCS Nature Of Collection";

            trigger OnLookup()
            var
                NatureOfCollection: Record UnknownRecord16507;
                TempNatureOfCollection: Record UnknownRecord16507 temporary;
            begin
            end;

            trigger OnValidate()
            var
                CompanyInfo: Record UnknownRecord79;
                Location: Record UnknownRecord14;
            begin
            end;
        }
        field(16502; "Pay TCS"; Boolean)
        {
            Caption = 'Pay TCS';
        }
        field(16503; "TCS Entry"; Boolean)
        {
            Caption = 'TCS Entry';
        }
        field(16504; "TCS Type"; Option)
        {
            Caption = 'TCS Type';
            OptionCaption = ' ,A,B,C,D,E,F,G,H,I,J,K,L,M,N';
            OptionMembers = " ",A,B,C,D,E,F,G,H,I,J,K,L,M,N;
        }
        field(16505; "T.C.A.N. No."; Code[10])
        {
            Caption = 'T.C.A.N. No.';
            TableRelation = "T.C.A.N. No.";
        }
        field(16506; "TCS From Orders"; Boolean)
        {
            Caption = 'TCS From Orders';
        }
        field(16507; "FA Shift Line No."; Integer)
        {
            Caption = 'FA Shift Line No.';

            trigger OnLookup()
            var
            // FAShift: Record "FA Shift";
            begin
            end;
        }
        field(16508; "Non ITC Claimable Usage %"; Decimal)
        {
            Caption = 'Non ITC Claimable Usage %';
            Editable = true;
            MinValue = 0;
        }
        field(16509; "Input Credit/Output Tax Amount"; Decimal)
        {
            Caption = 'Input Credit/Output Tax Amount';
            Editable = false;
        }
        field(16510; "Amount Loaded on Item"; Decimal)
        {
            Caption = 'Amount Loaded on Item';
            Editable = false;
        }
        field(16518; "Tax Amount Loaded on Inventory"; Decimal)
        {
            Caption = 'Tax Amount Loaded on Inventory';
        }
        field(16519; Deferment; Boolean)
        {
            Caption = 'Deferment';
        }
        field(16520; "VAT Entry"; Boolean)
        {
            Caption = 'VAT Entry';
        }
        field(16521; "Standard Deduction Amount"; Decimal)
        {
            Caption = 'Standard Deduction Amount';
        }
        field(16522; "Service Tax Rounding Precision"; Decimal)
        {
            Caption = 'Service Tax Rounding Precision';
        }
        field(16523; "Service Tax Rounding Type"; Option)
        {
            Caption = 'Service Tax Rounding Type';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16525; "Standard Deduction Amount(ACY)"; Decimal)
        {
            Caption = 'Standard Deduction Amount(ACY)';
        }
        field(16526; "Input/Output Tax Amount"; Decimal)
        {
            Caption = 'Input/Output Tax Amount';
        }
        field(16527; "Excise Refund"; Boolean)
        {
            Caption = 'Excise Refund';
        }
        field(16528; "VAT Adjustment Entry"; Boolean)
        {
            Caption = 'VAT Adjustment Entry';
        }
        field(16529; Trading; Boolean)
        {
            Caption = 'Trading';
        }
        field(16530; "Sales Return Order"; Boolean)
        {
            Caption = 'Sales Return Order';
        }
        field(16531; "Excise as Service Tax Credit"; Boolean)
        {
            Caption = 'Excise as Service Tax Credit';
        }
        field(16532; "Serv. Tax on Advance Payment"; Boolean)
        {
            Caption = 'Serv. Tax on Advance Payment';
        }
        field(16533; "Transaction No. Serv. Tax"; Integer)
        {
            Caption = 'Transaction No. Serv. Tax';
        }
        field(16534; "ADC VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'ADC VAT Amount';
            Editable = false;
        }
        field(16537; CVD; Boolean)
        {
            Caption = 'CVD';
        }
        field(16539; "Source Curr. ADC VAT Amount"; Decimal)
        {
            Caption = 'Source Curr. ADC VAT Amount';
            Editable = false;
        }
        field(16547; "Service Tax SHE Cess Amount"; Decimal)
        {
            Caption = 'Service Tax SHE Cess Amount';
        }
        field(16548; "SHE Cess % on TDS/TCS"; Decimal)
        {
            Caption = 'SHE Cess % on TDS/TCS';
            Editable = false;
        }
        field(16549; "SHE Cess on TDS/TCS Amount"; Decimal)
        {
            Caption = 'SHE Cess on TDS/TCS Amount';
            Editable = false;
        }
        field(16553; "Bal. SHE Cess on TDS/TCS Amt"; Decimal)
        {
            Caption = 'Bal. SHE Cess on TDS/TCS Amt';
            Editable = false;
        }
        field(16554; "TDS Certificate Receivable"; Boolean)
        {
            Caption = 'TDS Certificate Receivable';
        }
        field(16555; "Input Service Distribution"; Boolean)
        {
            Caption = 'Input Service Distribution';
        }
        field(16556; "Stale Cheque"; Boolean)
        {
            Caption = 'Stale Cheque';
        }
        field(16557; "ST Pure Agent"; Boolean)
        {
            Caption = 'ST Pure Agent';
        }
        field(16558; "Nature of Services"; Option)
        {
            Caption = 'Nature of Services';
            OptionCaption = ' ,Exempted,Export';
            OptionMembers = " ",Exempted,Export;
        }
        field(16559; "Work Tax % Applied"; Decimal)
        {
            Caption = 'Work Tax % Applied';
        }
        field(16560; "W.T Amount"; Decimal)
        {
            Caption = 'W.T Amount';
        }
        field(16561; "Work Tax"; Boolean)
        {
            Caption = 'Work Tax';
        }
        field(16562; "Reverse Work Tax"; Boolean)
        {
            Caption = 'Reverse Work Tax';
        }
        field(16563; "CWIP G/L Type"; Option)
        {
            Caption = 'CWIP G/L Type';
            OptionCaption = ' ,Labor,Material,Overheads';
            OptionMembers = " ",Labor,Material,Overheads;
        }
        field(16564; CWIP; Boolean)
        {
            Caption = 'CWIP';
            Editable = false;
        }
        field(16565; "Shift Type"; Option)
        {
            Caption = 'Shift Type';
            OptionCaption = 'Single,Double,Triple';
            OptionMembers = Single,Double,Triple;
        }
        field(16566; "Industry Type"; Option)
        {
            Caption = 'Industry Type';
            OptionCaption = 'Normal,Non Seasonal,Seasonal';
            OptionMembers = Normal,"Non Seasonal",Seasonal;
        }
        field(16567; "No. of Days for Shift"; Integer)
        {
            Caption = 'No. of Days for Shift';
            MinValue = 0;
        }
        field(16568; "VATable Purchase Tax"; Decimal)
        {
            Caption = 'VATable Purchase Tax';
        }
        field(16569; "Sale Return Type"; Option)
        {
            Caption = 'Sale Return Type';
            OptionCaption = ' ,Sales  Cancellation';
            OptionMembers = " ","Sales  Cancellation";
        }
        field(16570; "RG/Service Tax Set Off Date"; Date)
        {
            Caption = 'RG/Service Tax Set Off Date';
        }
        field(16571; "PLA Set Off Date"; Date)
        {
            Caption = 'PLA Set Off Date';
        }
        field(16572; "Insert S.T Recoverable"; Boolean)
        {
            Caption = 'Insert S.T Recoverable';
            Editable = false;
        }
        field(16573; "Offline Application"; Boolean)
        {
            Caption = 'Offline Application';
            Editable = false;
        }
        field(16574; "S.T From Order"; Boolean)
        {
            Caption = 'S.T From Order';
            Editable = false;
        }
        field(16575; "Un Application Entry"; Boolean)
        {
            Caption = 'Un Application Entry';
            Editable = false;
        }
        field(16576; "Include Serv. Tax in TDS Base"; Boolean)
        {
            Caption = 'Include Serv. Tax in TDS Base';

            trigger OnValidate()
            begin
                //CalculateTDS;
            end;
        }
        field(16577; "TDS Line Amount"; Decimal)
        {
            Caption = 'TDS Line Amount';
        }
        field(16578; Posting; Boolean)
        {
            Caption = 'Posting';
        }
        field(16579; "Applied TDS Base Amount"; Decimal)
        {
            Caption = 'Applied TDS Base Amount';
        }
        field(16580; PoT; Boolean)
        {
            Caption = 'PoT';
        }
        field(16581; "TDS/TCS Base Amount Applied"; Decimal)
        {
            Caption = 'TDS/TCS Base Amount Applied';
            Editable = false;
        }
        field(16582; "TDS/TCS Base Amount Adjusted"; Boolean)
        {
            Caption = 'TDS/TCS Base Amount Adjusted';
            Editable = false;
        }
        field(16583; "Work Tax Base Amount Applied"; Decimal)
        {
            Caption = 'Work Tax Base Amount Applied';
            Editable = false;
        }
        field(16584; "Work Tax Base Amount Adjusted"; Boolean)
        {
            Caption = 'Work Tax Base Amount Adjusted';
            Editable = false;
        }
        field(16585; "Tot. Serv Tax Amount (Intm)"; Decimal)
        {
            Caption = 'Tot. Serv Tax Amount (Intm)';
        }
        field(16586; "Nature of Remittance"; Code[10])
        {
            Caption = 'Nature of Remittance';
            TableRelation = "TDS Nature of Remittance";

            trigger OnLookup()
            var
                NatureOfRemittance: Record "TDS Nature of Remittance";
            begin
            end;
        }
        field(16587; "Act Applicable"; Option)
        {
            Caption = 'Act Applicable';
            OptionCaption = ' ,IT,DTAA';
            OptionMembers = " ",IT,DTAA;
        }
        field(16588; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            Editable = false;
            TableRelation = "Country/Region";
        }
        field(16589; "Service Tax SBC %"; Decimal)
        {
            Caption = 'Service Tax SBC %';
            Editable = false;
        }
        field(16590; "Service Tax SBC Amount"; Decimal)
        {
            Caption = 'Service Tax SBC Amount(LCY)';
            Editable = false;
        }
        field(16591; "Service Tax SBC Amount (Intm)"; Decimal)
        {
            Caption = 'Service Tax SBC Amount(Intm)';
            Editable = false;
        }
        field(16592; "SBC G/L Account"; Code[20])
        {
            Caption = 'SBC G/L Account';
            Editable = false;
        }
        field(16593; "KK Cess%"; Decimal)
        {
            Caption = 'KK Cess%';
            Editable = false;
        }
        field(16594; "KK Cess Amount"; Decimal)
        {
            Caption = 'KK Cess Amount';
            Editable = false;
        }
        field(16595; "KK Cess Amount (Intm)"; Decimal)
        {
            Caption = 'KK Cess Amount (Intm)';
            Editable = false;
        }
        field(16596; "KK Cess G/L Account"; Code[20])
        {
            Caption = 'KK Cess G/L Account';
            Editable = false;
        }
        field(16601; "Nature of Supply"; Option)
        {
            Caption = 'Nature of Supply';
            OptionCaption = 'B2B,B2C';
            OptionMembers = B2B,B2C;
        }
        field(16602; "GST Group Code"; Code[20])
        {
            Caption = 'GST Group Code';
            TableRelation = "GST Group";

            trigger OnValidate()
            var
                GSTGroup: Record "GST Group";
                SalesReceivablesSetup: Record "Sales & Receivables Setup";
            begin
            end;
        }
        field(16603; "GST Group Type"; Option)
        {
            Caption = 'GST Group Type';
            Editable = false;
            OptionCaption = 'Goods,Service';
            OptionMembers = Goods,Service;
        }
        field(16604; "GST Base Amount"; Decimal)
        {
            Caption = 'GST Base Amount';
            Editable = false;
        }
        field(16605; "GST %"; Decimal)
        {
            Caption = 'GST %';
            Editable = false;
        }
        field(16606; "Total GST Amount"; Decimal)
        {
            Caption = 'Total GST Amount';
            Editable = false;
        }
        field(16607; "GST Place of Supply"; Option)
        {
            Caption = 'GST Place of Supply';
            OptionCaption = ' ,Bill-to Address,Ship-to Address,Location Address';
            OptionMembers = " ","Bill-to Address","Ship-to Address","Location Address";
        }
        field(16608; "GST Customer Type"; Option)
        {
            Caption = 'GST Customer Type';
            Editable = false;
            OptionCaption = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit';
            OptionMembers = " ",Registered,Unregistered,Export,"Deemed Export",Exempted,"SEZ Development","SEZ Unit";
        }
        field(16609; "GST Vendor Type"; Option)
        {
            Caption = 'GST Vendor Type';
            Editable = false;
            OptionCaption = ' ,Registered,Composite,Unregistered,Import,Exempted,SEZ';
            OptionMembers = " ",Registered,Composite,Unregistered,Import,Exempted,SEZ;
        }
        field(16611; "HSN/SAC Code"; Code[8])
        {
            Caption = 'HSN/SAC Code';
            TableRelation = "HSN/SAC".Code where("GST Group Code" = field("GST Group Code"));

            trigger OnValidate()
            var
                GenJournalLine: Record UnknownRecord81;
            begin
            end;
        }
        field(16612; Exempted; Boolean)
        {
            Caption = 'Exempted';
        }
        field(16613; "GST Component Code"; Code[10])
        {
            Caption = 'GST Component Code';
            TableRelation = "GST Component";
        }
        field(16614; "GST on Advance Payment"; Boolean)
        {
            Caption = 'GST on Advance Payment';
        }
        field(16615; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = if ("Account Type" = const(Customer)) "Ship-to Address".Code where("Customer No." = field("Account No."));
        }
        field(16616; "Tax Type"; Option)
        {
            Caption = 'Tax Type';
            OptionCaption = ' ,Sales Tax,Excise,Service Tax';
            OptionMembers = " ","Sales Tax",Excise,"Service Tax";
        }
        field(16617; "GST Jurisdiction Type"; Option)
        {
            Caption = 'GST Jurisdiction Type';
            OptionCaption = 'Intrastate,Interstate';
            OptionMembers = Intrastate,Interstate;
        }
        field(16618; "Adv. Pmt. Adjustment"; Boolean)
        {
            Caption = 'Adv. Pmt. Adjustment';
        }
        field(16619; "GST Bill-to/BuyFrom State Code"; Code[10])
        {
            Caption = 'GST Bill-to/BuyFrom State Code';
            Editable = false;
            TableRelation = State;
        }
        field(16620; "GST Ship-to State Code"; Code[10])
        {
            Caption = 'GST Ship-to State Code';
            Editable = false;
            TableRelation = State;
        }
        field(16621; "Location State Code"; Code[10])
        {
            Caption = 'Location State Code';
            Editable = false;
            TableRelation = State;
        }
        field(16622; "GST Rounding Precision"; Decimal)
        {
            Caption = 'GST Rounding Precision';
        }
        field(16623; "GST Rounding Type"; Option)
        {
            Caption = 'GST Rounding Type';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16624; "GST Input Service Distribution"; Boolean)
        {
            Caption = 'GST Input Service Distribution';
        }
        field(16625; "GST Reverse Charge"; Boolean)
        {
            Caption = 'GST Reverse Charge';
            Editable = false;
        }
        field(50000; "Shortcut Dimension 8 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50004; "Shortcut Dimension 6 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50005; "Shortcut Dimension 7 Code"; Code[20])
        {

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(10000702; "Batch No."; Code[10])
        {
            Caption = 'Batch No.';
        }
        field(10000703; "Only Two Dimensions"; Boolean)
        {
            Caption = 'Only Two Dimensions';
        }
        field(10001350; "InStore-Created Entry"; Boolean)
        {
            Caption = 'InStore-Created Entry';
            Description = 'LS';
        }
        field(10016950; "Retail Service"; Boolean)
        {
            Description = 'LSIN7.00.03';
        }
        field(10016951; "Total GST Amount (LCY)"; Decimal)
        {
            Caption = 'Total GST Amount (LCY)';
            Description = 'LSIN7.10.01';
        }
        field(10016952; "GST Base Amount (LCY)"; Decimal)
        {
            Caption = 'GST Base Amount (LCY)';
            Description = 'LSIN7.10.01';
        }
        field(99001485; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
        }
        field(99001486; "Sell-to Contact No."; Code[20])
        {
            Caption = 'Sell-to Contact No.';
            Description = 'LS';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
            MaintainSIFTIndex = false;
            SumIndexFields = "Balance (LCY)";
        }
        key(Key2; "Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key3; "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.")
        {
        }
        key(Key4; "Document No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "Journal Template Name", "Journal Batch Name", "Location Code", "Document No.")
        {
        }
        key(Key6; "Incoming Document Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
    //v   TaxEntry: Record "tax entry";
    //v  JnlBankCharges: Record UnknownRecord16511;
    begin
    end;

    var
        Text000: label '%1 or %2 must be a G/L account or bank account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text001: label 'You must not specify %1 when %2 is %3.';
        Text002: label 'cannot be specified without %1';
        Text003: label 'The %1 in the %2 will be changed from %3 to %4.\Do you want to continue?';
        Text005: label 'The update has been interrupted to respect the warning.';
        Text006: label 'The %1 option can only be used internally in the system.';
        Text007: label '%1 or %2 must be a bank account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text008: label ' must be 0 when %1 is %2.';
        Text009: label 'LCY';
        Text010: label '%1 must be %2 or %3.';
        Text011: label '%1 must be negative.';
        Text012: label '%1 must be positive.';
        Text013: label 'The %1 must not be more than %2.';
        Text017: label 'Credit card %1 has already been performed for this %2, but posting failed. You must complete posting of the document of type %2 with the number %3.';
        GenJnlTemplate: Record UnknownRecord80;
        GenJnlBatch: Record UnknownRecord232;
        GenJnlLine: Record UnknownRecord81;
        GLAcc: Record UnknownRecord15;
        Cust: Record UnknownRecord18;
        Vend: Record UnknownRecord23;
        ICPartner: Record UnknownRecord413;
        Currency: Record UnknownRecord4;
        CurrExchRate: Record UnknownRecord330;
        PaymentTerms: Record UnknownRecord3;
        CustLedgEntry: Record UnknownRecord21;
        CustLedgEntry1: Record UnknownRecord21;
        VendLedgEntry: Record UnknownRecord25;
        VendLedgEntry1: Record UnknownRecord25;
        GenJnlAlloc: Record UnknownRecord221;
        VATPostingSetup: Record UnknownRecord325;
        BankAcc: Record UnknownRecord270;
        BankAcc2: Record UnknownRecord270;
        BankAcc3: Record UnknownRecord270;
        FA: Record UnknownRecord5600;
        FASetup: Record UnknownRecord5603;
        FADeprBook: Record UnknownRecord5612;
        GenBusPostingGrp: Record UnknownRecord250;
        GenProdPostingGrp: Record UnknownRecord251;
        GLSetup: Record UnknownRecord98;
        Job: Record UnknownRecord167;
        JobJnlLine: Record UnknownRecord210 temporary;
        NoSeriesMgt: Codeunit UnknownCodeunit396;
        CustCheckCreditLimit: Codeunit UnknownCodeunit312;
        SalesTaxCalculate: Codeunit UnknownCodeunit398;
        GenJnlApply: Codeunit UnknownCodeunit225;
        GenJnlShowCTEntries: Codeunit UnknownCodeunit16;
        CustEntrySetApplID: Codeunit UnknownCodeunit101;
        VendEntrySetApplID: Codeunit UnknownCodeunit111;
        DimMgt: Codeunit UnknownCodeunit408;
        PaymentToleranceMgt: Codeunit UnknownCodeunit426;
        DeferralUtilities: Codeunit UnknownCodeunit1720;
        ApprovalsMgmt: Codeunit UnknownCodeunit1535;
        Window: Dialog;
        DeferralDocType: Option Purchase,Sales,"G/L";
        FromCurrencyCode: Code[10];
        ToCurrencyCode: Code[10];
        CurrencyCode: Code[10];
        Text014: label 'The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?';
        TemplateFound: Boolean;
        Text015: label 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.';
        CurrencyDate: Date;
        SourceCodeSetup: Record UnknownRecord242;
        Text016: label '%1 must be G/L Account or Bank Account.';
        HideValidationDialog: Boolean;
        Text018: label '%1 can only be set when %2 is set.';
        Text019: label '%1 cannot be changed when %2 is set.';
        GLSetupRead: Boolean;
        TDSBuf: array[2] of Record UnknownRecord13714 temporary;
        TDSSetup: Record UnknownRecord13728;
        NODHeader: Record UnknownRecord13786;
        NODLines: Record UnknownRecord13785;
        TDSNOD: Record UnknownRecord13726;
        ExciseValidation: Codeunit UnknownCodeunit13702;
        TDSBaseLCY: Decimal;
        Text13701: label 'You are not allowed to select this Nature of Deduction.';
        TDSAmt: Decimal;
        Text13704: label 'Amount cannot be changed.';
        Text16350: label 'You cannot claim more than the VAT Payable Amount.';
        Text16351: label 'Bal. Account Type must be G/L Account or Bank Account.';
        Text16352: label '%1 Type must be G/L Account.';
        Text16353: label 'Balance Account No. must not be specified for VAT Refund.';
        Text16500: label '%1 cannot be entered for %2 %3.';
        Text16501: label 'You are not allowed to select this Nature of Collection.';
        NOCLine: Record UnknownRecord13785;
        TCSNOC: Record UnknownRecord16507;
        TCSBaseLCY: Decimal;
        TCSBuffer: array[2] of Record UnknownRecord16509 temporary;
        TCSSetup: Record UnknownRecord16508;
        ExCenvatClaimDetail: Record UnknownRecord16561;
        ExciseCenvatClaim: Record UnknownRecord16584;
        FieldNum: Integer;
        TDSEntry: Record UnknownRecord13729;
        PreviousJnlTDSCalculated: Decimal;
        TDSParty: Record td;
        Text16509: label 'PoT rules are not applicable for Input Service Distributor, Please ensure PoT value is False.';
        Text16510: label 'You can set %1 to Yes only if %2 is a payment or a refund.';
        Text16508: label 'You are not allowed to select this Nature of Remittance.';
        ExportAgainQst: label 'One or more of the selected lines have already been exported. Do you want to export them again?';
        NothingToExportErr: label 'There is nothing to export.';
        NotExistErr: label 'Document No. %1 does not exist or is already closed.';
        DocNoFilterErr: label 'The document numbers cannot be renumbered while there is an active filter on the Document No. field.';
        DueDateMsg: label 'This posting date will cause an overdue payment.';
        CalcPostDateMsg: label 'Processing payment journal lines #1##########';
        BlankShiptoCodeErr: label 'You must select Ship-to Code as ''GST Place of Supply'' is "Ship-to Address" on GST Group.';
        SimilarLocCodeErr: label 'You must select same Location Code value for a particular Document No. ';
        CompanyInformation: Record UnknownRecord79;
        CheckGSTDependencyErr: label 'You must select GST Dependency type either Ship-to Address or Bill-to Address in Sales & Receivable Setup.';
        Location: Record UnknownRecord14;
        GSTPostingSetup: Record UnknownRecord16406;
        CheckGLAccErr: label 'You cannot change the account no. as Tax Type is %1.', Comment = '%1=Tax Type';
        CannotApplyCustErr: label 'You cannot apply Cust. Ledger Entry No. %1 because the entry is part of a advance adjustment .', Comment = 'You cannot unapply Cust. Ledger Entry No. %1';
        CannotApplyVendErr: label 'You cannot unapply Vendor Ledger Entry No. %1 because the entry is part of advance adjustment.', Comment = 'You cannot unapply Vendor Ledger Entry No. %1';
        PlaceOfSupplyErr: label 'You cannot select Blank Place of Supply for Template %1 and Batch %2 for Line %3.', Comment = '%1 = Template, %2 = Batch, %3 = Line No.';
        GSTRelevantInfoErr: label 'You cannot change any GST Relevant Information of Refund Doument after Payment Application.';
        OpenedOnLookup: Boolean;
        GSTGroupReverseChargeErr: label 'GST Group Code %1 with Reverse Charge cannot be selected for Customer.', Comment = '%1 = GST Group Code';
        RefundUnapplicationErr: label 'You cannot apply Document No.%1 again as it has been previously applied against Refund %2 which was unapplied. Please reverse the Refund Document No.%3 first before proceeding further.', Comment = '%1 = Code,%2 = Code,%3 = Code';
        RetailSetupAlreadyRetrieved: Boolean;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        TestField("Check Printed", false);
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;
}

*/
