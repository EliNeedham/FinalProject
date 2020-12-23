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
            if (User.IsInRole("Admin"))
            {
                var reservations = db.Reservations.Include(r => r.Homes).Include(r => r.Locations).Include(r => r.Services);
                return View(reservations.ToList());
            }
            else if (User.IsInRole("Employee"))
            {
                DateTime now = DateTime.Now.Date;
                var reservations = from r in db.Reservations
                                   where r.ReservationDate >= now
                                   select r;
                return View(reservations.ToList());
            }
            else
            {
                DateTime now = DateTime.Now.Date;
                string currentUserID = User.Identity.GetUserId();
                var reservations = from r in db.Reservations
                                   where r.Homes.OwnderId == currentUserID
                                   && 
                                   r.ReservationDate >= now
                                   select r;
                return View(reservations.ToList());
            }

        }

        // GET: Reservations/Details/5
        [Authorize(Roles ="Admin, Employee, Client")]
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

            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                return View(reservations);
            }
            else
            {
                string currentUserID = User.Identity.GetUserId();
                var reservation = from r in db.Reservations
                                   where r.Homes.OwnderId == currentUserID
                                   select r;

                return View(reservation.FirstOrDefault());
            }


        }

        // GET: Reservations/Create
        public ActionResult Create()
        {
            if (User.IsInRole("Admin"))
            {
                ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName");
                ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName");
                ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType");
                return View();
            }
            else if (User.IsInRole("Employee")) 
            {
                ViewBag.FailureMessage = "Whoops! Please contact your admin for this function";
                return View();
            }
            else
            {
                string currentUserID = User.Identity.GetUserId();
                ViewBag.HomeId = new SelectList(db.Homes.Where(x => x.OwnderId == currentUserID), "HomeId", "HomeName");
                ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName");
                ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType");
                return View();
            }

        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationId,HomeId,LocationId,ReservationDate,ServiceId")] Reservations reservations)
        {
            ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName", reservations.HomeId);
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
            ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
            if (ModelState.IsValid)
            {
                int location = reservations.LocationId;
                int home = reservations.HomeId;
                DateTime date = reservations.ReservationDate;
                var currentResos = from x in db.Reservations
                                   where x.LocationId == location && x.ReservationDate == date
                                   select x;
                var resoNbr = currentResos.Count();
                var resoLimit = (from x in db.Locations
                                where x.LocationId == location
                                select x.ReservationLimit).FirstOrDefault();
                //linq always wants to return a collection - first or default lets you return just one - looking for a single record

                if (resoNbr < resoLimit || User.IsInRole("Admin"))
                {
                    db.Reservations.Add(reservations);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Message = $"Whoops! Sorry......... that location is booked for {date}, please select a different office location or date for your cleaning service.";
                    return View("Create");
                }
            }
            return View(reservations);
        }

        // GET: Reservations/Edit/5
        [Authorize(Roles = "Admin, Client")]
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
            if (User.IsInRole("Admin"))
            {
                ViewBag.HomeId = new SelectList(db.Homes, "HomeId", "HomeName", reservations.HomeId);
                ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
                ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
                return View(reservations);
            }
            else
            {
                string currentUserID = User.Identity.GetUserId();
                ViewBag.HomeId = new SelectList(db.Homes.Where(h => h.OwnderId == currentUserID), "HomeId", "HomeName", reservations.HomeId);
                ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservations.LocationId);
                ViewBag.ServiceId = new SelectList(db.Services, "ServiceId", "ServiceType", reservations.ServiceId);
                return View(reservations);
            }


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
        [Authorize(Roles = "Admin, Client")]
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
            if (User.IsInRole("Admin"))
            {
                return View(reservations);
            }
            else
            {
                string currentUserID = User.Identity.GetUserId();
                var reservation = from r in db.Reservations
                                  where r.Homes.OwnderId == currentUserID
                                  select r;

                return View(reservation.FirstOrDefault());
            }
        }

        // POST: Reservations/Delete/5
        [Authorize(Roles = "Admin, Client")]
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
