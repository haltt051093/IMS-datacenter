using System.ComponentModel.DataAnnotations.Schema;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class AttributeExtendedModel : Models.Attribute
    {
        public string AttributeName { get; set; }
        public string AttributeValue { get; set; }
    }
}
