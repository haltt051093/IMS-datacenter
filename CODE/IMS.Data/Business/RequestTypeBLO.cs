using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class RequestTypeBLO : BaseBLO<RequestType>
    {
        protected RequestTypeDAO dao;
        private static RequestTypeBLO instance;

        public static RequestTypeBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestTypeBLO();
                }
                return instance;
            }
        }


        private RequestTypeBLO()
        {
            baseDao = RequestTypeDAO.Current;
            dao = RequestTypeDAO.Current;
        }

    }
}
