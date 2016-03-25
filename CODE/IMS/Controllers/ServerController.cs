using System;
using System.Linq;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Queries;
using IMS.Models;

namespace IMS.Controllers
{
    [Authorize]
    public class ServerController : CoreController
    {
        public ActionResult Index()
        {
            var role = GetCurrentUserRole();
            var data = new ServerIndexViewModel();
            var customer = GetCurrentUserName();
            var listStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_SERVER);
            data.ServerStatus = listStatus
                        .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                        .ToList();
            if (role == Constants.Role.CUSTOMER)
            {
                var servers = ServerBLO.Current.GetServerOfCustomer(customer);
                foreach (var item in servers)
                {
                    item.Requests = RequestBLO.Current.GetWaitingRequestOfServer(item.ServerCode);
                }
                data.Servers = servers;
            }
            else
            {
                //get all servers
                var servers = ServerBLO.Current.GetAllServer();
                foreach (var item in servers)
                {
                    item.Requests = RequestBLO.Current.GetWaitingRequestOfServer(item.ServerCode);
                }
                data.Servers = servers;
            }
            return View(data);
        }

        // GET: Server/Details
        public ActionResult Detail(string code, string Message)
        {
            var data = new ServerDetailsViewModel();
            data.UserRole = GetCurrentUserRole();   
            data.SuccessMessage = Message;
            data.Server = ServerBLO.Current.GetAllServerInfo(code);
            //var serverattributes = ServerBLO.Current.GetServerAttributes(serverCode);
            var ips = ServerIPBLO.Current.GetCurrentIP(code);
            if (ips != null)
            {
                data.CurrentIPs = ips;
            }
            //get customer
            data.CustomerInfo = AccountBLO.Current.GetAccountByCode(data.Server.Customer);
            return View(data);
        }


        [HttpGet]
        public ActionResult GetLocationByRackName(ServerDetailsViewModel model)
        {
            Server s = new Server();
            s.ServerCode = model.ServerCode;
            s.Power = model.Power;
            s.Customer = model.Customer;
            var locations = LocationBLO.Current.GetChangeLocation(s);
            var data = new ServerDetailsViewModel();
            if (!String.IsNullOrWhiteSpace(model.SelectedRack))
            {
                locations = locations.Where(r => r.RackName.Trim() == model.SelectedRack.Trim()).ToList();
            }
            data.Locations1 = locations;

            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
