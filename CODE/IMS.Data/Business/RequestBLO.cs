﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Core.Express;
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

        public List<NotificationExtendedModel> ListAllNotification()
        {
            return dao.ListAllNotification();
        }
    }
}
