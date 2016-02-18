using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ScheduleIndexViewModel
    {
        public ScheduleIndexViewModel()
        {
            Schedules = new List<ScheduleExtendedModel>();
        }
        public List<ScheduleExtendedModel> Schedules { get; set; }
    }
}