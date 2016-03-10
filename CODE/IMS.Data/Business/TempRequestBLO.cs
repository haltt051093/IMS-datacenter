using System.Collections.Generic;
using System.Linq;
using IMS.Core.Express;
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
            var result = dao.Query(x => x.RequestCode == requestCode).ToList();
            return result;
        }

        public string GenerateCode()
        {
            var code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.TempCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.TempCode == code).FirstOrDefault();
            }
            return code;
        }
    }
}
