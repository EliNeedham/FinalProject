using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;
using Microsoft.AspNet.Identity;

namespace FinalProject.MVC.UI.Controllers
{
    public class ReservationsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Reservations
        public ActionResult Index()
        {
            var reservations = db.Reservations.Include(r => r.Homes).Include(r => r.Locations).Include(r => r.Services);
            return View(reservations.ToList());
        }

        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservations reservations = db.Reservations.Find(id);
            if (reservations == null)
            {
                return HttpNotFound();
            }
            return View(reservations);
        }

        // GET: Reservations/Create
        public ActionResult Create()
        {
            string currentUserID = User.Identity.GetUserId();
            ViewBag.HomeId = new SelectList(db.Homes.Where(x => x.OwnderId == currentUserID), "HomeId", "HomeName");
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName");
            ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType");
            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationId,HomeId,LocationId,ReservationDate,ServiceId")] Reservations reservations)
        {

            if (ModelState.IsValid)
            {
                //logic to figure out the location - pull it from the database to find its limit
                //TODO figure out how to do this logic.....
                //int location = reservations.LocationId;
                //int home = reservations.HomeId;
                //DateTime date = reservations.ReservationDate;
                //int currentResos = db.Locations.Where(location => )

                //if ()
                //{

                //}
                db.Reservations.Add(reservations);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName", reservations.HomeId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
            ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
            return View(reservations);
        }

        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservations reservations = db.Reservations.Find(id);
            if (reservations == null)
            {
                return HttpNotFound();
            }
            ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName", reservations.HomeId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
            ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
            return View(reservations);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationId,HomeId,LocationId,ReservationDate,ServiceId")] Reservations reservations)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservations).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName", reservations.HomeId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
            ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
            return View(reservations);
        }

        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservations reservations = db.Reservations.Find(id);
            if (reservations == null)
            {
                return HttpNotFound();
            }
            return View(reservations);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservations reservations = db.Reservations.Find(id);
            db.Reservations.Remove(reservations);
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
