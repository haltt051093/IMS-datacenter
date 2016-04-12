using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IMS.Validations
{
    public class CustomRequiredAttribute : ValidationAttribute, IClientValidatable
    {
        public IEnumerable<ModelClientValidationRule> GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {

            var clientValidationRule = new ModelClientValidationRule()
            {
                ErrorMessage = ErrorMessage?? metadata.GetDisplayName() + "is not selected",
                ValidationType = "customrequired"
            };

            return new[] { clientValidationRule };
        }

        public override bool IsValid(object value)
        {
            return true;
        }
    }
}