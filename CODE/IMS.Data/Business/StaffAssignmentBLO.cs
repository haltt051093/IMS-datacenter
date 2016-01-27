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
    public class StaffAssignmentBLO : BaseBLO<StaffAssignment>
    {
        protected StaffAssignmentDAO dao;
        private static StaffAssignmentBLO instance;

        public static StaffAssignmentBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new StaffAssignmentBLO();
                }
                return instance;
            }
        }


        private StaffAssignmentBLO()
        {
            baseDao = StaffAssignmentDAO.Current;
            dao = StaffAssignmentDAO.Current;
        }
    }
}
