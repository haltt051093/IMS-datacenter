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
    public class LogBlockedIPsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogBlockedIPs
        public ActionResult Index()
        {
            var logBlockedIP = db.LogBlockedIP.Include(l => l.Account).Include(l => l.Server).Include(l => l.IPAddressPool);
            return View(logBlockedIP.ToList());
        }

        // GET: LogBlockedIPs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogBlockedIP logBlockedIP = db.LogBlockedIP.Find(id);
            if (logBlockedIP == null)
            {
                return HttpNotFound();
            }
            return View(logBlockedIP);
        }

        // GET: LogBlockedIPs/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            ViewBag.BlockedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress");
            return View();
        }

        // POST: LogBlockedIPs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,BlockedIP,ServerId,StaffId,Reason,LogTime")] LogBlockedIP logBlockedIP)
        {
            if (ModelState.IsValid)
            {
                db.LogBlockedIP.Add(logBlockedIP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logBlockedIP.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logBlockedIP.ServerId);
            ViewBag.BlockedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logBlockedIP.BlockedIP);
            return View(logBlockedIP);
        }

        // GET: LogBlockedIPs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogBlockedIP logBlockedIP = db.LogBlockedIP.Find(id);
            if (logBlockedIP == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logBlockedIP.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logBlockedIP.ServerId);
            ViewBag.BlockedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logBlockedIP.BlockedIP);
            return View(logBlockedIP);
        }

        // POST: LogBlockedIPs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,BlockedIP,ServerId,StaffId,Reason,LogTime")] LogBlockedIP logBlockedIP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logBlockedIP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logBlockedIP.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logBlockedIP.ServerId);
            ViewBag.BlockedIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", logBlockedIP.BlockedIP);
            return View(logBlockedIP);
        }

        // GET: LogBlockedIPs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogBlockedIP logBlockedIP = db.LogBlockedIP.Find(id);
            if (logBlockedIP == null)
            {
                return HttpNotFound();
            }
            return View(logBlockedIP);
        }

        // POST: LogBlockedIPs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogBlockedIP logBlockedIP = db.LogBlockedIP.Find(id);
            db.LogBlockedIP.Remove(logBlockedIP);
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
