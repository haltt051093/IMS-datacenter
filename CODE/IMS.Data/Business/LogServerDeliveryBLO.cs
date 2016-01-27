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
    public class LogServerDeliveryBLO : BaseBLO<LogServerDelivery>
    {
        protected LogServerDeliveryDAO dao;
        private static LogServerDeliveryBLO instance;

        public static LogServerDeliveryBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogServerDeliveryBLO();
                }
                return instance;
            }
        }


        private LogServerDeliveryBLO()
        {
            baseDao = LogServerDeliveryDAO.Current;
            dao = LogServerDeliveryDAO.Current;
        }
    }
}
