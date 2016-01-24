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
    public class LogRequestsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogRequests
        public ActionResult Index()
        {
            var logRequest = db.LogRequest.Include(l => l.Account).Include(l => l.Account1).Include(l => l.RequestType1);
            return View(logRequest.ToList());
        }

        // GET: LogRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogRequest logRequest = db.LogRequest.Find(id);
            if (logRequest == null)
            {
                return HttpNotFound();
            }
            return View(logRequest);
        }

        // GET: LogRequests/Create
        public ActionResult Create()
        {
            ViewBag.CustomerId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.RequestType = new SelectList(db.RequestType, "RequestId", "RequestName");
            return View();
        }

        // POST: LogRequests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,RequestType,CustomerId,StaffId,Comment,RequestedTime,Description,AppointmentTime,AppointmentStatus")] LogRequest logRequest)
        {
            if (ModelState.IsValid)
            {
                db.LogRequest.Add(logRequest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerId = new SelectList(db.Account, "UserId", "Username", logRequest.CustomerId);
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logRequest.StaffId);
            ViewBag.RequestType = new SelectList(db.RequestType, "RequestId", "RequestName", logRequest.RequestType);
            return View(logRequest);
        }

        // GET: LogRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogRequest logRequest = db.LogRequest.Find(id);
            if (logRequest == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerId = new SelectList(db.Account, "UserId", "Username", logRequest.CustomerId);
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logRequest.StaffId);
            ViewBag.RequestType = new SelectList(db.RequestType, "RequestId", "RequestName", logRequest.RequestType);
            return View(logRequest);
        }

        // POST: LogRequests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,RequestType,CustomerId,StaffId,Comment,RequestedTime,Description,AppointmentTime,AppointmentStatus")] LogRequest logRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerId = new SelectList(db.Account, "UserId", "Username", logRequest.CustomerId);
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logRequest.StaffId);
            ViewBag.RequestType = new SelectList(db.RequestType, "RequestId", "RequestName", logRequest.RequestType);
            return View(logRequest);
        }

        // GET: LogRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogRequest logRequest = db.LogRequest.Find(id);
            if (logRequest == null)
            {
                return HttpNotFound();
            }
            return View(logRequest);
        }

        // POST: LogRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogRequest logRequest = db.LogRequest.Find(id);
            db.LogRequest.Remove(logRequest);
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
