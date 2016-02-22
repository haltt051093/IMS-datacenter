using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RequestTypeDAO : BaseDAO<RequestType>
    {
        public static RequestTypeDAO instance;

        public static RequestTypeDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestTypeDAO();
                }
                return instance;
            }
        }

        public override RequestType GetByKeys(RequestType entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
