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
        public List<LocationExtendedModel> GetRackValidPowerForNew(Server server)
        {
            string query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.Status,l.ServerCode, r.RackName
                            from rack as r left join
	                            (select r.RackCode, sum(s.power / s.size) as UsedPower
	                            from rack as r
	                            join location as l
		                            on r.RackCode = l.RackCode
	                            join server as s
		                            on l.ServerCode = s.ServerCode
	                            group by r.RackCode) as ri
                            on r.RackCode= ri.RackCode
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s 
                            on s.StatusCode=l.StatusCode
                            where r.MaximumPower - ISNULL(ri.UsedPower,0) >'" + server.Power +
                           @"'and r.StatusCode!='STATUS20'";
            ;
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }

        public List<LocationExtendedModel> GetCustomerRackValidPowerForNew(Server server)
        {
            string query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.Status, l.ServerCode, r.RackName
                            from rack as r left join
	                            (select r.RackCode, sum(s.power / s.size) as UsedPower
	                            from rack as r
	                            join location as l
		                            on r.RackCode = l.RackCode
	                            join server as s
		                            on l.ServerCode = s.ServerCode
	                            group by r.RackCode) as ri
                            on r.RackCode= ri.RackCode
                            join RackOfCustomer as roc
		                    on roc.Customer = '" + server.Customer + @"'
		                    and roc.RackCode = r.RackCode
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s 
                            on s.StatusCode=l.StatusCode
                            where r.MaximumPower - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'";
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }

        public List<LocationExtendedModel> GetRackValidPowerForChange(Server server)
        {
            string query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.Status,l.ServerCode,r.RackName
                            from rack as r left join
	                            (select r.RackCode, sum(s.power / s.size) as UsedPower
	                            from rack as r
	                            join location as l
		                            on r.RackCode = l.RackCode
	                            join server as s
		                            on l.ServerCode = s.ServerCode
	                            group by r.RackCode) as ri
                            on r.RackCode= ri.RackCode
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s on s.StatusCode=l.StatusCode
                            where r.MaximumPower - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'and r.StatusCode != 'STATUS20' or l.ServerCode = '" +
                           server.ServerCode + @"'";
            ;
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }
        public List<LocationExtendedModel> GetCustomerRackValidPowerForChange(Server server)
        {
            string query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.Status, l.ServerCode,r.RackName
                            from rack as r left join
	                            (select r.RackCode, sum(s.power / s.size) as UsedPower
	                            from rack as r
	                            join location as l
		                            on r.RackCode = l.RackCode
	                            join server as s
		                            on l.ServerCode = s.ServerCode
	                            group by r.RackCode) as ri
                            on r.RackCode= ri.RackCode
                            join RackOfCustomer as roc
		                    on roc.Customer = '" + server.Customer + @"'
		                    and roc.RackCode = r.RackCode
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s on s.StatusCode=l.StatusCode
                            where r.MaximumPower - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'or l.ServerCode = '" + server.ServerCode + @"'";
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }
        public LocationExtendedModel GetRackOfServer(Server server)
        {
            string query =
                @"select * from Server as s join Location l on s.ServerCode = l.ServerCode and s.ServerCode='" +
                server.ServerCode + @"'";
            return RawQuery<LocationExtendedModel>(query, new object[] { }).FirstOrDefault();
        }
        public List<string> GetLocationStatus()
        {
            string query = @"select s.Status from Status as s
                           where s.Object = 'Location'";
            return RawQuery<string>(query, new object[] { });
        }
    }
}
