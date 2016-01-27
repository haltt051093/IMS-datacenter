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
    public class GroupBLO : BaseBLO<Group>
    {
        protected GroupDAO dao;
        private static GroupBLO instance;

        public static GroupBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new GroupBLO();
                }
                return instance;
            }
        }


        private GroupBLO()
        {
            baseDao = GroupDAO.Current;
            dao = GroupDAO.Current;
        }
    }
}
