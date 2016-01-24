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
    public class LogAppointmentsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogAppointments
        public ActionResult Index()
        {
            var logAppointment = db.LogAppointment.Include(l => l.Account).Include(l => l.LogRequest);
            return View(logAppointment.ToList());
        }

        // GET: LogAppointments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogAppointment logAppointment = db.LogAppointment.Find(id);
            if (logAppointment == null)
            {
                return HttpNotFound();
            }
            return View(logAppointment);
        }

        // GET: LogAppointments/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment");
            return View();
        }

        // POST: LogAppointments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,LogRequestedId,StaffId,PreStatus,Status,LogTime")] LogAppointment logAppointment)
        {
            if (ModelState.IsValid)
            {
                db.LogAppointment.Add(logAppointment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logAppointment.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logAppointment.LogRequestedId);
            return View(logAppointment);
        }

        // GET: LogAppointments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogAppointment logAppointment = db.LogAppointment.Find(id);
            if (logAppointment == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logAppointment.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logAppointment.LogRequestedId);
            return View(logAppointment);
        }

        // POST: LogAppointments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,LogRequestedId,StaffId,PreStatus,Status,LogTime")] LogAppointment logAppointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logAppointment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logAppointment.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logAppointment.LogRequestedId);
            return View(logAppointment);
        }

        // GET: LogAppointments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogAppointment logAppointment = db.LogAppointment.Find(id);
            if (logAppointment == null)
            {
                return HttpNotFound();
            }
            return View(logAppointment);
        }

        // POST: LogAppointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogAppointment logAppointment = db.LogAppointment.Find(id);
            db.LogAppointment.Remove(logAppointment);
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
