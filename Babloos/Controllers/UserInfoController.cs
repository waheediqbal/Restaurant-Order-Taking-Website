using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Babloos.Models;
using Babloos.Helpers;

namespace Babloos.Controllers
{
    public class UserInfoController : Controller
    {
        private BabloosEntities db = new BabloosEntities();

        // GET: /UserInfo/
        public ActionResult Index()
        {
            return View(db.UserInfoes.ToList());
        }

        // GET: /UserInfo/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserInfo userinfo = db.UserInfoes.Find(id);
            if (userinfo == null)
            {
                return HttpNotFound();
            }
            return View(userinfo);
        }

        // GET: /UserInfo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /UserInfo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Title,FirstName,LastName,Phone,AlternativePhone,Address1,Address2,City,EmailAddress,Password,IsActive,CreationDate,UserType")] UserInfo userinfo)
        {
            if (ModelState.IsValid)
            {
                userinfo.IsActive = true;
                userinfo.CreationDate = DateTime.Now;
                userinfo.UserType = 1;

                db.UserInfoes.Add(userinfo);
                db.SaveChanges();
                return RedirectToAction("Login");
            }

            return View(userinfo);
        }

        // GET: /UserInfo/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserInfo userinfo = db.UserInfoes.Find(id);
            if (userinfo == null)
            {
                return HttpNotFound();
            }
            return View(userinfo);
        }

        // POST: /UserInfo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Title,FirstName,LastName,Phone,AlternativePhone,Address1,Address2,City,EmailAddress,Password,IsActive,CreationDate,UserType")] UserInfo userinfo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userinfo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userinfo);
        }

        // GET: /UserInfo/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserInfo userinfo = db.UserInfoes.Find(id);
            if (userinfo == null)
            {
                return HttpNotFound();
            }
            return View(userinfo);
        }

        // POST: /UserInfo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            db.UserInfoes.Remove(userinfo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login([Bind(Include = "EmailAddress,Password")] UserInfo userinfo)
        {
            UserInfo user = db.UserInfoes.FirstOrDefault(u => (u.EmailAddress == userinfo.EmailAddress || u.Phone == userinfo.EmailAddress) && u.Password == userinfo.Password);
            if (user != null)
            {
                SessionHelper.Login("CART", user.Id);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Message = "Invalid UserName or Password!";
                return View(userinfo);
            }
        }

        public ActionResult Logoff()
        {
            SessionHelper.logOff("CART");
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ChangePassword()
        {
            Order order = SessionHelper.Read<Order>("CART");
            ViewBag.UserId = order.UserId; 
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword([Bind(Include = "Id,Password")] UserInfo userinfo, String ConfirmPassword, String OldPassword)
        {
            UserInfo user = db.UserInfoes.Find(userinfo.Id);
            if(user.Password == OldPassword && userinfo.Password == ConfirmPassword) {
                user.Password = userinfo.Password;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.MsgSuccess = "Change Password Successfully!";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.MsgWrong = "Some thing wrong. Try again.";
                Order order = SessionHelper.Read<Order>("CART");
                ViewBag.UserId = order.UserId;
                return View();
            }
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
