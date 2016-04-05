using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.VirtualMachine.DataModel;
using PSSC.VirtualMachine.DataAccess;
namespace PSSC.VirtualMachine.Business
{
    public class PortSettingService
    {
        PortSettingRepository repository = null;

        public PortSettingService()
        {
            this.repository = new PortSettingRepository();
        }

        public PortSettingService(PortSettingRepository repository)
        {
            this.repository = repository;
        }

        public List<PortSetting> ToList()
        {
            return repository.ToList();
        }

        public PortSetting SelectByName(string settingName)
        {
            return repository.SelectByName(settingName);
        }

        public bool Add(PortSetting obj)
        {
            try
            {
                repository.Add(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(PortSetting obj)
        {
            try
            {
                repository.Update(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Remove(PortSetting obj)
        {
            try
            {
                repository.Remove(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
