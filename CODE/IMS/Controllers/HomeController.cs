using System.Linq;
using System.Web.Mvc;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class HomeController : CoreController
    {
        [HttpGet]
        [Roles]
        public ActionResult Index(HomeIndexViewModel q)
        {
            var data = new HomeIndexViewModel();
            data.RoleLogin = GetCurrentUserRole();
            var user = GetCurrentUserName();
            if (data.RoleLogin == Constants.Role.CUSTOMER)
            {
                var currentips = IPAddressPoolBLO.Current.GetCurrentIPOfCustomer(user);
                data.Currentip = currentips.Count;
                var servers =
                    ServerBLO.Current.GetAll()
                        .Where(
                            x =>
                                x.Customer == user && x.StatusCode != Constants.StatusCode.SERVER_WAITING &&
                                x.StatusCode != Constants.StatusCode.SERVER_DEACTIVATE).ToList();
                data.RunningServer = servers.Count;
                data.countPendingRequest = RequestBLO.Current.CountCustomerPendingRequest(user);
                data.countProcessingRequest = RequestBLO.Current.CountCustomerProcessingRequest(user);
                data.countWeeklyRequest = RequestBLO.Current.CountCustomerWeeklyRequest(user);
                data.firstTenRequests = RequestBLO.Current.ListCustomerRequestAtHome(user);
            }
            if (data.RoleLogin != Constants.Role.CUSTOMER)
            {
                var servers =
                    ServerBLO.Current.GetAll()
                        .Where(
                            x => x.StatusCode != Constants.StatusCode.SERVER_WAITING &&
                                x.StatusCode != Constants.StatusCode.SERVER_DEACTIVATE).ToList();
                data.RunningServer = servers.Count;
                var blocked = 0;
                var available = 0;
                var used = 0;
                var ips = IPAddressPoolBLO.Current.GetAllIP();
                for (int i = 0; i < ips.Count; i++)
                {
                    if (ips[i].StatusCode == Constants.StatusCode.IP_AVAILABLE)
                    {
                        available++;
                    }
                    if (ips[i].StatusCode == Constants.StatusCode.IP_BLOCKED)
                    {
                        blocked++;
                    }
                    if (ips[i].StatusCode == Constants.StatusCode.IP_USED)
                    {
                        used++;
                    }
                }
                data.countavailableip = available;
                data.countblockedip = blocked;
                data.countusedip = used;
                data.countPendingRequest = RequestBLO.Current.CountAllPendingRequest();
                data.countProcessingRequest = RequestBLO.Current.CountAllProcessingRequest();
                data.countWeeklyRequest = RequestBLO.Current.CountAllWeeklyRequest();
                data.firstTenRequests = RequestBLO.Current.ListRequestAtHome();
            }
            return View(data);
        }

        [ChildActionOnly]
        public PartialViewResult Header()
        {
            var username = GetCurrentUserName();
            var data = new HomeHeaderViewModel();
            data.Account = GetCurrentAccount();
            data.Notifications = NotificationBLO.Current.GetByUser(username);
            data.NumberOfUnread = NotificationBLO.Current.CountUserUnread(username);
            return PartialView(data);
        }

        [ChildActionOnly]
        public PartialViewResult Sidebar()
        {
            var data = new HomeSidebarViewModel();
            data.Account = GetCurrentAccount();
            return PartialView(data);
        }
    }
}