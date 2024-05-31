page 70002 ABSDialog
{
    PageType = ConfirmationDialog;
    ApplicationArea = All;
    Caption = 'ABSDialog';
    InsertAllowed = false;
    InstructionalText = 'Select Container You Want to open?';


    layout
    {
        area(Content)
        {
            field(Container; Container)
            {
                ApplicationArea = All;
                Importance = Standard;
                Caption = 'Container';
                TableRelation = "ABS Container setup"."Primary Key";
                trigger OnValidate()
                begin
                    SetContainer(Container);
                end;
            }
            field(Folder; ABScontainerType)
            {
                ApplicationArea = All;
                Importance = Standard;
                ShowCaption = false;
            }

        }
    }
    internal procedure GetResult(var Container2: Text; var ABScontainerType2: Enum ABSEnum);
    begin
        Container2 := Container;
        ABScontainerType2 := ABScontainerType;
    end;

    internal procedure SetContainer(Container2: Code[10])
    begin
        Container := Container2;
    end;

    var
        ABScontainerType: Enum ABSEnum;
        Container: Code[10];

}