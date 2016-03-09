using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ScheduleExtendedModel : Request
    {
        public string StatusName { get; set; }
        public string RequestTypeName { get; set; }
        public string NoteContent { get; set; }
    }
}
