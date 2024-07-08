tableextension 60043 ReversalEntry extends "Reversal Entry"
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    procedure ReverseEntries2(Number: Integer; RevType: Option Transaction,Register)
    var
        ReversalPost: Codeunit "Reversal-Post";
        ReverseTransactionEntries: Page "Reverse Transaction Entries";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeReverseEntries(Number, RevType, IsHandled);
        if IsHandled then
            exit;

        InsertReversalEntry(Number, RevType);
        TempReversalEntry.SetCurrentKey("Document No.", "Posting Date", "Entry Type", "Entry No.");
        if not HideDialog then begin
            if (BankAccountStatement."Statement No." <> '') and (BankAccountStatement."Bank Account No." <> '') then
                ReverseTransactionEntries.SetBankAccountStatement(BankAccountStatement);
            ReverseTransactionEntries.SetReversalEntries(TempReversalEntry);
            ReverseTransactionEntries.RunModal();
        end
        else begin
            ReversalPost.SetPrint(false);
            ReversalPost.SetHideDialog(HideWarningDialogs);
            ReversalPost.Run(TempReversalEntry);
        end;
        TempReversalEntry.DeleteAll();
    end;


    local procedure OnBeforeReverseEntries(Number: Integer; RevType: Integer; var IsHandled: Boolean)
    var
        TDSEntry: Record "TDS Entry";
        GLRegister: Record "G/L Register";
        GLEntry: Record "G/L Entry";
        TransactionNo: Integer;
        ClosedErr: Label 'You cannot reverse %1 No. %2 because the entry is closed.', Comment = '%1= Table Caption, %2= Entry No.';
        AlreadyReversedErr: Label 'You cannot reverse %1 No. %2 because the entry has already been involved in a reversal.', Comment = '%1 = TDS Entry Table Caption, %2 = Entry No.';
    begin
        if RevType = 0 then
            TransactionNo := Number
        else
            if GLRegister.Get(Number) then begin
                GLEntry.SetRange("Entry No.", GLRegister."From Entry No.", GLRegister."To Entry No.");
                if not GLEntry.FindFirst() then
                    exit
                else
                    TransactionNo := GLEntry."Transaction No.";
            end;

        TDSEntry.SetRange("Transaction No.", TransactionNo);
        if not TDSEntry.FindFirst() then
            exit;

        // CheckPostingDate(
        //   TDSEntry."Posting Date", TDSEntry.TableCaption, TDSEntry."Entry No.");

        if TDSEntry."TDS Paid" then
            Error(
              ClosedErr, TDSEntry.TableCaption, TDSEntry."Entry No.");

        if TDSEntry.Reversed then
            Error(AlreadyReversedErr, TDSEntry.TableCaption, TDSEntry."Entry No.");
    end;

    var
        BankAccountStatement: Record "Bank Account Statement";
}