using ACATrack.Helpers;
using Babloos.Helpers;
using Babloos.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Babloos.Controllers
{
    public class OrderController : Controller
    {
        private BabloosEntities db = new BabloosEntities();
        //
        // GET: /Order/
        public ActionResult Index()
        {
            var menu = db.Menus.Where(p=> p.IsActive).ToList();
            var menuitems = db.MenuItems.Where(p=> p.IsActive).ToList();

            AllMenu allmenu = new AllMenu();

            allmenu.menuList = menu;
            allmenu.menuitemList = menuitems;

            return View(allmenu);
        }

        public String AddToCart(int itemId, int quantity)
        {
            return JsonConvert.SerializeObject(SessionHelper.Cart(itemId, quantity));
        }

        public String RemoveItemCart(int itemId)
        {
            return JsonConvert.SerializeObject(SessionHelper.Remove("CART", itemId));
        }

        public String GetToCart()
        {
            return JsonConvert.SerializeObject(SessionHelper.Read<Order>("CART"));
        }

        public ActionResult Checkout()
        {
            Order order = SessionHelper.Read<Order>("CART");
            return View(order);
        }

        [HttpPost]
        public ActionResult Checkout([Bind(Include = "Id,UserId,Email,Title,FirstName,LastName,Address1,Address2,City,TotalAmount,OrderDate,DeliveryOption,DeliveryDate,Instructions,OrderStatus,MobileNumber")]Order order)
        {
            if(ModelState.IsValid) {
                // SAVE ORDER
                db.Orders.Add(order);
                db.SaveChanges();
            }
            else
            {
                return RedirectToAction("Index");
            }
            Order sessionOrder = SessionHelper.Read<Order>("CART"); // READ ORDER ITEMS IN CART
            OrderDetail orderdetails = null;
            List<OrderDetail> orderDetailList = new List<OrderDetail>();

            // SAVE ORDER DETAILS
            foreach (var item in sessionOrder.OrderDetails.ToList())
            {
                orderdetails = new OrderDetail{
                    OrderId = order.Id,
                    MenuItemId = item.MenuItemId,
                    Title = item.Title,
                    Quantity = item.Quantity,
                    Price = item.Price,
                    Amount = item.Amount,
                    OrderDate = DateTime.Now,
                    DeliveryDate = DateTime.Now
                };
                db.OrderDetails.Add(orderdetails);
                db.SaveChanges();
                orderDetailList.Add(orderdetails);
                SessionHelper.Remove("CART", item.MenuItemId);
            }

            EmailManager.SendOrder("to-email", "Team", orderDetailList, order);
            return RedirectToAction("Successful");
        }

        public ActionResult Successful()
        {
            return View();
        }
	}
}