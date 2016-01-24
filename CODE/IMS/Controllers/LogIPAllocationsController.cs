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
    public class LogIPAllocationsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogIPAllocations
        public ActionResult Index()
        {
            var logIPAllocation = db.LogIPAllocation.Include(l => l.Account).Include(l => l.Server).Include(l => l.IPAddressPool).Include(l => l.IPAddressPool1);
            return View(logIPAllocation.ToList());
        }

        // GET: LogIPAllocations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogIPAllocation logIPAllocation = db.LogIPAllocation.Find(id);
            if (logIPAllocation == null)
            {
                return HttpNotFound();
            }
            return View(logIPAllocation);
        }

        // GET: LogIPAllocations/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            ViewBag.PreAssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress");
            ViewBag.AssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress");
            return View();
        }

        // POST: LogIPAllocations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,ServerId,PreAssignedIP,AssignedIP,StaffId,Reason,LogTime")] LogIPAllocation logIPAllocation)
        {
            if (ModelState.IsValid)
            {
                db.LogIPAllocation.Add(logIPAllocation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logIPAllocation.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logIPAllocation.ServerId);
            ViewBag.PreAssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.PreAssignedIP);
            ViewBag.AssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.AssignedIP);
            return View(logIPAllocation);
        }

        // GET: LogIPAllocations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogIPAllocation logIPAllocation = db.LogIPAllocation.Find(id);
            if (logIPAllocation == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logIPAllocation.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logIPAllocation.ServerId);
            ViewBag.PreAssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.PreAssignedIP);
            ViewBag.AssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.AssignedIP);
            return View(logIPAllocation);
        }

        // POST: LogIPAllocations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,ServerId,PreAssignedIP,AssignedIP,StaffId,Reason,LogTime")] LogIPAllocation logIPAllocation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logIPAllocation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logIPAllocation.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logIPAllocation.ServerId);
            ViewBag.PreAssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.PreAssignedIP);
            ViewBag.AssignedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logIPAllocation.AssignedIP);
            return View(logIPAllocation);
        }

        // GET: LogIPAllocations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogIPAllocation logIPAllocation = db.LogIPAllocation.Find(id);
            if (logIPAllocation == null)
            {
                return HttpNotFound();
            }
            return View(logIPAllocation);
        }

        // POST: LogIPAllocations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogIPAllocation logIPAllocation = db.LogIPAllocation.Find(id);
            db.LogIPAllocation.Remove(logIPAllocation);
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
