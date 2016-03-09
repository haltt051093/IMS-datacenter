using System;
using System.Collections;
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
        

        public string AddRequest(string requestType, string customer, string description, DateTime? appointmenTime)
        {
            return dao.AddRequest(requestType, customer, description, appointmenTime);
        }
        //Tien
        public List<ScheduleExtendedModel> GetScheduleToday()
        {
            var allschedule = dao.GetSchedule();
            var scheduletoday = new List<ScheduleExtendedModel>();
            foreach (var item in allschedule)
            {
                if (item.AppointmentTime != null)
                {
                    if (item.AppointmentTime.Value.Date == DateTime.Now.Date)
                    {
                        scheduletoday.Add(item);
                    }
                }

            }
            return scheduletoday;
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
            else if (role == Constants.Role.SHIFT_HEAD || role == Constants.Role.STAFF)
            {
                list = ListServerSideNotification();
            }
            return list;
        }

        public Request GetRequestByRequestCode(string requestCode)
        {
            return dao.GetRequestByRequestCode(requestCode);
        }

        public string GetCustomerOfRequest(string requestCode)
        {
            return RequestDAO.Current.Query(x => x.RequestCode == requestCode).Select(x => x.Customer).FirstOrDefault();
        }

        public void UpdateRequestStatus(string requestCode, string newStatus)
        {
            dao.UpdateRequestStatus(requestCode, newStatus);
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
                //get previous id
                var preId = ServerIPBLO.Current.GetPreviousIp(selectedServer, item.old);
                //them hang moi vao serverip
                ServerIPBLO.Current.AddServerIp(selectedServer, item.changed, preId);
                //change status cua old ip o server ip
                ServerIPBLO.Current.UpdateStatusServerIp(Constants.StatusCode.SERVERIP_RETURNING, 
                    Constants.StatusCode.SERVERIP_OLD, item.old);
                //Update status cua IP moi o IPAddressPool
                IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_USED, item.changed);
                //update status cua up cu o IPAddresspool
                IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_AVAILABLE, item.old);

                //Add log trang thai IP moi
                LogChangedContent logIp = new LogChangedContent
                {
                    RequestCode = requestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                    Object = Constants.Object.OBJECT_IP,
                    ChangedValueOfObject = item.changed,
                    ObjectStatus = Constants.StatusCode.IP_USED,
                    Staff = staffCode
                };
                LogChangedContentBLO.Current.AddLog(logIp);
                //}

                //Add log trang thai IP cu
                LogChangedContent logPreIp = new LogChangedContent
                {
                    RequestCode = requestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                    Object = Constants.Object.OBJECT_IP,
                    ChangedValueOfObject = item.old,
                    ObjectStatus = Constants.StatusCode.IP_AVAILABLE,
                    Staff = staffCode
                };
                LogChangedContentBLO.Current.AddLog(logPreIp);
            }
        }
    }
}
