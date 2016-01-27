using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogRequestStatusDAO : BaseDAO<LogRequestStatus>
    {
        public static LogRequestStatusDAO instance;

        public static LogRequestStatusDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogRequestStatusDAO();
                }
                return instance;
            }
        }

        public override LogRequestStatus GetByKeys(LogRequestStatus entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
