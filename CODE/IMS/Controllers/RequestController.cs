using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class RequestController : Controller
    {
        //DOING
        [HttpGet]
        public ActionResult Index(RequestType requesttype)
        {
            string requestcode = requesttype.RequestTypeCode;
            if (!string.IsNullOrEmpty(requestcode))
            {
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_RACK))
                {
                    return View("RequestReturnRack");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RENT_RACK))
                {
                    return View("RequestRentRack");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ADD_SERVER))
                {
                    return View("RequestAddServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.UPGRADE_SERVER))
                {
                    return View("RequestUpgradeServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    return View("RequestReturnIP");
                }
            }
            return View(requesttype);
        }

        // GET: Request/Create
        public ActionResult RequestReturnRack()
        {

            return RedirectToActionPermanent("Index", "Server");
        }

        // GET: Request/Create
        public ActionResult RequestRentRack(RequestRentRackViewModel viewmodel)
        {
            //int RackNumber = viewmodel.RackNumbers;
            RequestBLO.Current.AddRequestRentRacks("manhnh");
            return RedirectToAction("Index");
        }
        // GET: Request/Create
        public ActionResult RequestAddServer()
        {
            return RedirectToActionPermanent("Index", "Server");
        }
        // GET: Request/Create
        public ActionResult RequestReturnIP()
        {
            return RedirectToActionPermanent("Index", "Server");
        }
        // GET: Request/Create
        public ActionResult RequestUpgradeServer()
        {
            return RedirectToActionPermanent("Index", "Server");
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
