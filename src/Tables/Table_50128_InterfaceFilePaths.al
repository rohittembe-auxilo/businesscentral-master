Table 50128 "Interface File Paths"
{

    fields
    {
        field(1; "File Type"; Option)
        {
            OptionCaption = 'GL,Purchase,Vendor,Dimension,GL Direct,PO';
            OptionMembers = GL,Purchase,Vendor,Dimension,"GL Direct",PO;
        }
        field(2; "Instore File Path"; Text[100])
        {

            trigger OnValidate()
            begin
                TestField("Processed File Path");
                //TESTFIELD("Acknowledged File Path");
                TestField("Error File Path");
                //v      FileRec.Reset;
                //v      FileRec.SetRange(Path, "Instore File Path");
                //v      FileRec.FindFirst;
                //CITS
            end;
        }
        field(3; "Processed File Path"; Text[100])
        {

            trigger OnValidate()
            begin
                //v       FileRec.Reset;
                //v     FileRec.SetRange(Path, "Processed File Path");
                //v     FileRec.FindFirst;
                //CITS
            end;
        }
        field(4; "Acknowledged File Path"; Text[100])
        {

            trigger OnValidate()
            begin
                //v        FileRec.Reset;
                //v       FileRec.SetRange(Path, "Acknowledged File Path");
                //v      FileRec.FindFirst;
                //CITS
            end;
        }
        field(5; "Error File Path"; Text[100])
        {

            trigger OnValidate()
            begin
                /*FileRec.RESET;
                FileRec.SETRANGE(Path,"Error File Path");
                FileRec.FINDFIRST;
                 */

            end;
        }
        field(6; "Copy File Path"; Text[100])
        {
        }
        field(7; "Common Path"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "File Type")
        {
            Clustered = true;
        }
    }

    var
    //mig        FileRec: Record File;
}

