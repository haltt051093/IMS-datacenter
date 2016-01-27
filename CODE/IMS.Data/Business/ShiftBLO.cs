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
    public class ShiftBLO : BaseBLO<Shift>
    {
        protected ShiftDAO dao;
        private static ShiftBLO instance;

        public static ShiftBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShiftBLO();
                }
                return instance;
            }
        }


        private ShiftBLO()
        {
            baseDao = ShiftDAO.Current;
            dao = ShiftDAO.Current;
        }
    }
}
