using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{
    public class LogServerDeliveriesController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogServerDeliveries
        public ActionResult Index()
        {
            var logServerDelivery = db.LogServerDelivery.Include(l => l.Account).Include(l => l.Server);
            return View(logServerDelivery.ToList());
        }

        // GET: LogServerDeliveries/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerDelivery logServerDelivery = db.LogServerDelivery.Find(id);
            if (logServerDelivery == null)
            {
                return HttpNotFound();
            }
            return View(logServerDelivery);
        }

        // GET: LogServerDeliveries/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            return View();
        }

        // POST: LogServerDeliveries/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,ServerId,StaffId,IsOut,LogTime")] LogServerDelivery logServerDelivery)
        {
            if (ModelState.IsValid)
            {
                db.LogServerDelivery.Add(logServerDelivery);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerDelivery.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerDelivery.ServerId);
            return View(logServerDelivery);
        }

        // GET: LogServerDeliveries/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerDelivery logServerDelivery = db.LogServerDelivery.Find(id);
            if (logServerDelivery == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerDelivery.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerDelivery.ServerId);
            return View(logServerDelivery);
        }

        // POST: LogServerDeliveries/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,ServerId,StaffId,IsOut,LogTime")] LogServerDelivery logServerDelivery)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logServerDelivery).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerDelivery.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerDelivery.ServerId);
            return View(logServerDelivery);
        }

        // GET: LogServerDeliveries/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerDelivery logServerDelivery = db.LogServerDelivery.Find(id);
            if (logServerDelivery == null)
            {
                return HttpNotFound();
            }
            return View(logServerDelivery);
        }

        // POST: LogServerDeliveries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogServerDelivery logServerDelivery = db.LogServerDelivery.Find(id);
            db.LogServerDelivery.Remove(logServerDelivery);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
