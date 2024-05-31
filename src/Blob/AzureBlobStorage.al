page 70000 "Azure Blob Storage"
{
    ApplicationArea = All;
    Caption = 'Azure Blob Storage';
    PageType = List;
    SourceTable = "ABS Container setup";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Shared Access Key"; Rec."Shared Access Key")
                {
                    ToolTip = 'Specifies the value of the Shared Access Key field.';
                }
                field("In Container Name"; Rec."In Container Name")
                {
                    ToolTip = 'Specifies the value of the Container Name field.';
                }
                field("In Url"; Rec."In Url")
                {
                    ToolTip = 'Specifies the value of the In Url field.';
                }
                field("Error Container Name"; Rec."Error Container Name")
                {
                    ToolTip = 'Specifies the value of the Container Name field.';
                }
                field("Error Url"; Rec."Error Url")
                {
                    ToolTip = 'Specifies the value of the Error Url field.';
                }
                field("Out Container Name"; Rec."Out Container Name")
                {
                    ToolTip = 'Specifies the value of the Container Name field.';
                }
                field("Out Url"; Rec."Out Url")
                {
                    ToolTip = 'Specifies the value of the Out Url field.';
                }
            }
        }
    }
}
