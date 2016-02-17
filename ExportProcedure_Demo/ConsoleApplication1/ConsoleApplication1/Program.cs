using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Word;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            //OBJECT OF MISSING "NULL VALUE"

            Object oMissing = System.Reflection.Missing.Value;

            Object oTemplatePath = "E:/TemplateOfDatacenter.dotx";


            Application wordApp = new Application();
            Document wordDoc = new Document();

            wordDoc = wordApp.Documents.Add(ref oTemplatePath, ref oMissing, ref oMissing, ref oMissing);

            foreach (Field myMergeField in wordDoc.Fields)
            {


                Range rngFieldCode = myMergeField.Code;

                String fieldText = rngFieldCode.Text;



                // ONLY GETTING THE MAILMERGE FIELDS

                if (fieldText.StartsWith(" MERGEFIELD"))
                {

                    // THE TEXT COMES IN THE FORMAT OF

                    // MERGEFIELD  MyFieldName  \\* MERGEFORMAT

                    // THIS HAS TO BE EDITED TO GET ONLY THE FIELDNAME "MyFieldName"

                    Int32 endMerge = fieldText.IndexOf("\\");

                    Int32 fieldNameLength = fieldText.Length - endMerge;

                    String fieldName = fieldText.Substring(11, endMerge - 11);

                    // GIVES THE FIELDNAMES AS THE USER HAD ENTERED IN .dot FILE

                    fieldName = fieldName.Trim();

                    // **** FIELD REPLACEMENT IMPLEMENTATION GOES HERE ****//

                    // THE PROGRAMMER CAN HAVE HIS OWN IMPLEMENTATIONS HERE

                    if (fieldName == "PartA")
                    {

                        myMergeField.Select();

                        wordApp.Selection.TypeText("Nguyễn Văn Giàu");

                    }
                    if (fieldName == "Representative")
                    {
                        myMergeField.Select();
                        wordApp.Selection.TypeText("giaunv");
                    }

                }

            }
            wordDoc.SaveAs("myfile.doc");
            wordApp.Documents.Open("myFile.doc");
            wordApp.Application.Quit();
        
    }
    }
}
