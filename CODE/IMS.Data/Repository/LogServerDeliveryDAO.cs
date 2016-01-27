using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogServerDeliveryDAO : BaseDAO<LogServerDelivery>
    {
        public static LogServerDeliveryDAO instance;

        public static LogServerDeliveryDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogServerDeliveryDAO();
                }
                return instance;
            }
        }

        public override LogServerDelivery GetByKeys(LogServerDelivery entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
