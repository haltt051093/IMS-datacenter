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
    public class AssignedShiftBLO : BaseBLO<AssignedShift>
    {
        protected AssignedShiftDAO dao;
        private static AssignedShiftBLO instance;

        public static AssignedShiftBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AssignedShiftBLO();
                }
                return instance;
            }
        }


        private AssignedShiftBLO()
        {
            baseDao = AssignedShiftDAO.Current;
            dao = AssignedShiftDAO.Current;
        }
    }
}
