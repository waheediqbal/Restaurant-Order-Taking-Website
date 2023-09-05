using Babloos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Babloos.Controllers
{
    public class HomeController : Controller
    {
        private BabloosEntities db = new BabloosEntities();
        public ActionResult Index()
        {
            var deals = db.MenuItems.Where(d => d.MenuId == 26).ToList();
            return View(deals);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}