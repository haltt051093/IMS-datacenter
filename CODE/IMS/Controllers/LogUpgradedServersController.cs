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
    public class LogUpgradedServersController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogUpgradedServers
        public ActionResult Index()
        {
            var logUpgradedServer = db.LogUpgradedServer.Include(l => l.Account).Include(l => l.Server);
            return View(logUpgradedServer.ToList());
        }

        // GET: LogUpgradedServers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogUpgradedServer logUpgradedServer = db.LogUpgradedServer.Find(id);
            if (logUpgradedServer == null)
            {
                return HttpNotFound();
            }
            return View(logUpgradedServer);
        }

        // GET: LogUpgradedServers/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            return View();
        }

        // POST: LogUpgradedServers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,ServerId,StaffId,UpgradedContent,LogTime")] LogUpgradedServer logUpgradedServer)
        {
            if (ModelState.IsValid)
            {
                db.LogUpgradedServer.Add(logUpgradedServer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logUpgradedServer.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logUpgradedServer.ServerId);
            return View(logUpgradedServer);
        }

        // GET: LogUpgradedServers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogUpgradedServer logUpgradedServer = db.LogUpgradedServer.Find(id);
            if (logUpgradedServer == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logUpgradedServer.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logUpgradedServer.ServerId);
            return View(logUpgradedServer);
        }

        // POST: LogUpgradedServers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,ServerId,StaffId,UpgradedContent,LogTime")] LogUpgradedServer logUpgradedServer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logUpgradedServer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logUpgradedServer.StaffId);
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", logUpgradedServer.ServerId);
            return View(logUpgradedServer);
        }

        // GET: LogUpgradedServers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogUpgradedServer logUpgradedServer = db.LogUpgradedServer.Find(id);
            if (logUpgradedServer == null)
            {
                return HttpNotFound();
            }
            return View(logUpgradedServer);
        }

        // POST: LogUpgradedServers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogUpgradedServer logUpgradedServer = db.LogUpgradedServer.Find(id);
            db.LogUpgradedServer.Remove(logUpgradedServer);
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
