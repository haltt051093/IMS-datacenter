using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RequestExtendedModel : Request
    {
        public string StatusName { get; set; }
    }
}