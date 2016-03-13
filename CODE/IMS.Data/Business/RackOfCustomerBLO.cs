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


        public List<Tuple<string, string>>  GetRackOfCustomer(string customer)
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
            return dao.GetRacksOfCustomer(customer,status);
        }
        
        //Tien
        public List<RackOfCustomerExtendedModel> GetAllRackOfCustomer(string customer = null)
        {
            return dao.GetAllRackOfCustomer(customer);
        }

        public List<RackOfCustomerExtendedModel> CountServerPerRack(string customer)
        {
            return dao.CountServerPerRack(customer);
        }

        public void AddRackOfCustomerANDLog(string requestCode, string rackCode, string typeOfLog, 
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
            LogChangedContent logRackOfCustomer = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                ChangedValueOfObject = rackCode,
                ObjectStatus = Constants.StatusCode.RACKOFCUSTOMER_CURRENT,
                Staff = staff
            };
            LogChangedContentBLO.Current.AddLog(logRackOfCustomer);
        }

        public void UpdateStatusRackOfCustomerANDLog(string requestCode, string rackCode, string typeOfLog,
            string customer, string staff, string preStatus, string newStatus)
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
            LogChangedContent logRackOfCustomer = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                ChangedValueOfObject = rackCode,
                ObjectStatus = newStatus,
                Staff = staff
            };
            LogChangedContentBLO.Current.AddLog(logRackOfCustomer);
        }
    }
}
