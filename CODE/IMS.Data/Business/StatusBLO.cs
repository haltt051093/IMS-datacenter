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
    public class StatusBLO : BaseBLO<Status>
    {
        protected StatusDAO dao;
        private static StatusBLO instance;

        public static StatusBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new StatusBLO();
                }
                return instance;
            }
        }


        private StatusBLO()
        {
            baseDao = StatusDAO.Current;
            dao = StatusDAO.Current;
        }
    }
}
