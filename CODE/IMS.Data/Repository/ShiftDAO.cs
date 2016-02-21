using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class ShiftDAO : BaseDAO<Shift>
    {
        public static ShiftDAO instance;

        public static ShiftDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShiftDAO();
                }
                return instance;
            }
        }

        public override Shift GetByKeys(Shift entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
