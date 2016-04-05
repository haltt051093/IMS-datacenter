using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using PSSC.VirtualMachine.XDatabase;
using PSSC.VirtualMachine.DataModel;

namespace PSSC.VirtualMachine.DataAccess
{
    public class PortSettingRepository
    {
        private DBFile dbFile = null;

        public PortSettingRepository()
        {
            dbFile = DBRepository.GetDbFile("PortSettingDB");
        }

        public List<PortSetting> ToList()
        {

            List<PortSetting> list = new List<PortSetting>();
            foreach (var item in dbFile.XDocument.Descendants("Setting"))
            {
                PortSetting obj = new PortSetting()
                {
                    Name = item.Element("Name").Value,
                    Value = item.Element("Value").Value
                };
                list.Add(obj);
            }
            return list;                     
        }

        public PortSetting SelectByName(string settingName)
        {
            var node = dbFile.XDocument.Element("Settings").Elements("Setting")
                    .Where(x => x.Element("Name").Value == settingName)
                    .FirstOrDefault();
            PortSetting obj = new PortSetting()
            {
                Name = node.Element("Name").Value,
                Value = node.Element("Value").Value
            };
            return obj;
        }

        public void Add(PortSetting obj)
        {
            dbFile.XDocument.Element("Settings").Add(
                      new XElement("Setting",
                          new XElement("Name", obj.Name),
                          new XElement("Value", obj.Value)));
        }

        public void Update(PortSetting obj)
        {
            dbFile.XDocument.Element("Settings").Elements("Setting")
                     .Where(x => x.Element("Name").Value == obj.Name).FirstOrDefault()
                     .SetElementValue("Value", obj.Value);
        }

        public void Remove(PortSetting obj)
        {
            dbFile.XDocument.Element("Settings").Elements("Setting")
                      .Where(x => x.Element("Name").Value == obj.Name)
                      .Remove();
        }

        public void Save()
        {
            dbFile.UpdateXDocument();
        }
    }
}
