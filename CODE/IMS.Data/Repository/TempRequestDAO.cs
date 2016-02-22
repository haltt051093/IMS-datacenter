using System.Linq;
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
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
