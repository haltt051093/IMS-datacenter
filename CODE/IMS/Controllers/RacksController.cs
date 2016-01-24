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
    public class RacksController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: Racks
        public ActionResult Index()
        {
            return View(db.Rack.ToList());
        }

        // GET: Racks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rack rack = db.Rack.Find(id);
            if (rack == null)
            {
                return HttpNotFound();
            }
            return View(rack);
        }

        // GET: Racks/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Racks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RackId,RackNumber,RegisteredDate")] Rack rack)
        {
            if (ModelState.IsValid)
            {
                rack.RegisteredDate = DateTime.Now;
                db.Rack.Add(rack);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(rack);
        }

        // GET: Racks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rack rack = db.Rack.Find(id);
            if (rack == null)
            {
                return HttpNotFound();
            }
            return View(rack);
        }

        // POST: Racks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RackId,RackNumber,RegisteredDate")] Rack rack)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rack).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(rack);
        }

        // GET: Racks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rack rack = db.Rack.Find(id);
            if (rack == null)
            {
                return HttpNotFound();
            }
            return View(rack);
        }

        // POST: Racks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Rack rack = db.Rack.Find(id);
            db.Rack.Remove(rack);
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
