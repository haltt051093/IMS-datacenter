using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RoleDAO : BaseDAO<Role>
    {
        public static RoleDAO instance;

        public static RoleDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RoleDAO();
                }
                return instance;
            }
        }

        public override Role GetByKeys(Role entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        //public List<Role> GetAllExcept(Role role)
        //{
        //    return instance.GetAll();
        //}
    }
}
