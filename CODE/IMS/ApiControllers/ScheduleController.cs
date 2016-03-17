using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IMS.ApiModels;
using IMS.Core.Extensions;
using IMS.Data.Business;

namespace IMS.ApiControllers
{
    public class ScheduleController : BaseApiController
    {
        public List<FullCalendarReponse> GetSchedule(long start, long end)
        {
            var startTime = start.AsEpochToDateTime();
            var endTime = end.AsEpochToDateTime();
            var schedule = RequestBLO.Current.GetSchedule(startTime, endTime);
            var result = schedule.Select(x =>
                    {
                        var appointmentTime = x.AppointmentTime ?? DateTime.Now.Date;
                        return new FullCalendarReponse
                        {
                            Title = string.Format("[{0}] {1}--{2}", x.RequestTypeName, x.Fullname, x.StatusName),
                            Start = appointmentTime.ToString("yyyy-MM-dd HH:mm:ss"),
                            AllDay = false,
                            Status = x.StatusCode
                        };
                    })
                .ToList();
            return result;

        }
    }
}
