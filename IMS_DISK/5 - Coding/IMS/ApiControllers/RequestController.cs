using System.Web.Http;
using IMS.ApiModels;
using IMS.Data.ViewModels;

namespace IMS.ApiControllers
{
    public class RequestController : BaseApiController
    {
        [HttpGet]
        public DataTableModel<RequestExtendedModel> GetForUser()
        {
            return new DataTableModel<RequestExtendedModel>();
        }
    }
}
