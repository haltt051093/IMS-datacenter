using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using AutoMapper.Internal;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : Controller
    {
        // GET: Server
        public ActionResult Index()
        {
            var data = new ServerIndexViewModel();
            var server = ServerBLO.Current.GetAllServer();
            data.Servers = server;
            //list customer
            var customers = new List<string>();
            var distinctcust = server.OrderBy(x => x.CustomerName).Select(x => x.CustomerName).ToList();
            customers.AddRange(distinctcust.Distinct());
            ViewBag.CustomerSearch = new SelectList(customers);
            return View(data);
        }

        public ActionResult TestDynamicSearch(string searchBy, string search)
        {
            var server = ServerBLO.Current.GetAllServer();
            //DOING
            var data = new ServerIndexViewModel();
            if (!String.IsNullOrEmpty(search))
            {
                var servers = server.Where(s => s.Customer.Contains(search)).ToList();
                data.Servers = servers;
            }
            return View(data);

            //var value = ServerBLO.Current.Search(searchBy, search);
            //var test = value;
            //return View("TestDynamicSearch");

            //if (searchBy == "Customer")
            //{
            //    var searchedValues = ServerBLO.Current.GetAllServer().Where(x => x.Customer.StartsWith(search)).ToList();
            //    var data = new ServerIndexViewModel();
            //    ;
            //    return View(data);
            //}
            //else
            //{
            //    return RedirectToAction("Index");
            //}
        }

        // GET: Server/Details/5
        public ActionResult ServerDetails(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var server = ServerBLO.Current.GetServerById(id);
            var serverattributes = ServerBLO.Current.GetServerAttributes(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            var data = new ServerDetailsViewModel();
            //data = Mapper.Map<Server, ServerDetailsViewModel>(server);
            data.Attributes = serverattributes;
            data.Server = server;
            // phai dung mapping
            return View(data);
        }
    }
}
