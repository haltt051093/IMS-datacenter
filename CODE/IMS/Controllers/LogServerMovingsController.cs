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
    public class LogServerMovingsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogServerMovings
        public ActionResult Index()
        {
            var logServerMoving = db.LogServerMoving.Include(l => l.Account).Include(l => l.Location).Include(l => l.Server);
            return View(logServerMoving.ToList());
        }

        // GET: LogServerMovings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerMoving logServerMoving = db.LogServerMoving.Find(id);
            if (logServerMoving == null)
            {
                return HttpNotFound();
            }
            return View(logServerMoving);
        }

        // GET: LogServerMovings/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.MovedLocation = new SelectList(db.Location, "LocationId", "Status");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            return View();
        }

        // POST: LogServerMovings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,ServerId,StaffId,MovedLocation,Reason,LogTime")] LogServerMoving logServerMoving)
        {
            if (ModelState.IsValid)
            {
                db.LogServerMoving.Add(logServerMoving);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerMoving.StaffId);
            ViewBag.MovedLocation = new SelectList(db.Location, "LocationId", "Status", logServerMoving.MovedLocation);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerMoving.ServerId);
            return View(logServerMoving);
        }

        // GET: LogServerMovings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerMoving logServerMoving = db.LogServerMoving.Find(id);
            if (logServerMoving == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerMoving.StaffId);
            ViewBag.MovedLocation = new SelectList(db.Location, "LocationId", "Status", logServerMoving.MovedLocation);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerMoving.ServerId);
            return View(logServerMoving);
        }

        // POST: LogServerMovings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,ServerId,StaffId,MovedLocation,Reason,LogTime")] LogServerMoving logServerMoving)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logServerMoving).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logServerMoving.StaffId);
            ViewBag.MovedLocation = new SelectList(db.Location, "LocationId", "Status", logServerMoving.MovedLocation);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logServerMoving.ServerId);
            return View(logServerMoving);
        }

        // GET: LogServerMovings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogServerMoving logServerMoving = db.LogServerMoving.Find(id);
            if (logServerMoving == null)
            {
                return HttpNotFound();
            }
            return View(logServerMoving);
        }

        // POST: LogServerMovings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogServerMoving logServerMoving = db.LogServerMoving.Find(id);
            db.LogServerMoving.Remove(logServerMoving);
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
