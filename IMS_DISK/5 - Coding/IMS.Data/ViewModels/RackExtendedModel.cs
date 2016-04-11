using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RackExtendedModel : Rack
    {
        public Rack _Rack
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

        public List<RackExtendedModel> RacksOfRow { get; set; }
        public string RowName { get; set; }
        public bool Checked { get; set; }
    }
}
