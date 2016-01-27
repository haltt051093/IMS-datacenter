using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogIPAllocationDAO : BaseDAO<LogIPAllocation>
    {
        public static LogIPAllocationDAO instance;

        public static LogIPAllocationDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogIPAllocationDAO();
                }
                return instance;
            }
        }

        public override LogIPAllocation GetByKeys(LogIPAllocation entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
