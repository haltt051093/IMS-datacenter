using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class PortSettingService:IGenericService<PortSetting>
    {
         private IGenericDAO<PortSetting> PortSettingDAO = null;

        public PortSettingService()
        {
            this.PortSettingDAO = new GenericDAO<PortSetting>();
        }

        public PortSettingService(GenericDAO<PortSetting> PortSettingDAO)
        {
            this.PortSettingDAO = PortSettingDAO;
        }

        public List<PortSetting> SelectAll()
        {
            return PortSettingDAO.SelectAll().OrderBy(x => x.Name).ToList();
        }

        public PortSetting SelectByID(int? id)
        {
            PortSetting obj = null;
            if (id.HasValue)
            {
                obj = PortSettingDAO.SelectByID((int)id);
            }
            return obj;
        }

        public PortSetting SelectByName(string name)
        {
            PortSetting obj = null;
            if (!string.IsNullOrEmpty(name))
            {
                obj = PortSettingDAO.SelectAll().Where(x => x.Name == name).FirstOrDefault();
            }
            return obj;
        }

        public bool Create(PortSetting obj)
        {
            try
            {
                PortSettingDAO.Create(obj);
                PortSettingDAO.Save();
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
                PortSetting temp = SelectByName(obj.Name);
                temp.Value = obj.Value;
                PortSettingDAO.Update(temp);
                PortSettingDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Delete(int id)
        {
            try
            {
                PortSettingDAO.Delete(id);
                PortSettingDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
