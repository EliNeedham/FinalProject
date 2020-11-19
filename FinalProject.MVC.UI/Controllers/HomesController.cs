using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;
using FinalProject.MVC.UI.Utilities;
using FinalProject.MVC.UI.Models;
using System.Drawing;
using Microsoft.AspNet.Identity;

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
            string currentUserID = User.Identity.GetUserId();
            ViewBag.OwnderId = new SelectList(db.UserDetails.Where(x => x.UserId == currentUserID), "UserId", "FullName");
            return View();
        }

        // POST: Homes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HomeId,HomeName,Address,City,State,ZipCode,OwnderId,HomePhoto,SpecialNotes,IsActive,DateAdded")] Homes homes, HttpPostedFileBase homePhoto)
        {
            if (ModelState.IsValid)
            {

                #region File Upload
                string file = "noimage.png"; //for this to work in our image files there is a NoImage.png file

                if (homePhoto != null)
                {
                    file = homePhoto.FileName;
                    //we need to make sure they are actually uploading an appropriate file type
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.net)
                        if (homePhoto.ContentLength <= 4194304) // specifying in bytes how big file can be
                        {
                            //create a new file name using a guid - a lot of users probably have images with the same names so we change it from what the user had to a guid Globally Unique Identifier
                            file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/assets/img/Uploads/");

                            //taking the contents of this file and creatign a stream of bytes, http file base type is becmonig a stream of bytes into a type of image. this conversion has to take place for us to be able to resize the image
                            Image convertedImage = Image.FromStream(homePhoto.InputStream);

                            int maxImageSize = 500;

                            int maxThumbSize = 100;
                            //if you allowed image uploads for magazine and books - you would need to repeat that code - that's why the image service code is in an imageservice area

                            UploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            //saves image onto server - but doesn't update db need to make sure to update what is stored in the db
                            #endregion
                        }
                    }


                }
                homes.HomePhoto = file;
                #endregion

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
            string currentUserID = User.Identity.GetUserId();
            ViewBag.OwnderId = new SelectList(db.UserDetails.Where(x => x.UserId == currentUserID), "UserId", "CompanyName");
            return View(homes);
        }

        // POST: Homes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HomeId,HomeName,Address,City,State,ZipCode,OwnderId,HomePhoto,SpecialNotes,IsActive,DateAdded")] Homes homes, HttpPostedFileBase homePhoto)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "noimage.png"; //for this to work in our image files there is a NoImage.png file

                if (homePhoto != null)
                {
                    file = homePhoto.FileName;
                    //we need to make sure they are actually uploading an appropriate file type
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.net)
                        if (homePhoto.ContentLength <= 4194304) // specifying in bytes how big file can be
                        {
                            //create a new file name using a guid - a lot of users probably have images with the same names so we change it from what the user had to a guid Globally Unique Identifier
                            file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/assets/img/Uploads/");

                            //taking the contents of this file and creatign a stream of bytes, http file base type is becmonig a stream of bytes into a type of image. this conversion has to take place for us to be able to resize the image
                            Image convertedImage = Image.FromStream(homePhoto.InputStream);

                            int maxImageSize = 500;

                            int maxThumbSize = 100;
                            //if you allowed image uploads for magazine and books - you would need to repeat that code - that's why the image service code is in an imageservice area

                            UploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            //saves image onto server - but doesn't update db need to make sure to update what is stored in the db
                            #endregion
                            if (homes.HomePhoto != null && homes.HomePhoto != "noimage.png")
                            {
                                string path = Server.MapPath("~/Content/imgstore/books/");
                                UploadUtility.Delete(path, homes.HomePhoto);
                            }
                        }
                    }

                    homes.HomePhoto = file;
                }

                #endregion
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
