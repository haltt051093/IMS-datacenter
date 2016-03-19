using System;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RequestInfoModel : Request
    {
        public string AssigneeName { get; set; }
        public string StatusName { get; set; }
        public string RejectReason { get; set; }
        public string AssignedStaff { get; set; }
        public string TaskStatus { get; set; }
        public string TaskStatusName { get; set; }
        public string TaskCode { get; set; }
        public bool IsShifthead { get; set; }
        public string ShiftHead { get; set; }
        public DateTime? AssignedTime { get; set; }
    }
}
