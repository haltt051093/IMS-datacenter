using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using PSSC.VirtualMachine.DataModel;

namespace PSSC.VirtualMachine.XDatabase
{
    public class PortSettingDBSeeder:IDBSeeder
    {

        public XDocument GetXDocument()
        {
            List<PortSetting> list = new List<PortSetting>()
            {
                new PortSetting()
                {
                    Name ="InputPort",
                    Value=""
                },
                new PortSetting()
                {
                    Name ="OutputPort",
                    Value=""
                },
            };
          
            XDocument xDoc = new XDocument(
                       new XDeclaration("1.0", "utf-8", "yes"),
                       new XComment("System Setting"),
                       new XElement("Settings",
                           list.Select(x => (new XElement("Setting",
                                                 new XElement("Name", x.Name),
                                                 new XElement("Value", x.Value))))
                     ));
            return xDoc;
        }
    }
}
