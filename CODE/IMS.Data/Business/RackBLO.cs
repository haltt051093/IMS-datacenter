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
    public class RackBLO : BaseBLO<Rack>
    {
        protected RackDAO dao;
        private static RackBLO instance;

        public static RackBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackBLO();
                }
                return instance;
            }
        }


        private RackBLO()
        {
            baseDao = RackDAO.Current;
            dao = RackDAO.Current;
        }
    }
}
