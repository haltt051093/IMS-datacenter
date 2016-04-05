using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using PSSC.XCommon;
using PSSC.VirtualMachine.DataModel;

namespace PSSC.VirtualMachine.XDatabase
{
    public class MarbleXmlDbSeeder: IDBSeeder
    {
        public XDocument GetXDocument()
        {
            List<Marble> list = new List<Marble>()
            {
                new Marble()
                {
                    MarbleColor = Convert.ToString(MarbleColor.Red),
                    Quantity = 0
                },
                new Marble()
                {
                    MarbleColor = Convert.ToString(MarbleColor.Green),
                    Quantity = 0
                },
                new Marble()
                {
                    MarbleColor = Convert.ToString(MarbleColor.Blue),
                    Quantity = 0
                },
                new Marble()
                {
                    MarbleColor = Convert.ToString(MarbleColor.Purple),
                    Quantity = 0
                },
                new Marble()
                {
                    MarbleColor = Convert.ToString(MarbleColor.Pink),
                    Quantity = 0
                }
            };
            XDocument xDoc = new XDocument(
                       new XDeclaration("1.0", "utf-8", "yes"),
                       new XComment("Marble Repository"),
                       new XElement("Marbles",
                           list.Select(x => (new XElement("Marble",
                                                 new XElement("MarbleColor", x.MarbleColor),
                                                 new XElement("Quantity", x.Quantity))))
                     ));
            return xDoc;
        }
    }
}
