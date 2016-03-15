using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class RequestBLO : BaseBLO<Request>
    {
        protected RequestDAO dao;
        private static RequestBLO instance;

        public static RequestBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestBLO();
                }
                return instance;
            }
        }


        private RequestBLO()
        {
            baseDao = RequestDAO.Current;
            dao = RequestDAO.Current;
        }


        public string AddRequestANDLog(string requestType, string newStatus, string customer,
            string description, DateTime? appointmenTime, string serverCode, string typeOfLog, string UniqueRequestCode)
        {
            return dao.AddRequestANDLog(requestType, newStatus, customer, description, appointmenTime,
                serverCode, typeOfLog, UniqueRequestCode);
        }
        //Tien
        public List<ScheduleExtendedModel> GetSchedule(DateTime? start = null, DateTime? end = null)
        {
            var reult = dao.GetSchedule(start, end);
            return reult;
        }

        public List<ScheduleExtendedModel> GetScheduleToday()
        {
            var today = DateTime.Now.Date;
            var tomorrow = today.AddDays(1);
            var reult = dao.GetSchedule(today, tomorrow);
            return reult;
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfShift()
        {
            return dao.GetNoteOfShift();
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfPreviousShift()
        {
            return dao.GetNoteOfPreviousShift();
        }

        public List<NotificationExtendedModel> ListServerSideNotification()
        {
            return dao.ListServerSideNotification();
        }

        public List<NotificationExtendedModel> ListClientSideNotification(string customer)
        {
            return dao.ListClientSideNotification(customer);
        }

        public List<NotificationExtendedModel> ListNotification(string role, string customer)
        {
            var list = new List<NotificationExtendedModel>();
            if (role == Constants.Role.CUSTOMER && customer != null)
            {
                list = ListClientSideNotification(customer);
            }
            else if (role == Constants.Role.SHIFT_HEAD || role == Constants.Role.STAFF || role == Constants.Role.MANAGER)
            {
                list = ListServerSideNotification();
            }
            return list;
        }

        public string GetCustomerOfRequest(string requestCode)
        {
            return RequestDAO.Current.Query(x => x.RequestCode == requestCode).Select(x => x.Customer).FirstOrDefault();
        }

        public void UpdateRequestStatusANDLog(string requestCode, string typeOfLog, string newStatus, string assignee, string staffCode, string description)
        {
            dao.UpdateRequestStatusANDLog(requestCode, typeOfLog, newStatus, assignee, staffCode, description);
        }

        public string GenerateCode()
        {
            return dao.GenerateCode();
        }

        public void UpdateChangeIP(List<string> returningIp, List<string> selectedIps,
            string selectedServer, string requestCode, string staffCode)
        {
            var list = Enumerable.Zip(returningIp, selectedIps, (old, changed) => new { old, changed });
            foreach (var item in list)
            {
                //update and log status cua old ip o server ip
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, selectedServer, item.old,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_OLD, staffCode);
                //update and log status cua up cu o IPAddresspool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item.old, Constants.StatusCode.IP_AVAILABLE,
                    Constants.TypeOfLog.LOG_CHANGE_IP, staffCode);

                //add and log new serverip
                ServerIPBLO.Current.AddServerIpAndLog(requestCode, selectedServer, item.changed,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT, staffCode);
                //Update and log status cua IP moi o IPAddressPool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item.changed, Constants.StatusCode.IP_USED,
                    Constants.TypeOfLog.LOG_CHANGE_IP, staffCode);
            }
        }

        public string AddRequest(string requestCode, string requestType, string newStatus, string customer,
            string description, DateTime? appointmenTime)
        {
            return dao.AddRequest(requestCode, requestType, newStatus, customer, description, appointmenTime);
        }

        public RequestInfoModel GetRequestInfo(string requestCode)
        {
            var request = (from r in RequestDAO.Current.Table()
                           where r.RequestCode == requestCode
                           select new RequestInfoModel()
                           {
                               StatusCode = r.StatusCode,
                               RequestCode = r.RequestCode,
                               StaffCode = r.StatusCode,
                               Description = r.Description,
                               IsViewed = r.IsViewed,
                               RequestType = r.RequestType,
                               RequestedTime = r.RequestedTime,
                               Customer = r.Customer
                           }).FirstOrDefault();
            request.StatusName = StatusBLO.Current.GetStatusName(request.StatusCode);
            return request;
        }

        public Account GetAssignee(string requestCode)
        {
            var query1 = from r in RequestDAO.Current.Table()
                           where r.RequestCode == requestCode
                           select r.Assignee;
            var assignee = query1.FirstOrDefault().ToString();
            var query = from a in AccountDAO.Current.Table()
                        where a.Username == assignee
                        select a;
            return query.FirstOrDefault();
        }

    }
}
