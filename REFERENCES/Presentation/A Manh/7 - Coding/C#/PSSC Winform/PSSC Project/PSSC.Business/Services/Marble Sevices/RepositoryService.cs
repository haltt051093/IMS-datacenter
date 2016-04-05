using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class RepositoryService:IGenericService<Repository>
    {
        private IGenericDAO<Repository> RepositoryDAO = null;

        public int QuantityLimits { get; set; }

        public int OutputLimits { get; set; }

        public RepositoryService()
        {
            this.RepositoryDAO = new GenericDAO<Repository>();
            this.QuantityLimits = 9;
            this.OutputLimits = 5;
        }

        public RepositoryService(GenericDAO<Repository> RepositoryDAO)
        {
            this.RepositoryDAO = RepositoryDAO;
        }

        public List<Repository> SelectAll()
        {
            return RepositoryDAO.SelectAll().OrderBy(x => x.RepositoryId).ToList();
        }

        public Repository SelectByID(int? id)
        {
            Repository obj = null;
            if (id.HasValue)
            {
                obj = RepositoryDAO.SelectByID((int)id);
            }
            return obj;
        }

        public Repository SelectRepositoryByMarbleColor(MarbleColor color)
        {
            Repository obj = null;
            MarbleService marbleService = new MarbleService();
            if (!string.IsNullOrEmpty(Convert.ToString(color)))
            {
                Marble marble = marbleService.SelectByColor(color);
                if(marble != null)
                {
                    obj = RepositoryDAO.SelectAll().Where(x => x.MarbleId == marble.MarbleId).FirstOrDefault();
                }
            }
            return obj;
        }

        public int GetTotalMarbles()
        {
            int sum = 0;
            try
            {
                foreach (var item in RepositoryDAO.SelectAll())
                {
                    sum += (int)item.Quantity;
                }
            }
            catch
            {
                return -1;
            }
            return sum;
        }

        public bool Create(Repository obj)
        {
            try
            {
                obj.DateOfCreation = DateTime.Now;
                obj.DateOfLastModification = DateTime.Now;
                RepositoryDAO.Create(obj);
                RepositoryDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(Repository obj)
        {
            try
            {
                obj.DateOfLastModification = DateTime.Now;
                RepositoryDAO.Update(obj);
                RepositoryDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool UpdateQuantityByMarbleColor(MarbleColor color,int quantity = 0)
        {
            try
            {
                Repository obj = SelectRepositoryByMarbleColor(color);
                obj.Quantity = quantity;
                Update(obj);
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
                RepositoryDAO.Delete(id);
                RepositoryDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool ResetRepository(int value)
        {
            try
            {
                UpdateQuantityByMarbleColor(MarbleColor.Red, value);
                UpdateQuantityByMarbleColor(MarbleColor.Green, value);
                UpdateQuantityByMarbleColor(MarbleColor.Blue, value);
                UpdateQuantityByMarbleColor(MarbleColor.Purple, value);
                UpdateQuantityByMarbleColor(MarbleColor.Pink, value);
            }
            catch 
            {
                return false;
            }
            return true;
        }
    }
}
