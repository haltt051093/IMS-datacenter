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
    public class RequestTypesController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: RequestTypes
        public ActionResult Index()
        {
            return View(db.RequestType.ToList());
        }

        // GET: RequestTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequestType requestType = db.RequestType.Find(id);
            if (requestType == null)
            {
                return HttpNotFound();
            }
            return View(requestType);
        }

        // GET: RequestTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RequestTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RequestId,RequestName")] RequestType requestType)
        {
            if (ModelState.IsValid)
            {
                db.RequestType.Add(requestType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(requestType);
        }

        // GET: RequestTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequestType requestType = db.RequestType.Find(id);
            if (requestType == null)
            {
                return HttpNotFound();
            }
            return View(requestType);
        }

        // POST: RequestTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RequestId,RequestName")] RequestType requestType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(requestType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(requestType);
        }

        // GET: RequestTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequestType requestType = db.RequestType.Find(id);
            if (requestType == null)
            {
                return HttpNotFound();
            }
            return View(requestType);
        }

        // POST: RequestTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RequestType requestType = db.RequestType.Find(id);
            db.RequestType.Remove(requestType);
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
