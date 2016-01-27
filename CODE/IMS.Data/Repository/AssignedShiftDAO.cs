using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class AssignedShiftDAO : BaseDAO<AssignedShift>
    {
        public static AssignedShiftDAO instance;

        public static AssignedShiftDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AssignedShiftDAO();
                }
                return instance;
            }
        }

        public override AssignedShift GetByKeys(AssignedShift entry)
        {
            return Query(x => x.GroupId == entry.GroupId).FirstOrDefault();
        }

         
    }
}
