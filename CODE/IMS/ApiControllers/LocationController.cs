using System.Collections.Generic;
using IMS.ApiModels;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Repository;
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

        public DataTableModel<LocationViewModel> GetLocationForAssign(string code)
        {
            var server = ServerBLO.Current.GetServerByCode(code, Constants.StatusCode.SERVER_WAITING);
            var locationserver = LocationBLO.Current.GetLocationsOfServer(code);
            var locations = new List<LocationViewModel>();
            var locations1 = new List<LocationViewModel>();
            if (locationserver.Count == 0)
            {
                locations = LocationBLO.Current.GetNewLocation(server);
                if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
                {
                    locations1 = LocationBLO.Current.GetNewLocation1(server);
                }
                    
            }
            else
            {
                locations = LocationBLO.Current.GetChangeLocation(server);
            }
           
            var result = new DataTableModel<LocationViewModel>();
            var result1 = new List<LocationViewModel>();
            result1.AddRange(locations);
            result1.AddRange(locations1);
            result.Data = result1;
            return result;
        }  
    }
}
