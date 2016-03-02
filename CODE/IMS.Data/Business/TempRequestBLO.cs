using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class TempRequestBLO : BaseBLO<TempRequest>
    {
        protected TempRequestDAO dao;
        private static TempRequestBLO instance;

        public static TempRequestBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TempRequestBLO();
                }
                return instance;
            }
        }


        private TempRequestBLO()
        {
            baseDao = TempRequestDAO.Current;
            dao = TempRequestDAO.Current;
        }

        public List<TempRequest> GetByRequestCode(string requestCode)
        {
            return dao.GetByRequestCode(requestCode);
        }

        public string GenerateCode()
        {
            return dao.GenerateCode();
        }

        public TempRequest GetByCode(string tempCode)
        {
            return dao.GetByCode(tempCode);
        }
    }
}
