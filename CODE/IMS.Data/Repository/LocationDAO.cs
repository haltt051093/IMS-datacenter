using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Queries;
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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.LocationCode == entry.LocationCode).FirstOrDefault();
            }
            return existing;
        }

        public List<LocationViewModel> GetAllLocation(GetLocationQuery q = null)
        {
            if (q == null)
            {
                q = new GetLocationQuery();
            }
            var query = @"select l.LocationCode,ser.ServerCode,ser.DefaultIP, l.RackUnit, s.StatusName,r.RackName,r.RackCode, ser.Id,r.StatusCode as RackStatus, acc.Fullname from Location as l
                            left join Status as s
                            on s.StatusCode = l.StatusCode
                            join Rack as r
                            on r.RackCode = l.RackCode
                            left join Server as ser on ser.ServerCode = l.ServerCode
                            left join RackOfCustomer as rack on rack.RackCode = r.RackCode and (rack.StatusCode='STATUS26' OR rack.StatusCode='STATUS27')
                            left join Account as acc on acc.Username = rack.Customer
                            where (isnull(@rackcode, '') = '' or l.RackCode = @rackcode)";

            return RawQuery<LocationViewModel>(query,
                new SqlParameter("rackcode", q.RackCode)
            );
        }

        public List<LocationViewModel> GetRackValidPowerForNew(Server server)
        {
            var query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName,l.ServerCode, r.RackName
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
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'
except 
select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName,l.ServerCode, r.RackName 
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
							join RackOfCustomer as roc
							on roc.RackCode=l.RackCode
                            and roc.StatusCode = 'STATUS26'
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'"
            ;
            return RawQuery<LocationViewModel>(query, new object[] { });
        }

        public List<LocationViewModel> GetCustomerRackValidPowerForNew(Server server)
        {
            var query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName, l.ServerCode, r.RackName
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
                            and roc.StatusCode = 'STATUS26'
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s 
                            on s.StatusCode=l.StatusCode
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'";
            return RawQuery<LocationViewModel>(query, new object[] { });
        }

        public List<LocationViewModel> GetRackValidPowerForChange(Server server)
        {
            var rack = GetRackOfServer(server);
            string query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName,l.ServerCode,r.RackName
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
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'or r.RackCode = '" + rack.RackCode + @"'
except select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName,l.ServerCode,r.RackName
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
                            join RackOfCustomer as roc
							on roc.RackCode=l.RackCode
                            and roc.StatusCode = 'STATUS26'
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'or r.RackCode = '" + rack.RackCode + @"'";
            ;
            return RawQuery<LocationViewModel>(query, new object[] { });
        }

        public List<LocationViewModel> GetCustomerRackValidPowerForChange(Server server)
        {
            var rack = GetRackOfServer(server);
            var query = @"select l.LocationCode, l.RackCode, l.RackUnit, s.StatusName, l.ServerCode,r.RackName
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
                            and roc.StatusCode = 'STATUS26'
                            join Location as l
                            on r.RackCode = l.RackCode
	                        join Status as s on s.StatusCode=l.StatusCode
                            where r.MaximumPower*1000 - ISNULL(ri.UsedPower,0) >'" + server.Power + @"'or r.RackCode = '" + rack.RackCode + @"'";
            return RawQuery<LocationViewModel>(query, new object[] { });
        }

        public LocationViewModel GetRackOfServer(Server server)
        {
            var query =
                @"select * from Server as s join Location l on s.ServerCode = l.ServerCode and s.ServerCode='" +
                server.ServerCode + @"'";
            return RawQuery<LocationViewModel>(query, new object[] { }).FirstOrDefault();
        }
    }
}
