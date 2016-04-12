using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class RackOfCustomerBLO : BaseBLO<RackOfCustomer>
    {
        protected RackOfCustomerDAO dao;
        private static RackOfCustomerBLO instance;

        public static RackOfCustomerBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackOfCustomerBLO();
                }
                return instance;
            }
        }


        private RackOfCustomerBLO()
        {
            baseDao = RackOfCustomerDAO.Current;
            dao = RackOfCustomerDAO.Current;
        }


        public List<Tuple<string, string>> GetRackOfCustomer(string customer)
        {
            var racks = dao.GetAllRackOfCustomer(customer);
            var result = racks.Select(x => new Tuple<string, string>(x.RackCode, x.RackName))
                .Distinct()
                .ToList();
            return result;
        }

        // TO BE OPTIMIZED
        public List<RackOfCustomerExtendedModel> EmptyRentedRack(string customer)
        {
            return dao.EmptyRentedRack(customer);
        }

        public List<RackOfCustomerExtendedModel> GetRacksOfCustomer(string customer, string status)
        {
            return dao.GetRacksOfCustomer(customer, status);
        }

        //Tien
        public List<RackOfCustomerExtendedModel> GetAllRackOfCustomer(string customer = null)
        {
            return dao.GetAllRackOfCustomer(customer);
        }

        public List<RackOfCustomerExtendedModel> CountServerPerRack(string customer)
        {
            //var query = @"select r.RackCode, ra.RackName, COUNT(rc.ServerCode) as serverNum, r.StatusCode
            //            from [dbo].[RackOfCustomer] as r
            //             left join [dbo].[Location] as rc
            //            on r.RackCode = rc.RackCode
            //             left join [dbo].[Rack] as ra
            //            on ra.RackCode = rc.RackCode
            //            where r.Customer = '" + customer +
            //            @"' AND r.StatusCode='" + Constants.StatusCode.RACKOFCUSTOMER_CURRENT + @"'
            //            group by r.RackCode, ra.RackName, r.StatusCode";
            //return RawQuery<RackOfCustomerExtendedModel>(query, new object[] { });
            var rackOfCus = from rc in dao.Table
                            join r in RackDAO.Current.Table
                                on rc.RackCode equals r.RackCode into rrc
                            from subrrc in rrc.DefaultIfEmpty()
                            where rc.Customer == customer && rc.StatusCode == Constants.StatusCode.RACKOFCUSTOMER_CURRENT
                            select new RackOfCustomerExtendedModel()
                            {
                                RackCode = rc.RackCode,
                                RackName = subrrc.RackName,
                                StatusCode = subrrc.StatusCode
                            };
            var list = rackOfCus.ToList();
            var data = new List<RackOfCustomerExtendedModel>();
            if (list.Count > 0)
            {
                foreach (var item in list)
                {
                    var model = new RackOfCustomerExtendedModel();
                    model = item;
                    model.ServerNum = LocationBLO.Current.GetNumberOfServerPerRack(model.RackCode);
                    data.Add(model);
                }
                return data;
            }
            return null;
        }

        public void AddRackOfCustomerANDLog(string requestCode, string rackCode, string rackName, string typeOfLog,
            string customer, string staff)
        {
            var rackOfCustomer = new RackOfCustomer
            {
                RackCode = rackCode,
                Customer = customer,
                RentedDate = DateTime.Now,
                StatusCode = Constants.StatusCode.RACKOFCUSTOMER_CURRENT
            };
            Current.Add(rackOfCustomer);
            //log rackOfCustomer
            Log logRackOfCustomer = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                ChangedValueOfObject = rackName,
                ObjectStatus = Constants.StatusCode.RACKOFCUSTOMER_CURRENT,
                Username = staff
            };
            LogBLO.Current.Add(logRackOfCustomer);
        }

        public void UpdateStatusRackOfCustomerANDLog(string requestCode, string rackCode, string typeOfLog,
            string customer, string staff, string preStatus, string newStatus, string rackName)
        {
            var rackOfCustomer = RackOfCustomerDAO.Current.Query(x =>
                       x.RackCode == rackCode && x.Customer == customer &&
                       x.StatusCode == preStatus).FirstOrDefault();
            if (rackOfCustomer != null)
            {
                rackOfCustomer.StatusCode = newStatus;
                Update(rackOfCustomer);
            }
            //log rackOfCustomer
            Log logRackOfCustomer = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                ChangedValueOfObject = rackName,
                ObjectStatus = newStatus,
                Username = staff
            };
            LogBLO.Current.Add(logRackOfCustomer);
        }
    }
}
