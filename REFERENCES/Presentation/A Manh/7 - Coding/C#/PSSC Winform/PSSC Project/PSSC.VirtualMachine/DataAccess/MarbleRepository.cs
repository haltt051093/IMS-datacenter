using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Xml.Serialization;
using System.Xml.Linq;
using PSSC.XCommon;
using PSSC.VirtualMachine.XDatabase;
using PSSC.VirtualMachine.DataModel;


namespace PSSC.VirtualMachine.DataAccess
{
    public class MarbleRepository
    {
        private DBFile dbFile = null;

        public int QuantityLimits { get; set; }

        public MarbleRepository()
        {
            dbFile = DBRepository.GetDbFile("MarbleDB");
            this.QuantityLimits = 8;
        }

        public List<Marble> ToList()
        {

            List<Marble> list = new List<Marble>();
            foreach (var item in dbFile.XDocument.Descendants("Marble"))
            {
                Marble obj = new Marble()
                {
                    MarbleColor = item.Element("MarbleColor").Value,
                    Quantity = Convert.ToInt32(item.Element("Quantity").Value)
                };

                list.Add(obj);
            }
            return list;                     
        }

        public Marble SelectByColor(MarbleColor color)
        {
            var node = dbFile.XDocument.Element("Marbles").Elements("Marble")
                    .Where(x => x.Element("MarbleColor").Value == Convert.ToString(color))
                    .FirstOrDefault();
            Marble obj = new Marble()
            {
                MarbleColor = node.Element("MarbleColor").Value,
                Quantity = Convert.ToInt32(node.Element("Quantity").Value)
            };
            return obj;
        }

        public void Add(Marble obj)
        {
            dbFile.XDocument.Element("Marbles").Add(
                      new XElement("Marble",
                          new XElement("MarbleColor", obj.MarbleColor),
                          new XElement("Quantity", obj.Quantity)));
        }

        public void Update(Marble obj)
        {
            dbFile.XDocument.Element("Marbles").Elements("Marble")
                     .Where(x => x.Element("MarbleColor").Value == obj.MarbleColor).FirstOrDefault()
                     .SetElementValue("Quantity", obj.Quantity);
        }

        public void Remove(Marble obj)
        {
            dbFile.XDocument.Element("Marbles").Elements("Marble")
                      .Where(x => x.Element("MarbleColor").Value == obj.MarbleColor)
                      .Remove();
        }

        public void Save()
        {
            dbFile.UpdateXDocument();
        }


    }
}
