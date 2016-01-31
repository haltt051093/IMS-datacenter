using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Repository;

namespace IMS.Controllers
{
    public class RequestController : Controller
    {
        //DOING
        public ActionResult Index()
        {
            var requestTypes = RequestTypeDAO.Current.GetAll();
            ViewBag.RequestTypes = requestTypes;
            return View();
        }

        // GET: Request/Create
        public ActionResult RequestRentRack()
        {
            return View();
        }

        // POST: Request/Create
        [HttpPost]
        public ActionResult RequestRentRack(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
