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
    public class LogNotesController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: LogNotes
        public ActionResult Index()
        {
            var logNote = db.LogNote.Include(l => l.Account);
            return View(logNote.ToList());
        }

        // GET: LogNotes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogNote logNote = db.LogNote.Find(id);
            if (logNote == null)
            {
                return HttpNotFound();
            }
            return View(logNote);
        }

        // GET: LogNotes/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username");
            return View();
        }

        // POST: LogNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LogId,StaffId,Description,LogTime")] LogNote logNote)
        {
            if (ModelState.IsValid)
            {
                db.LogNote.Add(logNote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logNote.StaffId);
            return View(logNote);
        }

        // GET: LogNotes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogNote logNote = db.LogNote.Find(id);
            if (logNote == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logNote.StaffId);
            return View(logNote);
        }

        // POST: LogNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LogId,StaffId,Description,LogTime")] LogNote logNote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.Account, "UserId", "Username", logNote.StaffId);
            return View(logNote);
        }

        // GET: LogNotes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LogNote logNote = db.LogNote.Find(id);
            if (logNote == null)
            {
                return HttpNotFound();
            }
            return View(logNote);
        }

        // POST: LogNotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LogNote logNote = db.LogNote.Find(id);
            db.LogNote.Remove(logNote);
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
