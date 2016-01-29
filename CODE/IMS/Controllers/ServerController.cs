using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : Controller
    {
        // GET: Server
        public ActionResult Index()
        {
            var data = new ServerIndexViewModel();
            data.Servers = ServerBLO.Current.GetAllServer(); 
            return View(data);
        }

        // GET: Server/Details/5
        public ActionResult ServerDetails(int id)
        {
            return View();
        }

        // GET: Server/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Server/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
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

        // GET: Server/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Server/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Server/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Server/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
