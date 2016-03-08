using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RackExtendedModel : Rack
    {
        public List<Rack> RacksOfRow { get; set; }
        public string RowName { get; set; }
    }
}
