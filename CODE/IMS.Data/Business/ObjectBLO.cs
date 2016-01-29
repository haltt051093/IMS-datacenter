using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class ObjectBLO : BaseBLO<Models.Object>
    {
        protected ObjectDAO dao;
        private static ObjectBLO instance;

        public static ObjectBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ObjectBLO();
                }
                return instance;
            }
        }


        private ObjectBLO()
        {
            baseDao = ObjectDAO.Current;
            dao = ObjectDAO.Current;
        }
    }
}
