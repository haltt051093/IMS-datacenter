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
    public class ServerAttributesController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: ServerAttributes
        public ActionResult Index()
        {
            var serverAttribute = db.ServerAttribute.Include(s => s.Server);
            return View(serverAttribute.ToList());
        }

        // GET: ServerAttributes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerAttribute serverAttribute = db.ServerAttribute.Find(id);
            if (serverAttribute == null)
            {
                return HttpNotFound();
            }
            return View(serverAttribute);
        }

        // GET: ServerAttributes/Create
        public ActionResult Create()
        {
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker");
            return View();
        }

        // POST: ServerAttributes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AttributeId,ServerId,AttributeName,AttributeValue,RegisteredDate")] ServerAttribute serverAttribute)
        {
            if (ModelState.IsValid)
            {
                serverAttribute.RegisteredDate = DateTime.Now;
                db.ServerAttribute.Add(serverAttribute);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", serverAttribute.ServerId);
            return View(serverAttribute);
        }

        // GET: ServerAttributes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerAttribute serverAttribute = db.ServerAttribute.Find(id);
            if (serverAttribute == null)
            {
                return HttpNotFound();
            }
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", serverAttribute.ServerId);
            return View(serverAttribute);
        }

        // POST: ServerAttributes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AttributeId,ServerId,AttributeName,AttributeValue,RegisteredDate")] ServerAttribute serverAttribute)
        {
            if (ModelState.IsValid)
            {
                db.Entry(serverAttribute).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", serverAttribute.ServerId);
            return View(serverAttribute);
        }

        // GET: ServerAttributes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerAttribute serverAttribute = db.ServerAttribute.Find(id);
            if (serverAttribute == null)
            {
                return HttpNotFound();
            }
            return View(serverAttribute);
        }

        // POST: ServerAttributes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ServerAttribute serverAttribute = db.ServerAttribute.Find(id);
            db.ServerAttribute.Remove(serverAttribute);
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
