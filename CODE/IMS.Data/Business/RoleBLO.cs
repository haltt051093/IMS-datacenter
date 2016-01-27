using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class RoleBLO : BaseBLO<Role>
    {
        protected RoleDAO dao;
        private static RoleBLO instance;
        public static RoleBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RoleBLO();
                }
                return instance;
            }
        }

        private RoleBLO()
        {
            baseDao = RoleDAO.Current;
            dao = RoleDAO.Current;
        }
    }
}
