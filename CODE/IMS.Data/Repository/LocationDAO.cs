using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LocationDAO : BaseDAO<Location>
    {
        public static LocationDAO instance;

        public static LocationDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LocationDAO();
                }
                return instance;
            }
        }

        public override Location GetByKeys(Location entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
