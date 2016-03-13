using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Queries;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class LocationBLO : BaseBLO<Location>
    {
        protected LocationDAO dao;
        private static LocationBLO instance;

        public static LocationBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LocationBLO();
                }
                return instance;
            }
        }

        private LocationBLO()
        {
            baseDao = LocationDAO.Current;
            dao = LocationDAO.Current;
        }


        public bool UpdateLocation(string ServerCode, List<string> Locations, string request)
        {
            if (!request.Equals("Change"))
            {

                var locations = dao.GetAll();
                for (int i = 0; i < locations.Count; i++)
                {
                    if (locations[i].ServerCode == ServerCode)
                    {
                        locations[i].ServerCode = null;
                        locations[i].StatusCode = Constants.StatusCode.LOCATION_FREE;
                    }
                }
                for (int i = 0; i < Locations.Count; i++)
                {
                    for (int j = 0; j < locations.Count; j++)
                    {
                        if (Locations[i] == locations[j].LocationCode)
                        {
                            locations[j].StatusCode = Constants.StatusCode.LOCATION_USED;
                            locations[j].ServerCode = ServerCode;
                            dao.Update(locations[j]);
                        }
                    }
                }
               
                return true;
            }
            //else
            //{
            //    var existing = dao.Query(x => x.ServerCode == ServerCode).ToList();
            //    if (existing.Count > 0)
            //    {
            //        for (var i = 0; i < existing.Count; i++)
            //        {
            //            existing[i].StatusCode = Constants.StatusCode.LOCATION_FREE;
            //            existing[i].ServerCode = null;
            //        }

            //        var locations = dao.GetAll();
            //        var exist = locations.IndexOf(dao.Query(x => x.LocationCode == LocationCode).FirstOrDefault());
            //        for (var i = exist; i < (exist + size); i++)
            //        {
            //            if (locations[i].StatusCode.Equals(Constants.StatusCode.LOCATION_FREE))
            //            {
            //                locations[i].ServerCode = ServerCode;
            //                locations[i].StatusCode = Constants.StatusCode.LOCATION_USED;
            //            }
            //            else
            //            {
            //                return false;
            //            }
            //        }
            //        dao.UpdateMany(existing);
            //        dao.UpdateMany(locations);
            //        return true;
            //    }
            //    return false;
            //}
            return false;
        }

        public List<LocationViewModel> GetAllLocation(GetLocationQuery q = null)
        {
            return dao.GetAllLocation(q);
        }

        public List<LocationViewModel> GetChangeLocation(Server server)
        {
            var allLocation = new List<LocationViewModel>();

            //Case: customer rent rack
            if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
            {
                allLocation = dao.GetCustomerRackValidPowerForChange(server);
            }
            else
            //Case: customer don't rent rack
            {
                allLocation = dao.GetRackValidPowerForChange(server);
            }
            allLocation = allLocation.OrderBy(x => x.RackCode)
                .ThenBy(x => x.RackUnit)
                .ToList();
            var allRackCode = allLocation.Select(x => x.RackCode).Distinct().ToList();
            var rackMaxSize = new Dictionary<string, int>();
            foreach (var rackCode in allRackCode)
            {
                rackMaxSize[rackCode] = 0;
            }
            var lastRackCode = string.Empty;
            var maxRackSize = 0;
            if (allLocation.Count > 0)
            {
                lastRackCode = allLocation[0].RackCode;
            }
            foreach (var location in allLocation)
            {
                if (lastRackCode != location.RackCode || !string.IsNullOrEmpty(location.ServerCode))
                {
                    if (maxRackSize > rackMaxSize[lastRackCode])
                    {
                        rackMaxSize[lastRackCode] = maxRackSize;
                    }
                    lastRackCode = location.RackCode;
                    maxRackSize = 0;
                }
                if (string.IsNullOrEmpty(location.ServerCode))
                {
                    maxRackSize++;
                }
            }
            if (maxRackSize > rackMaxSize[lastRackCode])
            {
                rackMaxSize[lastRackCode] = maxRackSize;
            }

            var result = new List<LocationViewModel>();
            foreach (var rackCode in allRackCode)
            {
                var maxSize = rackMaxSize[rackCode];
                if (maxSize >= server.Size.Value)
                {
                    result.AddRange(allLocation.Where(x => x.RackCode == rackCode));
                }
            }
            var r = 0;
            for (var i = 0; i < result.Count; i++)
            {
                if (result[i].RackCode.Equals(dao.GetRackOfServer(server).RackCode))
                {
                    r++;
                }
            }
            if (r > 0)
            {
                return result;
            }
            else
            {
                result.Add(dao.GetRackOfServer(server));
                return result;
            }

        }

        public List<LocationViewModel> GetNewLocation(Server server)
        {
            var allLocation = new List<LocationViewModel>();
            if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
            {
                allLocation = dao.GetCustomerRackValidPowerForNew(server);
            }
            else
            {
                allLocation = dao.GetRackValidPowerForNew(server);
            }
            allLocation = allLocation.OrderBy(x => x.RackCode)
                .ThenBy(x => x.RackUnit)
                .ToList();
            var allRackCode = allLocation.Select(x => x.RackCode).Distinct().ToList();
            var rackMaxSize = new Dictionary<string, int>();
            foreach (var rackCode in allRackCode)
            {
                rackMaxSize[rackCode] = 0;
            }
            var lastRackCode = string.Empty;
            var maxRackSize = 0;
            if (allLocation.Count > 0)
            {
                lastRackCode = allLocation[0].RackCode;
            }
            foreach (var location in allLocation)
            {
                if (lastRackCode != location.RackCode || !string.IsNullOrEmpty(location.ServerCode))
                {
                    if (maxRackSize > rackMaxSize[lastRackCode])
                    {
                        rackMaxSize[lastRackCode] = maxRackSize;
                    }
                    lastRackCode = location.RackCode;
                    maxRackSize = 0;
                }
                if (string.IsNullOrEmpty(location.ServerCode))
                {
                    maxRackSize++;
                }
            }
            if (maxRackSize > rackMaxSize[lastRackCode])
            {
                rackMaxSize[lastRackCode] = maxRackSize;
            }

            var result = new List<LocationViewModel>();
            foreach (var rackCode in allRackCode)
            {
                var maxSize = rackMaxSize[rackCode];
                if (maxSize >= server.Size.Value)
                {
                    result.AddRange(allLocation.Where(x => x.RackCode == rackCode));
                }
            }
            return result;
        }

        public List<RackOfCustomerExtendedModel> GetLocationsOfServer(string serverCode)
        {
            return dao.GetLocationsOfServer(serverCode);
        }

        public void SetLocationAvailable(string serverCode)
        {
            var query = dao.Query(x => x.ServerCode == serverCode);
            foreach (var item in query)
            {
                var location = item;
                location.ServerCode = null;
                location.StatusCode = Constants.StatusCode.LOCATION_FREE;
                Update(location);
            }
        }

        public string GenerateCode()
        {
            var code = "L" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.LocationCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "L" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.LocationCode == code).FirstOrDefault();
            }
            return code;
        }
    }
}
