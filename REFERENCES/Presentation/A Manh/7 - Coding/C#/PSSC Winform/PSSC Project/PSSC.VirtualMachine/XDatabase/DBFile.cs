using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PSSC.VirtualMachine.XDatabase
{
    public class DBFile
    {

        public string Name { get; set; }
        public string FilePath { get; set; }
        private XDocument xDocument;

        public XDocument XDocument { 
            get 
            {
                if (File.Exists(this.FilePath))
                {
                    this.xDocument = XDocument.Load(this.FilePath);
                }
                return this.xDocument;
            }
            set 
            {
                this.xDocument = value;
            }
        }
        
        public void CreateXDocument()
        {
            if(File.Exists(this.FilePath))
            {
                this.xDocument = XDocument.Load(this.FilePath);
            }
            else
            {
                this.xDocument.Save(this.FilePath);
            }
        }

        public void UpdateXDocument()
        {
            this.xDocument.Save(this.FilePath);
        }

        public void DeleteXDocument()
        {
            if(File.Exists(this.FilePath))
            {
                File.Delete(this.FilePath);
            }
        }

    }
}
