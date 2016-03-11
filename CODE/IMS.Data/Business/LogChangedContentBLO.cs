using System.Collections.Generic;
using System.Linq;
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

        public LogChangedContent GetByServerCode(string servercode)
        {
            var query = @"select s.* from LogChangedContent as s where s.ServerCode='" + servercode + @"'and s.TypeOfLog='ASSIGNDEFAULTIP'";
            return dao.RawQuery<LogChangedContent>(query, new object[] { }).FirstOrDefault();
        }

        public void CancelRequestChangeIp(string requestCode)
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
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
            }
        }

        public void CancelRequestReturnIp(string requestCode)
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
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        Constants.Test.CUSTOMER_MANHNH);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
            }
        }

        public void CancelRequestBringServerAway(string requestCode)
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
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_CURRENT,
                        Constants.Test.CUSTOMER_MANHNH);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
                //update and log server
                ServerBLO.Current.UpdateServerStatus(requestCode, serverCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_RUNNING,
                    Constants.Test.CUSTOMER_MANHNH);
            }
        }

        public void CancelRequestReturnRack(string requestCode)
        {
            var listRacks = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
            if (listRacks != null && listRacks.Count > 0)
            {
                for (int i = 0; i < listRacks.Count; i++)
                {
                    var rack = listRacks[i].ChangedValueOfObject;
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack,
                        Constants.TypeOfLog.LOG_RETURN_RACK, Constants.Test.CUSTOMER_MANHNH, null,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
            }
        }

        public void CancelRequestAddServer(string requestCode)
        {
            var listRacks = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
            if (listRacks != null && listRacks.Count > 0)
            {
                for (int i = 0; i < listRacks.Count; i++)
                {
                    var rack = listRacks[i].ChangedValueOfObject;
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack,
                        Constants.TypeOfLog.LOG_RETURN_RACK, Constants.Test.CUSTOMER_MANHNH, null,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
            }
        }
    }
}
