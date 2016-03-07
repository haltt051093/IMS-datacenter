using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class LogChangedContentBLO : BaseBLO<LogChangedContent>
    {
        protected LogChangedContentDAO dao;
        private static LogChangedContentBLO instance;

        public static LogChangedContentBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogChangedContentBLO();
                }
                return instance;
            }
        }


        private LogChangedContentBLO()
        {
            baseDao = LogChangedContentDAO.Current;
            dao = LogChangedContentDAO.Current;
        }

        public List<LogChangedContent> GetBlockedIP(string IP)
        {
            return dao.GetBlockedIP(IP);
        }

        public List<LogChangeExtendModel> GetAllLogIP()
        {
            return dao.GetAllLogIP();
        }  

        public void AddLog(LogChangedContent viewmodel)
        {
            dao.AddLog(viewmodel);
        }

        public List<string> GetIpRequestReturnIp(string requestCode)
        {
            return dao.GetIpRequestReturnIp(requestCode);
        }

        public List<string> GetServerCodeByRequestCode(string requestCode)
        {
            return dao.GetServerCodeByRequestCode(requestCode);
        }

        public List<RequestExtendedModel> ListWaitingRequestOfServer(string serverCode)
        {
            return dao.ListWaitingRequestOfServer(serverCode);
        }
    }
}
