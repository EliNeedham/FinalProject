using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;
using System.Drawing;
using FinalProject.MVC.UI.Utilities;
using Microsoft.AspNet.Identity;

namespace FinalProject.MVC.UI.Controllers
{
    public class UserDetailsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: UserDetails
        public ActionResult Index()
        {
            if (User.IsInRole("Admin"))
            {
                return View(db.UserDetails.ToList());
            }
            else
            {
                string currentUserID = User.Identity.GetUserId();
                var details = db.UserDetails.Where(x => x.UserId == currentUserID);
                    return View(details);
            }

        }

        // GET: UserDetails/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetails userDetails = db.UserDetails.Find(id);
            if (userDetails == null)
            {
                return HttpNotFound();
            }
            return View(userDetails);
        }

        // GET: UserDetails/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,CompanyName,FirstName,LastName,UserPhoto")] UserDetails userDetails)
        {
            if (ModelState.IsValid)
            {
                db.UserDetails.Add(userDetails);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userDetails);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetails userDetails = db.UserDetails.Find(id);
            if (userDetails == null)
            {
                return HttpNotFound();
            }
            return View(userDetails);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,CompanyName,FirstName,LastName,UserPhoto")] UserDetails userDetails, HttpPostedFileBase userPhoto)
        {
            if (ModelState.IsValid)
            {
                #region File Upload

                if (userPhoto != null)
                {
                    string file = userPhoto.FileName;
                    //we need to make sure they are actually uploading an appropriate file type
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.net)
                        if (userPhoto.ContentLength <= 52428800) // specifying in bytes how big file can be
                        {
                            //create a new file name using a guid - a lot of users probably have images with the same names so we change it from what the user had to a guid Globally Unique Identifier
                            file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/assets/img/Uploads/");

                            //taking the contents of this file and creatign a stream of bytes, http file base type is becmonig a stream of bytes into a type of image. this conversion has to take place for us to be able to resize the image
                            Image convertedImage = Image.FromStream(userPhoto.InputStream);

                            int maxImageSize = 500;

                            int maxThumbSize = 100;
                            //if you allowed image uploads for magazine and books - you would need to repeat that code - that's why the image service code is in an imageservice area

                            UploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            //saves image onto server - but doesn't update db need to make sure to update what is stored in the db
                            #endregion
                            if (userDetails.UserPhoto != null && userDetails.UserPhoto != "noimage.png")
                            {
                                string path = Server.MapPath("~/Content/assets/img/Uploads/");
                                UploadUtility.Delete(path, userDetails.UserPhoto);
                            }
                        }
                    }

                    userDetails.UserPhoto = file;
                }

                #endregion
                db.Entry(userDetails).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userDetails);
        }

        //I assume if I took out delete functionality I don't need this anymore?? 11/17
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
