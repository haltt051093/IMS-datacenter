using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ServerExtendedModel : Server
    {
        public Server _Server
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

        public string CustomerName { get; set; }

        public string RackCode { get; set; }

        public string RackName { get; set; }

        public int? RackUnit { get; set; }
        [Display(Name = "Server Status")]
        public string Status { get; set; }

        public string Memory { get; set; }

        public string TempCode { get; set; }

        public List<RequestExtendedModel> Requests { get; set; }

        public bool Checked { get; set; }

        public List<ServerIP> ServerIps { get; set; }

        public List<LocationViewModel> ServerLocation { get; set; }

        public List<string> locations { get; set; } 

        public string btnAction { get; set; }

        public string ServerDefaultIP { get; set; }
    }
}
