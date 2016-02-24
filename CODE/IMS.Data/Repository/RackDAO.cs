using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RackDAO : BaseDAO<Rack>
    {
        public static RackDAO instance;

        public static RackDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackDAO();
                }
                return instance;
            }
        }

        public override Rack GetByKeys(Rack entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void UpdateRackStatus(string rackCode, string status)
        {
            var query = Current.Query(x => x.RackCode == rackCode).FirstOrDefault();
            query.StatusCode = status;
            Update(query);
        }
    }
}
