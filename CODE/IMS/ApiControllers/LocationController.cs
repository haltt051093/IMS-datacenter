using IMS.ApiModels;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.ViewModels;

namespace IMS.ApiControllers
{
    public class LocationController : BaseApiController
    {
        public DataTableModel<LocationViewModel> GetAll()
        {
            var locations = LocationBLO.Current.GetAllLocation();
            var result = new DataTableModel<LocationViewModel>();
            result.Data = locations;
            return result;
        }

        public DataTableModel<LocationViewModel> GetLocationForChange(string code)
        {
            var server = ServerBLO.Current.GetServerByCode(code, Constants.StatusCode.SERVER_RUNNING);
            var locations = LocationBLO.Current.GetChangeLocation(server);
            var result = new DataTableModel<LocationViewModel>();
            result.Data = locations;
            return result;
        } 
    }
}
