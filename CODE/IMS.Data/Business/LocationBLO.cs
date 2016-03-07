using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
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


        public bool UpdateLocation(int? size, string ServerCode, string LocationCode, string request)
        {
            if (!request.Equals("Change"))
            {
                List<Location> locations = dao.GetAll();
                int exist = locations.IndexOf(dao.Query(x => x.LocationCode == LocationCode).FirstOrDefault());
                for (int i = exist; i < (exist + size); i++)
                {
                    if (locations[i].StatusCode.Equals(Constants.StatusCode.LOCATION_FREE))
                    {
                        locations[i].ServerCode = ServerCode;
                        locations[i].StatusCode = Constants.StatusCode.LOCATION_USED;
                    }
                    else
                    {
                        return false;
                    }
                }
                dao.UpdateMany(locations);
                return true;
            }
            else
            {
                List<Location> existing = dao.Query(x => x.ServerCode == ServerCode).ToList();
                if (existing.Count > 0)
                {
                    for (int i = 0; i < existing.Count; i++)
                    {
                        existing[i].StatusCode = Constants.StatusCode.LOCATION_FREE;
                        existing[i].ServerCode = null;
                    }

                    List<Location> locations = dao.GetAll();
                    int exist = locations.IndexOf(dao.Query(x => x.LocationCode == LocationCode).FirstOrDefault());
                    for (int i = exist; i < (exist + size); i++)
                    {
                        if (locations[i].StatusCode.Equals(Constants.StatusCode.LOCATION_FREE))
                        {
                            locations[i].ServerCode = ServerCode;
                            locations[i].StatusCode = Constants.StatusCode.LOCATION_USED;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    dao.UpdateMany(existing);
                    dao.UpdateMany(locations);
                    return true;
                }
                return false;
            }
        }


        private LocationBLO()
        {
            baseDao = LocationDAO.Current;
            dao = LocationDAO.Current;
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
        public List<LocationExtendedModel> GetAllLocation()
        {
            return dao.GetAllLocation();
        }

        public List<LocationExtendedModel> GetChangeLocation(Server server)
        {
            var allLocation = new List<LocationExtendedModel>();

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

            var result = new List<LocationExtendedModel>();
            foreach (var rackCode in allRackCode)
            {
                var maxSize = rackMaxSize[rackCode];
                if (maxSize >= server.Size.Value)
                {
                    result.AddRange(allLocation.Where(x => x.RackCode == rackCode));
                }
            }
            int r = 0;
            for (int i = 0; i < result.Count; i++)
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

        public List<LocationExtendedModel> GetNewLocation(Server server)
        {
            var allLocation = new List<LocationExtendedModel>();
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

            var result = new List<LocationExtendedModel>();
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

        public List<string> GetLocationStatus()
        {
            return dao.GetLocationStatus();
        }

        public List<RackOfCustomerExtendedModel> GetLocationsOfServer(string serverCode)
        {
            return dao.GetLocationsOfServer(serverCode);
        }

        public void SetLocationAvailable(string serverCode)
        {
            dao.SetLocationAvailable(serverCode);
        }
    }
}
