using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using IMS.Core;
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
            var query = @"select DISTINCT rc.RackCode, rc.Customer, r.RackName
                        from RackOfCustomer rc
						right join Rack as r
						on r.RackCode = rc.RackCode AND rc.StatusCode ='STATUS26'
                        where rc.Customer ='" + customer + @"' AND rc.RackCode NOT IN (
                        select DISTINCT l.RackCode
                        from Server as s
                        inner join Location as l
                        on s.ServerCode = l.ServerCode
                        where s.Customer = '" + customer + "')";
            return RawQuery<RackOfCustomerExtendedModel>(query, new object[] { });
        }

        public List<LocationViewModel> GetRackOfCustomer(Server server)
        {
            var query = @"select roc.RackCode from RackOfCustomer roc where roc.Customer = '" + server.Customer + @"'";
            return RawQuery<LocationViewModel>(query, new object[] { });
        }

        public List<RackOfCustomerExtendedModel> GetAllRackOfCustomer(string customer)
        {
            var query = @"select roc.*,l.RackUnit,l.ServerCode,s.StatusName,r.RackName,k.StatusName as RackStatus, ser.DefaultIP,ser.Power,r.MaximumPower
                            from  RackOfCustomer as roc, Status as s, Status as k, Rack as r,Location as l
							left join Server as ser on ser.ServerCode = l.ServerCode
                            where l.RackCode = roc.RackCode and l.StatusCode = s.StatusCode and r.RackCode=l.RackCode and k.StatusCode = roc.StatusCode
                            and ((isnull(@customer, '') = '' or roc.Customer = @customer)) and (roc.StatusCode='STATUS26' or roc.StatusCode='STATUS27')";
            return RawQuery<RackOfCustomerExtendedModel>(query, 
                new SqlParameter("customer", customer)
            );
        }

        public List<RackOfCustomerExtendedModel> GetRacksOfCustomer(string customer, string status)
        {
            var query = from rc in Table
                join r in RackDAO.Current.Table
                    on rc.RackCode equals r.RackCode into rrc
                from subr in rrc.DefaultIfEmpty()
                where rc.Customer == customer && rc.StatusCode == status
                select new RackOfCustomerExtendedModel()
                {
                    RackName = subr.RackName,
                    RackCode = subr.RackCode,
                };

            return query.ToList();
        }

    }
}
