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
    public class LogUpgradedServerBLO : BaseBLO<LogUpgradedServer>
    {
        protected LogUpgradedServerDAO dao;
        private static LogUpgradedServerBLO instance;

        public static LogUpgradedServerBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogUpgradedServerBLO();
                }
                return instance;
            }
        }


        private LogUpgradedServerBLO()
        {
            baseDao = LogUpgradedServerDAO.Current;
            dao = LogUpgradedServerDAO.Current;
        }
    }
}
