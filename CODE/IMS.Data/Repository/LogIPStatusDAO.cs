using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogIPStatusDAO : BaseDAO<LogIPStatus>
    {
        public static LogIPStatusDAO instance;

        public static LogIPStatusDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogIPStatusDAO();
                }
                return instance;
            }
        }

        public override LogIPStatus GetByKeys(LogIPStatus entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
