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
        public List<RequestExtendedModel> GetAllRequest()
        {
            return dao.GetAllRequest();
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
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfPreviousShift()
        {
            return dao.GetNoteOfPreviousShift();
        }

        public List<NotificationExtendedModel> ListAllNotification()
        {
            return dao.ListAllNotification();
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
    }
}
