using System.Collections.Generic;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class StatusDAO : BaseDAO<Status>
    {
        public static StatusDAO instance;

        public static StatusDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new StatusDAO();
                }
                return instance;
            }
        }

        public override Status GetByKeys(Status entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public string GetStatusName(string statusCode)
        {
            var statusName = Current.Query(x => x.StatusCode == statusCode).Select(x => x.StatusName).FirstOrDefault();
            return statusName;
        }

        //public List<>
    }
}
