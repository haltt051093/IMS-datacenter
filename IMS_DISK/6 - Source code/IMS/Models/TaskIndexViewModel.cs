using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class TaskIndexViewModel : BaseViewModel
    {
        public List<TaskExtendedModel> Tasks { get; set; }
        public string TaskCode { get; set; }
    }
}
