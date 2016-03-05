using System.Web.Http;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.ViewModels;

namespace IMS.ApiControllers
{
    public class LocationController : ApiController
    {
        public DataTableModel<LocationExtendedModel> GetAll()
        {
            var locations = LocationBLO.Current.GetAllLocation();
            var result = new DataTableModel<LocationExtendedModel>();
            result.Data = locations;
            return result;
        }
    }
}
