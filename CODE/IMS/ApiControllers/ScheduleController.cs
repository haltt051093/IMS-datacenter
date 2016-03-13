using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IMS.ApiModels;
using IMS.Core.Extensions;

namespace IMS.ApiControllers
{
    public class ScheduleController : BaseApiController
    {
        public List<FullCalendarReponse> GetSchedule(long start, long end)
        {
            var startTime = start.AsEpochToDateTime();
            var endTime = end.AsEpochToDateTime();

        }
    }
}
