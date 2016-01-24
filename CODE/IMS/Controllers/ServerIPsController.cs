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
    public class ServerIPsController : Controller
    {
        private IMSContextDB db = new IMSContextDB();

        // GET: ServerIPs
        public ActionResult Index()
        {
            var serverIP = db.ServerIP.Include(s => s.Server).Include(s => s.IPAddressPool);
            return View(serverIP.ToList());
        }

        // GET: ServerIPs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerIP serverIP = db.ServerIP.Find(id);
            if (serverIP == null)
            {
                return HttpNotFound();
            }
            return View(serverIP);
        }

        // GET: ServerIPs/Create
        public ActionResult Create()
        {
            var server = db.Server.AsEnumerable().Select(s => new
            {
                ServerId = s.ServerId,
                Servername = string.Format("{0} {1} {2}U", s.Maker, s.Modern, s.Size)
            });
            var ip = db.IPAddressPool.AsEnumerable().Where(ii => ii.Status.Equals("Available")).Select(i => new
            {
                Id = i.Id,
                IPAdd = i.IPAddress
            });
            ViewBag.ServerId = new SelectList(server, "ServerId", "Servername");
            ViewBag.CurrentIP = new SelectList(ip, "Id", "IPAdd");
            return View();
        }

        // POST: ServerIPs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ServerId,CurrentIP")] ServerIP serverIP)
        {
            if (ModelState.IsValid)
            {
                IPAddressPool ipa = db.IPAddressPool.Find(serverIP.CurrentIP);
                ipa.Status = "Unavailable";
                db.Entry(ipa).State = EntityState.Modified;
                db.ServerIP.Add(serverIP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var server = db.Server.AsEnumerable().Select(s => new
            {
                ServerId = s.ServerId,
                Servername = string.Format("{0} {1} {2}U", s.Maker, s.Modern, s.Size)
            });
            var ip = db.IPAddressPool.AsEnumerable().Where(ii => ii.Status.Equals("Available")).Select(i => new
            {
                Id = i.Id,
                IPAdd = i.IPAddress
            });
            ViewBag.ServerId = new SelectList(server, "ServerId", "Servername", serverIP.ServerId);
            ViewBag.CurrentIP = new SelectList(ip, "Id", "IPAdd", serverIP.CurrentIP);
            return View(serverIP);
        }

        // GET: ServerIPs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerIP serverIP = db.ServerIP.Find(id);
            if (serverIP == null)
            {
                return HttpNotFound();
            }
            var ip = db.ServerIP.AsEnumerable().Where(ss => ss.ServerId.Equals(serverIP.ServerId)).Select(i => new
            {
                Id = i.CurrentIP,
                IPAdd = i.IPAddressPool.IPAddress
            });
            //ViewBag.ServerId = new SelectList(server, "ServerId", "Servername"); --> chi dung cho dropdownlist
            ViewBag.DefaultIP = serverIP.Server.IPAddressPool.IPAddress;
            ViewBag.ServerId = string.Format("{0} {1} {2}U", serverIP.Server.Maker,
                serverIP.Server.Modern, serverIP.Server.Size);
            ViewBag.CurrentIP = new SelectList(ip, "Id", "IPAdd",serverIP.CurrentIP);
            return View(serverIP);
        }

        // POST: ServerIPs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ServerId,CurrentIP")] ServerIP serverIP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(serverIP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServerId = new SelectList(db.Server, "ServerId", "Maker", serverIP.ServerId);
            ViewBag.CurrentIP = new SelectList(db.IPAddressPool, "Id", "IPAddress", serverIP.CurrentIP);
            return View(serverIP);
        }

        // GET: ServerIPs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServerIP serverIP = db.ServerIP.Find(id);
            if (serverIP == null)
            {
                return HttpNotFound();
            }
            return View(serverIP);
        }

        // POST: ServerIPs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ServerIP serverIP = db.ServerIP.Find(id);
            db.ServerIP.Remove(serverIP);
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
