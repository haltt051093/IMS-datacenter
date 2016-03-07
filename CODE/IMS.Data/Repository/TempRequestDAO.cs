using System.Collections.Generic;
using System.Linq;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class TempRequestDAO : BaseDAO<TempRequest>
    {
        public static TempRequestDAO instance;

        public static TempRequestDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TempRequestDAO();
                }
                return instance;
            }
        }

        public override TempRequest GetByKeys(TempRequest entry)
        {
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.TempCode == entry.TempCode).FirstOrDefault();
            }
            return existing;
        }

        public List<TempRequest> GetByRequestCode(string requestCode)
        {
            var query = from temp in Table()
                        where temp.RequestCode == requestCode
                        select temp;
            return query.ToList();
        }

        public TempRequest GetByCode(string tempCode)
        {
            return Query(x => x.TempCode == tempCode).FirstOrDefault();
        }

        public string GenerateCode()
        {
            var code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.TempCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.TempCode == code).FirstOrDefault();
            }
            return code;
        }

        public void UpdateByTempCode(string tempCode)
        {
            var temp = new TempRequest();
            temp.TempCode = tempCode;
            var update = GetByKeys(temp);
            Update(update);
        }
    }
}
