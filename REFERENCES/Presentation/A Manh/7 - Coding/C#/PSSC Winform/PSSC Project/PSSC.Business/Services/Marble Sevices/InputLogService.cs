using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class InputLogService : IGenericService<InputLog>
    {
        private IGenericDAO<InputLog> InputLogDAO = null;

        public InputLogService()
        {
            this.InputLogDAO = new GenericDAO<InputLog>();
        }

        public InputLogService(GenericDAO<InputLog> InputLogDAO)
        {
            this.InputLogDAO = InputLogDAO;
        }

        public List<InputLog> SelectAll()
        {
            return InputLogDAO.SelectAll().OrderByDescending(x => x.DateInputted).ToList();
        }

        public InputLog SelectByID(int? id)
        {
            InputLog obj = null;
            if (id.HasValue)
            {
                obj = InputLogDAO.SelectByID((int)id);
            }
            return obj;
        }

        public bool Create(InputLog obj)
        {
            try
            {
                obj.DateInputted = DateTime.Now;
                InputLogDAO.Create(obj);
                InputLogDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(InputLog obj)
        {
            try
            {
                InputLogDAO.Update(obj);
                InputLogDAO.Save();
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
                InputLogDAO.Delete(id);
                InputLogDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }


     
    }
}
