using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

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
        public List<LocationExtendedModel> GetAllLocation()
        {
            string query = @"select l.LocationCode,l.ServerCode, l.RackUnit, s.Status,r.RackName, ser.Id from Location as l
                            left join Status as s
                            on s.StatusCode = l.StatusCode
                            join Rack as r
                            on r.RackCode = l.RackCode
                            left join Server as ser on ser.ServerCode = l.ServerCode";

            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }
    }
}
