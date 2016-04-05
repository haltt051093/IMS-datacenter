using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class MarbleService:IGenericService<Marble>
    {
        private IGenericDAO<Marble> MarbleDAO = null;

        public MarbleService()
        {
            this.MarbleDAO = new GenericDAO<Marble>();
        }

        public MarbleService(GenericDAO<Marble> MarbleDAO)
        {
            this.MarbleDAO = MarbleDAO;
        }

        public List<Marble> SelectAll()
        {
            return MarbleDAO.SelectAll().OrderBy(x => x.MarbleColor).ToList();
        }

        public Marble SelectByID(int? id)
        {
            Marble obj = null;
            if (id.HasValue)
            {
                obj = MarbleDAO.SelectByID((int)id);
            }
            return obj;
        }

        public Marble SelectByColor(MarbleColor color)
        {
            Marble obj = null;
            if(!string.IsNullOrEmpty(Convert.ToString(color)))
            {
                obj = MarbleDAO.SelectAll().Where(x => x.MarbleColor == Convert.ToString(color)).FirstOrDefault();
            }
            return obj;
        }

        public bool Create(Marble obj)
        {
            try
            {
                if(!obj.Price.HasValue)
                {
                    obj.Price = 0;
                }
                obj.DateOfCreation = DateTime.Now;
                obj.DateOfLastModification = DateTime.Now;
                MarbleDAO.Create(obj);
                MarbleDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(Marble obj)
        {
            try
            {
                if (!obj.Price.HasValue)
                {
                    obj.Price = 0;
                }
                obj.DateOfLastModification = DateTime.Now;
                MarbleDAO.Update(obj);
                MarbleDAO.Save();
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
                MarbleDAO.Delete(id);
                MarbleDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

    }
}
