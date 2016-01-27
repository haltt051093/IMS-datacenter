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
    public class LogIPAllocationBLO : BaseBLO<LogIPAllocation>
    {
        protected LogIPAllocationDAO dao;
        private static LogIPAllocationBLO instance;

        public static LogIPAllocationBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogIPAllocationBLO();
                }
                return instance;
            }
        }


        private LogIPAllocationBLO()
        {
            baseDao = LogIPAllocationDAO.Current;
            dao = LogIPAllocationDAO.Current;
        }
    }
}
