using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Queries;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class LocationController : CoreController
    {
        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index(string Message)
        {
            var data = new LocationIndexViewModel();
            data.SuccessMessage = Message;
            var locations = LocationBLO.Current.GetAllLocation();
            var list = locations.Where(x => x.RackStatus == Constants.StatusCode.RACK_AVAILABLE);
            var listavailablerack =
                list.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.RackAvailableCount = listavailablerack.Count();
            var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.Racks = listrack.Select(x => new SelectListItem
            {
                Value = x.RackName,
                Text = x.RackName +"  "+ x.Fullname
            }).ToList();

            var listpow = new List<SelectListItem>();
            int[] listp = new int[] {10,11,12,13,14,15,16,17,18,19,20};
            foreach (var i in listp)
            {
                string num = (i).ToString();
                SelectListItem item = new SelectListItem()
                {
                    Value = num,
                    Text = num + "KW"
                };
                listpow.Add(item);
            }
            data.ListPower = listpow;
            data.Locations = locations;
            return View(data);
        }

        [HttpPost]
        public JsonResult AddLocation(LocationIndexViewModel data)
        {
            var result = new JsonResultModel();
            var rack = new Rack();
            var existing = RackBLO.Current.GetByName(new Rack { RackName = data.RackName });
            if (existing == null)
            {
                rack.RackName = data.RackName;
                rack.MaximumPower = data.MaximumPower;
                RackBLO.Current.AddRackAndLocation(rack);
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }
            
            return Json(result);
        }

        public ActionResult AssignLocation(string ServerCode, string rType, string rCode, int Size, string FailMessage)
        {
            var data = new LocationIndexViewModel();
            data.Size = Size;
            data.FailMessage = FailMessage;
            var server = ServerBLO.Current.GetServerByCode(ServerCode, Constants.StatusCode.SERVER_WAITING);
            if (rType == "Change")
            {
                server = ServerBLO.Current.GetServerByCode(ServerCode, Constants.StatusCode.SERVER_RUNNING);
            }
            
            var locationserver = LocationBLO.Current.GetLocationOfServer(ServerCode);
            //truong hop assign lan dau
            if (locationserver.Count == 0)
            {
                var locations = LocationBLO.Current.GetNewLocation(server);
                var listrack =
                    locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
                data.Racks = listrack.Select(x => new SelectListItem
                {
                    Value = x.RackCode,
                    Text = x.RackName
                }).ToList();
                if (locations.Count == 0)
                { 
                    if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
                    {
                        var locations1 = LocationBLO.Current.GetNewLocation1(server);
                        var listrack1 =
                            locations1.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
                        data.Racks1 = listrack1.Select(x => new SelectListItem
                        {
                            Value = x.RackCode,
                            Text = x.RackName
                        }).ToList();
                        data.Notice = "HaveRack";
                    }
                }
                
            }
            else
            {
                var locations = LocationBLO.Current.GetChangeLocation(server);
                var listrack =
                    locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
                data.Racks = listrack.Select(x => new SelectListItem
                {
                    Value = x.RackCode,
                    Text = x.RackName
                }).ToList();
                if (locations.Count == 0)
                {
                    if (RackOfCustomerDAO.Current.GetRackOfCustomer(server).Count > 0)
                    {
                        var locations1 = LocationBLO.Current.GetChangeLocation1(server);
                        var listrack1 =
                            locations1.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
                        data.Racks1 = listrack1.Select(x => new SelectListItem
                        {
                            Value = x.RackCode,
                            Text = x.RackName
                        }).ToList();
                        data.Notice = "HaveRack";
                    }
                }
            }
            data.RequestCode = rCode;
            data.RequestType = rType;
            data.ServerCode = ServerCode;
            return View(data);

        }

        [HttpPost]
        public ActionResult AssignLocation(LocationIndexViewModel livm)
        {
            var selectedLocationCodes = livm.Selected
                .Where(x => x.IsSelected)
                .Select(x => x.LocationCode)
                .ToList();
            if (selectedLocationCodes.Count == 0)
            {
                return View(livm);
            }
            var location = LocationBLO.Current.GetByKeys(new Location {LocationCode = selectedLocationCodes[0]});
            if (location == null)
            {
                return View(livm);
            }

            var locations = LocationBLO.Current.GetAllLocation(new GetLocationQuery {RackCode = location.RackCode});
            var startIndex = -1;
            var endIndex = -1;
            for (var i = 0; i < locations.Count; i++)
            {
                var l = locations[i];
                if (startIndex == -1 && selectedLocationCodes.Contains(l.LocationCode))
                {
                    startIndex = i;
                }
                if (startIndex != -1 && selectedLocationCodes.Contains(l.LocationCode))
                {
                    endIndex = i;
                }
                if (startIndex != -1 && !selectedLocationCodes.Contains(l.LocationCode))
                {
                    break;
                }
            }

            if ((endIndex - startIndex + 1) != livm.Size ||
                (locations[startIndex].ServerCode != null && locations[startIndex].ServerCode != livm.ServerCode) ||
                (locations[endIndex].ServerCode != null && locations[endIndex].ServerCode != livm.ServerCode))
            {
                return RedirectToAction("AssignLocation", "Location",
                    new
                    {
                        FailMessage = "Assign Location Fail! Try Again!",
                        rType = livm.RequestType,
                        rCode = livm.RequestCode,
                        ServerCode = livm.ServerCode,
                        Size = livm.Size
                    });
            }

        string user = GetCurrentUserName();
            bool result = LocationBLO.Current.UpdateLocation(livm.ServerCode, selectedLocationCodes, user, livm.RequestType);
            if (result)
            {
                if (livm.RequestType == "Change")
                {
                    return RedirectToAction("Detail", "Server", new {code = livm.ServerCode, Message ="Location was changed!"});
                }
                else
                {
                    return RedirectToAction("Detail", "ProcessRequest",
                        new {code = livm.RequestCode});
                }
            }
            else
            {
                return RedirectToAction("Detail", "ProcessRequest", new { code = livm.RequestCode });
            }
        }
    }
}