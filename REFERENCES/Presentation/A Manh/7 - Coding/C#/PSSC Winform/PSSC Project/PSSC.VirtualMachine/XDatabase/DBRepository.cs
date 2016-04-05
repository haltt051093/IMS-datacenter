using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSSC.VirtualMachine.XDatabase
{
    public static class DBRepository
    {
        private static List<DBFile> dbFiles = new List<DBFile>();

        public static DBFile GetDbFile(string dbName)
        {
            return dbFiles.Where(x => x.Name == dbName).FirstOrDefault();
        }

        public static void CreateDB()
        {         
            dbFiles.Add(
                new DBFile()
                {
                    Name = "MarbleDB",
                    FilePath = "MarbleRepository.xml", 
                    XDocument = new MarbleXmlDbSeeder().GetXDocument()
                });
            dbFiles.Add(
                new DBFile()
                {
                    Name = "PortSettingDB",
                    FilePath = "PortSetting.xml",
                    XDocument = new PortSettingDBSeeder().GetXDocument()
                });

            foreach (var item in dbFiles)
            {
                item.CreateXDocument();
            }
        }

        public static void DeleteDB(string dbFileName)
        {
            var item = dbFiles.Where(x => x.Name == dbFileName).FirstOrDefault();
            if(item != null)
            {
                item.DeleteXDocument();
                dbFiles.Remove(item);
            }
       
        }

        public static void DeleteAll()
        {          
            foreach (var item in dbFiles)
            {
                item.DeleteXDocument();
            }
            dbFiles.Clear();
        }
    }
}
