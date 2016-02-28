using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ScheduleIndexViewModel
    {
        public ScheduleIndexViewModel()
        {
            Schedules = new List<ScheduleExtendedModel>();
            Schedules1 = new List<ScheduleExtendedModel>();
        }
        public List<ScheduleExtendedModel> Schedules1 { get; set; }
        public List<ScheduleExtendedModel> Schedules { get; set; }
        public List<string> NewNote { get; set; }
        public string StaffCode { get; set; }
    }
}