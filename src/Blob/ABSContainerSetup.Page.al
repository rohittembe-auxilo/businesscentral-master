// page 70000 "Azure Blob Storage"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "ABS Container setup";

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Primary Key"; Rec."Primary Key")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(AccountName; rec."Account Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(ContainerName; rec."In Container Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(SharedAccessKey; rec."Shared Access Key")
//                 {
//                     ApplicationArea = all;
//                     ExtendedDatatype = Masked;
//                 }
//                 field(Url; Rec."In Url")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {

//         }
//     }
//     var
//         ABSOperationResponse: Codeunit "ABS Operation Response";
//         ABSBlobClient: codeunit "ABS Blob Client";
//         ABSContainerClient: Codeunit "ABS Container Client";
//         Authorization: Interface "Storage Service Authorization";
//         StorageServiceAuthorization: Codeunit "Storage Service Authorization";
//         Response: Codeunit "ABS Operation Response";
//         ABSContainerContent: Record "ABS Container Content";
// }