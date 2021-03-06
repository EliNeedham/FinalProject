﻿using System.Web.Mvc;
using FinalProject.MVC.UI.Models;
using System;
using System.Net.Mail;
using System.Net;

namespace FinalProject.MVC.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        //[Authorize] took this out bc anonymous user couldn't see it
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (ModelState.IsValid)
            {
                string body = $"{cvm.Name} has sent you the following message: <br /> " +
                    $"{cvm.Message} <strong>from the email address:</strong> {cvm.Email}";
                MailMessage m = new MailMessage("no-reply@YouNeedham.net", "EliNeedham@outlook.com",
                    cvm.Subject, body);

                //allow html in email
                m.IsBodyHtml = true;
                m.Priority = MailPriority.High;
                //m.CC.Add("elineedham@outlook.com");

                //reply to the person who sent me an email
                m.ReplyToList.Add(cvm.Email);

                //configure mail client
                SmtpClient client = new SmtpClient("mail.youneedham.net");
                client.Credentials = new NetworkCredential("no-reply@youneedham.net", "Whatevs!2020");

                try
                {
                    client.Send(m);
                }
                catch (Exception e)
                {

                    ViewBag.Message = e.StackTrace;
                    return View(cvm);

                }
            }
            return View("EmailConfirmation", cvm);
        }
    }
}
