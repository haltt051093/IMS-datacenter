using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class InputLogStatusCodeService : IGenericService<InputLogStatusCode>
    {
        private IGenericDAO<InputLogStatusCode> InputLogStatusCodeDAO = null;

        public InputLogStatusCodeService()
        {
            this.InputLogStatusCodeDAO = new GenericDAO<InputLogStatusCode>();
        }

        public InputLogStatusCodeService(GenericDAO<InputLogStatusCode> InputLogStatusCodeDAO)
        {
            this.InputLogStatusCodeDAO = InputLogStatusCodeDAO;
        }

        public List<InputLogStatusCode> SelectAll()
        {
            return InputLogStatusCodeDAO.SelectAll().OrderBy(x => x.StatusId).ToList();
        }

        public InputLogStatusCode SelectByID(int? id)
        {
            InputLogStatusCode obj = null;
            if (id.HasValue)
            {
                obj = InputLogStatusCodeDAO.SelectByID((int)id);
            }
            return obj;
        }

        public bool Create(InputLogStatusCode obj)
        {
            try
            {
                obj.DateOfCreation = DateTime.Now;
                obj.DateOfLastModification = DateTime.Now;
                InputLogStatusCodeDAO.Create(obj);
                InputLogStatusCodeDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(InputLogStatusCode obj)
        {
            try
            {
                obj.DateOfLastModification = DateTime.Now;
                InputLogStatusCodeDAO.Update(obj);
                InputLogStatusCodeDAO.Save();
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
                InputLogStatusCodeDAO.Delete(id);
                InputLogStatusCodeDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
