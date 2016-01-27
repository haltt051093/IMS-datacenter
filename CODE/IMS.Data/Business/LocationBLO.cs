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
    public class LocationBLO : BaseBLO<Location>
    {
        protected LocationDAO dao;
        private static LocationBLO instance;

        public static LocationBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LocationBLO();
                }
                return instance;
            }
        }


        private LocationBLO()
        {
            baseDao = LocationDAO.Current;
            dao = LocationDAO.Current;
        }
    }
}
