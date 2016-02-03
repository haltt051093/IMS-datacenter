using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class RackOfCustomerDAO : BaseDAO<RackOfCustomer>
    {
        public static RackOfCustomerDAO instance;

        public static RackOfCustomerDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackOfCustomerDAO();
                }
                return instance;
            }
        }

        public override RackOfCustomer GetByKeys(RackOfCustomer entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public List<RackOfCustomerExtendedModel> EmptyRentedRack(string customer)
        {
            //var list1 = from rc in RackOfCustomerDAO.Current.Table()
            //            where rc.Customer == customer
            //            select rc.RackCode;
            //var query1 = list1.ToList();
            //var list2 = from s in ServerDAO.Current.Table()
            //            join l in LocationDAO.Current.Table()
            //                on s.LocationCode equals l.LocationCode into sl
            //            from subsl in sl.DefaultIfEmpty()
            //            select new { subsl.RackCode };
            //var query2 = list2.ToList();

            //var query = from rcmain in RackOfCustomerDAO.Current.Table()
            //            where !(from s in ServerDAO.Current.Table()
            //                    join l in LocationDAO.Current.Table()
            //                        on s.LocationCode equals l.LocationCode into sl
            //                    from subsl in sl.DefaultIfEmpty()
            //                    select new RackOfCustomer() { RackCode = subsl.RackCode, Customer = s.Customer }).Any()
            //            select rcmain;
            //return query.ToList();

            var query = @"select DISTINCT rc.RackCode, rc.Customer, r.RackName
                        from RackOfCustomer rc
						left join Rack as r
						on r.RackCode = rc.RackCode
                        where rc.Customer ='" + customer + @"' AND rc.RackCode NOT IN (
                        select DISTINCT l.RackCode
                        from Server as s
                        inner join Location as l
                        on s.ServerCode = l.ServerCode
                        where s.Customer = '" + customer + "')";
            return RawQuery<RackOfCustomerExtendedModel>(query, new object[] { });
        }
        public List<LocationExtendedModel> GetRackOfCustomer(Server server)
        {
            string query = @"select roc.RackCode from RackOfCustomer roc where roc.Customer = '" + server.Customer + @"'";
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }
    }
}
