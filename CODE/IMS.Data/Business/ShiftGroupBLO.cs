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
    public class ShiftGroupBLO : BaseBLO<ShiftGroup>
    {
        protected ShiftGroupDAO dao;
        private static ShiftGroupBLO instance;

        public static ShiftGroupBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShiftGroupBLO();
                }
                return instance;
            }
        }


        private ShiftGroupBLO()
        {
            baseDao = ShiftGroupDAO.Current;
            dao = ShiftGroupDAO.Current;
        }

        public List<ShiftGroup> SelectGroup()
        {
            return dao.SelectGroup();
        }
    }
}
