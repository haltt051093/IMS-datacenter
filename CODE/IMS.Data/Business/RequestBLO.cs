using System;
using System.Collections.Generic;
using System.Linq;
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

        public string AddRequest(Request passModel, string requestType)
        {
            return dao.AddRequest(passModel, requestType);
        }
        //Tien
        public List<ScheduleExtendedModel> GetScheduleToday()
        {
            var allschedule = dao.GetSchedule();
            var scheduletoday = new List<ScheduleExtendedModel>();
            foreach (var item in allschedule)
            {
                if (item.AppointmentTime.Value.Date == DateTime.Now.Date)
                {
                    scheduletoday.Add(item);
                }
            }
            return scheduletoday;
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfShift()
        {
            return dao.GetNoteOfShift();
        }

        public List<NotificationExtendedModel> ListAllNotification()
        {
            return dao.ListAllNotification();
        }

        public void LogUpdateRequestStatus(string status, string requestCode)
        {
            dao.LogUpdateRequestStatus(status,requestCode);
        }

        public Request GetRequestByRequestCode(string requestCode)
        {
            return dao.GetRequestByRequestCode(requestCode);
        }

        public string GetCustomerOfRequest(string requestCode)
        {
            return RequestDAO.Current.Query(x => x.RequestCode == requestCode).Select(x => x.Customer).FirstOrDefault();
        }
    }
}
