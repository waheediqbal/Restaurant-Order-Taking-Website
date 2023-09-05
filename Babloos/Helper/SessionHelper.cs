using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Babloos.Models;

namespace Babloos.Helpers
{
    public class SessionHelper
    {
        //Session variable constants
        public const string CART = "CART";

        public const string USERINFO = "CurrentUser";

        public static T Read<T>(string variable) where T: new()
        {
            object value = HttpContext.Current.Session[variable];
            if (value == null)
            {
                Write(variable, new T());
                return Read<T>(variable);
            }
            else
                return ((T)value);
        }

        public static void Write(string variable, object value)
        {
            HttpContext.Current.Session[variable] = value;
        }

        public static void Update(string variable, OrderDetail value)
        {
            Order order = Read<Order>(variable);
            int q = order.OrderDetails.FirstOrDefault(o => o.MenuItemId == value.MenuItemId).Quantity;
            q = q + value.Quantity;
            order.OrderDetails.FirstOrDefault(o => o.MenuItemId == value.MenuItemId).Quantity = q;
            order.OrderDetails.FirstOrDefault(o => o.MenuItemId == value.MenuItemId).Amount = q * value.Price;
        }

        public static Order Remove(string variable, int itemId)
        {
            Order order = Read<Order>(variable);
            OrderDetail orderDetail = order.OrderDetails.FirstOrDefault(o => o.MenuItemId == itemId);
            if(orderDetail != null) {
                order.OrderDetails.Remove(orderDetail);
            }
            return Read<Order>(CART);
        }

        public static void Login(string variable, long userId)
        {
            Order order = Read<Order>(variable);
            if(order != null) {
                UserInfo user = new BabloosEntities().UserInfoes.Find(userId);
                order.UserId = userId;
                order.Email = user.EmailAddress;
                order.Title = user.Title;
                order.FirstName = user.FirstName;
                order.LastName = user.LastName;
                order.Address1 = user.Address1;
                order.Address2 = user.Address2;
                order.City = user.City;
            }
            else
            {
                Write(CART, order);
            }
        }

        public static void logOff(string variable)
        {
            HttpContext.Current.Session.Clear();
        }

        public static Order Cart(int itemId, int quantity)
        {
            Order order = Read<Order>(CART);
            OrderDetail orderdetail = null;
            if(order != null) {
                orderdetail = order.OrderDetails.FirstOrDefault(o => o.MenuItemId == itemId);
            }
            
            MenuItem menuitem = new BabloosEntities().MenuItems.Find(itemId);

            if (orderdetail == null)
            {
                order.OrderDetails.Add(new OrderDetail
                {
                    MenuItemId = itemId,
                    Quantity = quantity,
                    Price = menuitem.Rate,
                    Amount = quantity * menuitem.Rate,
                    OrderDate = DateTime.Now,
                    DeliveryDate = DateTime.Now,
                    Title = menuitem.Title,
                    ImagePath = menuitem.ImagePath
                });
                Write(CART, order);
            }
            else
            {
                Update(CART, new OrderDetail
                {
                    MenuItemId = itemId,
                    Quantity = quantity,
                    Price = menuitem.Rate,
                    Amount = quantity * menuitem.Rate,
                    OrderDate = DateTime.Now,
                });
            }
            return Read<Order>(CART);
        }
    }
}