using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

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
        public string GenerateCode()
        {
            var code = "L" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.LocationCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "L" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.LocationCode == code).FirstOrDefault();
            }
            return code;
        }
        public List<LocationExtendedModel> GetAllLocation()
        {
            return dao.GetAllLocation();
        }
    }
}
