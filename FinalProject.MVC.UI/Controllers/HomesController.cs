using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;

namespace FinalProject.MVC.UI.Controllers
{
    public class HomesController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Homes
        public ActionResult Index()
        {
            var homes = db.Homes.Include(h => h.UserDetails);
            return View(homes.ToList());
        }

        // GET: Homes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homes homes = db.Homes.Find(id);
            if (homes == null)
            {
                return HttpNotFound();
            }
            return View(homes);
        }

        // GET: Homes/Create
        public ActionResult Create()
        {
            ViewBag.OwnderId = new SelectList(db.UserDetails, "UserId", "CompanyName");
            return View();
        }

        // POST: Homes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HomeId,HomeName,Address,City,State,ZipCode,OwnderId,HomePhoto,SpecialNotes,IsActive,DateAdded")] Homes homes)
        {
            if (ModelState.IsValid)
            {
                db.Homes.Add(homes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OwnderId = new SelectList(db.UserDetails, "UserId", "CompanyName", homes.OwnderId);
            return View(homes);
        }

        // GET: Homes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homes homes = db.Homes.Find(id);
            if (homes == null)
            {
                return HttpNotFound();
            }
            ViewBag.OwnderId = new SelectList(db.UserDetails, "UserId", "CompanyName", homes.OwnderId);
            return View(homes);
        }

        // POST: Homes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HomeId,HomeName,Address,City,State,ZipCode,OwnderId,HomePhoto,SpecialNotes,IsActive,DateAdded")] Homes homes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(homes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OwnderId = new SelectList(db.UserDetails, "UserId", "CompanyName", homes.OwnderId);
            return View(homes);
        }

        // GET: Homes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homes homes = db.Homes.Find(id);
            if (homes == null)
            {
                return HttpNotFound();
            }
            return View(homes);
        }

        // POST: Homes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Homes homes = db.Homes.Find(id);
            db.Homes.Remove(homes);
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
