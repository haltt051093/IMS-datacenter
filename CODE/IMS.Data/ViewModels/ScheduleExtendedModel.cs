using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ScheduleExtendedModel : Request
    {
        public string Status { get; set; }
        public string RequestTypeName { get; set; }
    }
}
