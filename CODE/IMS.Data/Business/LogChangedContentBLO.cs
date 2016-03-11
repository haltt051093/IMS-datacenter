using System.Collections.Generic;
using IMS.Core;
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

        public List<LogContentExtendedModel> GetAllLogIP()
        {
            return dao.GetAllLogIP();
        }

        public List<LogUsedIPExtendModel> GetLogUsedIP()
        {
            return dao.GetLogUsedIP();
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

        public List<LogExtentedModel> GetAllRequest()
        {
            return dao.GetAllRequest();
        }

        public List<LogChangedContent> GetLogInfoByRequestCode(string requestCode, string Object)
        {
            return dao.GetLogInfoByRequestCode(requestCode, Object);
        }

        public bool CancelRequestChangeIp(string requestCode)
        {
            var listServerIp = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        Constants.Test.CUSTOMER_MANHNH);
                    //Update and log ip
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, serverCode, ip,
                        Constants.StatusCode.IP_USED, Constants.TypeOfLog.LOG_CHANGE_IP, Constants.Test.CUSTOMER_MANHNH);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
            }
            return true;
        }
    }
}
