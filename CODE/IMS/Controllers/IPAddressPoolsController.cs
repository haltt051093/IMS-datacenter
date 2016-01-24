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
    public class IPAddressPoolsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: IPAddressPools
        public ActionResult Index()
        {
            return View(db.IPAddressPool.ToList());
        }

        // GET: IPAddressPools/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IPAddressPool iPAddressPool = db.IPAddressPool.Find(id);
            if (iPAddressPool == null)
            {
                return HttpNotFound();
            }
            return View(iPAddressPool);
        }

        // GET: IPAddressPools/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: IPAddressPools/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,IPAddress,Status,Gateway,Subnetmask,StaffId,RegisteredDate")] IPAddressPool iPAddressPool)
        {
            if (ModelState.IsValid)
            {
                iPAddressPool.RegisteredDate = DateTime.Now;
                db.IPAddressPool.Add(iPAddressPool);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(iPAddressPool);
        }

        // GET: IPAddressPools/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IPAddressPool iPAddressPool = db.IPAddressPool.Find(id);
            if (iPAddressPool == null)
            {
                return HttpNotFound();
            }
            return View(iPAddressPool);
        }

        // POST: IPAddressPools/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,IPAddress,Status,Gateway,Subnetmask,StaffId,RegisteredDate")] IPAddressPool iPAddressPool)
        {
            if (ModelState.IsValid)
            {
                db.Entry(iPAddressPool).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(iPAddressPool);
        }

        // GET: IPAddressPools/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IPAddressPool iPAddressPool = db.IPAddressPool.Find(id);
            if (iPAddressPool == null)
            {
                return HttpNotFound();
            }
            return View(iPAddressPool);
        }

        // POST: IPAddressPools/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            IPAddressPool iPAddressPool = db.IPAddressPool.Find(id);
            db.IPAddressPool.Remove(iPAddressPool);
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
