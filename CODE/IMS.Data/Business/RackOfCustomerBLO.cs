using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

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
    }
}
