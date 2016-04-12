using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.ApiModels;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;

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

        public List<string> GetListRack()
        {
            var locations = LocationBLO.Current.GetAllLocation();
            var result = new List<string>();
            var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            result = listrack.Select(x=>x.RackName).ToList();
            return result;
        }

        public int GetEmptyRackCount()
        {
            var locations = LocationBLO.Current.GetAllLocation();
            var list = locations.Where(x => x.RackStatus == Constants.StatusCode.RACK_AVAILABLE);
            var listavailablerack =
                list.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            int count = listavailablerack.Count();
            return count;
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
            if (server == null)
            {
                server = server = ServerBLO.Current.GetServerByCode(code, Constants.StatusCode.SERVER_RUNNING);
            }
            var locationserver = LocationBLO.Current.GetLocationOfServer(code);
            var locations = new List<LocationViewModel>();
            var locations1 = new List<LocationViewModel>();
            if (locationserver.Count == 0)
            {
                locations = LocationBLO.Current.GetNewLocation(server);
                if (locations.Count == 0)
                {
                    if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
                    {
                        locations1 = LocationBLO.Current.GetNewLocation1(server);
                    }
                }
            }
            else
            {
                locations = LocationBLO.Current.GetChangeLocation(server);
                if (locations.Count == 0)
                {
                    if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
                    {
                        locations1 = LocationBLO.Current.GetChangeLocation1(server);
                    }
                }
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
