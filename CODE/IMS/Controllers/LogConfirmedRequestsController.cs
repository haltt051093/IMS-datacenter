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
    public class LogConfirmedRequestsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogConfirmedRequests
        public ActionResult Index()
        {
            var logConfirmedRequest = db.LogConfirmedRequest.Include(l => l.Account).Include(l => l.LogRequest).Include(l => l.Server);
            return View(logConfirmedRequest.ToList());
        }

        // GET: LogConfirmedRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogConfirmedRequest logConfirmedRequest = db.LogConfirmedRequest.Find(id);
            if (logConfirmedRequest == null)
            {
                return HttpNotFound();
            }
            return View(logConfirmedRequest);
        }

        // GET: LogConfirmedRequests/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            return View();
        }

        // POST: LogConfirmedRequests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,LogRequestedId,StaffId,ServerId,IsConfirmed,LogTime")] LogConfirmedRequest logConfirmedRequest)
        {
            if (ModelState.IsValid)
            {
                db.LogConfirmedRequest.Add(logConfirmedRequest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logConfirmedRequest.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logConfirmedRequest.LogRequestedId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logConfirmedRequest.ServerId);
            return View(logConfirmedRequest);
        }

        // GET: LogConfirmedRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogConfirmedRequest logConfirmedRequest = db.LogConfirmedRequest.Find(id);
            if (logConfirmedRequest == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logConfirmedRequest.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logConfirmedRequest.LogRequestedId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logConfirmedRequest.ServerId);
            return View(logConfirmedRequest);
        }

        // POST: LogConfirmedRequests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,LogRequestedId,StaffId,ServerId,IsConfirmed,LogTime")] LogConfirmedRequest logConfirmedRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logConfirmedRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logConfirmedRequest.StaffId);
            ViewBag.LogRequestedId = new SelectList(db.LogRequest, "LogId", "Comment", logConfirmedRequest.LogRequestedId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logConfirmedRequest.ServerId);
            return View(logConfirmedRequest);
        }

        // GET: LogConfirmedRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogConfirmedRequest logConfirmedRequest = db.LogConfirmedRequest.Find(id);
            if (logConfirmedRequest == null)
            {
                return HttpNotFound();
            }
            return View(logConfirmedRequest);
        }

        // POST: LogConfirmedRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogConfirmedRequest logConfirmedRequest = db.LogConfirmedRequest.Find(id);
            db.LogConfirmedRequest.Remove(logConfirmedRequest);
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
