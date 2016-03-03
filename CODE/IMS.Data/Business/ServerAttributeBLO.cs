using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class ServerAttributeBLO : BaseBLO<ServerAttribute>
    {
        protected ServerAttributeDAO dao;
        private static ServerAttributeBLO instance;

        public static ServerAttributeBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerAttributeBLO();
                }
                return instance;
            }
        }


        private ServerAttributeBLO()
        {
            baseDao = ServerAttributeDAO.Current;
            dao = ServerAttributeDAO.Current;
        }

        public List<AttributeExtendedModel> GetServerAttributes(string serverCode, string status)
        {
            return dao.GetServerAttributes(serverCode, status);
        }

        public void UpdateServerAttributeStatus(string serverCode, string status)
        {
            dao.UpdateServerAttributeStatus(serverCode, status);
        }
    }
}
