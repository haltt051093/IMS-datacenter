﻿using System.Collections.Generic;
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

        public List<RackOfCustomerExtendedModel> EmptyRentedRack(string customer)
        {
            return dao.EmptyRentedRack(customer);
        }
    }
}
