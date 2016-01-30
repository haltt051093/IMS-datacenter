using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class AttributeExtendedModel : Attribute
    {
        public string AttributeName { get; set; }
        public string AttributeValue { get; set; }
    }
}
