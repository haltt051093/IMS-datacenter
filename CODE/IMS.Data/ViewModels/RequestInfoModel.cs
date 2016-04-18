using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RequestInfoModel : Request
    {
        [Display(Name = "Assignee")]
        public string AssigneeName { get; set; }
        [Display(Name = "Request Status")]
        public string StatusName { get; set; }
        [Display(Name = "Reason")]
        public string NotFinishReason { get; set; }
        [Display(Name = "Assigned Staff")]
        public string AssignedStaff { get; set; }
        public string AssignedStaffName { get; set; }
        [Display(Name = "Task Status")]
        public string TaskStatus { get; set; }
        [Display(Name = "Task Status")]
        public string TaskStatusName { get; set; }
        public string TaskCode { get; set; }
        public bool IsShifthead { get; set; }
        public string ShiftHead { get; set; }
        public string ShiftHeadName { get; set; }
        public DateTime? AssignedTime { get; set; }
        [Required(ErrorMessage = "Appointment Time is required.")]
        public string AppointmentTimeStr { get; set; }
    }
}
