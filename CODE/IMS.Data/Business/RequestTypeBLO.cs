using System.Linq;
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


        public string GetTypeName(string typeCode)
        {
            var query = RequestTypeDAO.Current.Query(x => x.RequestTypeCode == typeCode).
                Select(x => x.RequestTypeName).FirstOrDefault();
            if (query != null)
            {
                return query;
            }
            return null;
        }

        public bool IsExistedType(string requestType)
        {
            var type = dao.GetByKeys(new RequestType { RequestTypeCode = requestType });
            if (type != null)
            {
                return true;
            }
            return false;
        }
    }
}

