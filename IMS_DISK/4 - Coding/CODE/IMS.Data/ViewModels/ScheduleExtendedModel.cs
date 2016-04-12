using System;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ScheduleExtendedModel : Request
    {
        public Request _Request
        {
            set
            {
                if (value == null)
                {
                    return;
                }
                ObjectExpress.CopyValues(value, this);
            }
        }

        public string StatusName { get; set; }
        public string RequestTypeName { get; set; }
        public string NoteContent { get; set; }
        public string Fullname { get; set; }
    }
}
