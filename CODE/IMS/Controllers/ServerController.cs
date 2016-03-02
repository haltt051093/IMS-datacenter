using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : CoreController
    {
        public ActionResult Index()
        {
            var servers = ServerBLO.Current.GetAllServer();
            //get requests cua server
            var data = new ServerIndexViewModel();
            foreach (var item in servers)
            {
                var requestOfServer = LogChangedContentBLO.Current.ListWaitingRequestOfServer(item.ServerCode);
                item.Requests = requestOfServer;
            }
            data.Servers = servers;
            return View(data);
        }

        // GET: Server/Details
        public ActionResult ServerDetails(int id)
        {
            var server = ServerBLO.Current.GetServerById(id);
            var serverattributes = ServerBLO.Current.GetServerAttributes(id);
            var servercurrentips = ServerBLO.Current.GetCurrentIP(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            var data = new ServerDetailsViewModel();
            //them list location
            data.Locations = LocationBLO.Current.GetLocationsOfServer(server.ServerCode);
            data.Attributes = serverattributes;
            data.Server = server;
            data.CurrentIPs = servercurrentips;
            return View(data);
        }
    }
}
