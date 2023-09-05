using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace ACATrack.Helpers
{
    public class EmailManager
    {

        public static void SendOrder(string email, string displayName, List<Babloos.Models.OrderDetail> orderdetails, Babloos.Models.Order order)
        {
            StringBuilder emailBody = new StringBuilder();
            emailBody.Append("Hi! " + displayName +"<br/><br/>");
            emailBody.Append("This is an order from customer.<br/><br/>");
            emailBody.Append("<h3>Customer</h3>");
            emailBody.Append(getCustomer(order));
            emailBody.Append("<h3>Order Details</h3>");
            emailBody.Append(getOrderList(orderdetails));

            SendEmail(email, displayName, "Order Confirmation - Order Number " + order.Id + " - Babloo's Dine Inn & Take Away!", emailBody.ToString());
        }

        public static String getCustomer(Babloos.Models.Order order)
        {
            return "<table><tbody>" +
                   "<tr><td style='text-align:right;'><b>Order No: </b></td><td>" + order.Id + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Name: </b></td><td>" + order.Title + " " + order.FirstName + " " + order.LastName + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Phone Number: </b></td><td>" + order.MobileNumber + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Email: </b></td><td>" + order.Email + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Address 1: </b></td><td>" + order.Address1 + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Address 2: </b></td><td>" + order.Address2 + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>City: </b></td><td>" + order.City + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Delivery Option: </b></td><td>" + order.DeliveryOption + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Instructions: </b></td><td>" + order.Instructions + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Total Amount: Rs.</b></td><td>" + order.TotalAmount + "</td></tr>" +
                   "<tr><td style='text-align:right;'><b>Order Date: </b></td><td>" + order.OrderDate + "</td></tr>" +
                   "</tbody></table><br/>";
        }

        public static String getOrderList(List<Babloos.Models.OrderDetail> orderdetails)
        {
            String orderList = "<table border='1' style='border-collapse:collapse;width:100%;'><thead><tr style='font-weight: bold; background: #ccc;'><td>Title</td><td>Qty.</td><td>Unit Price</td><td>Amount</td></tr></thead><tbody>";
            decimal totalAmount = 0;
            foreach (var item in orderdetails)
            {
                orderList = orderList + "<tr><td>" + item.Title + "</td><td>" + item.Quantity + "</td><td>Rs." + item.Price + "</td><td>Rs." + item.Amount + "</td></tr>";
                totalAmount = totalAmount + item.Amount;
            }
            return orderList + "<tfoot style='font-weight: bold; background: #ccc;'><tr><td colspan='3'>Total Amount:</td><td>Rs." + totalAmount + "</td></tr></tfoot>";
        }


        /// <summary>
        /// Function to send the new credentials to the email id of the user
        /// </summary>
        /// <param name="toEmailAddress">To Email</param>
        /// <param name="userName">To Display Name</param>
        /// <param name="aMailSubject">Email Subject</param>
        /// <param name="aEmailBody">Email Body</param>
        public static void SendEmail(string toEmailAddress, string toDisplayName, string aMailSubject, string aEmailBody)
        {
            //to and from of the mail
            MailAddress toAddress = new MailAddress(toEmailAddress, toDisplayName);
            MailAddress fromAddress = new MailAddress("email", "Babloo's Order Support");
            var message = new MailMessage(fromAddress, toAddress);

            //the body of the message
            var strEmailMessage = new StringBuilder();
            strEmailMessage.Append(
                "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head runat='server'><title></title></head><body><form id='form1' runat='server'><div>" +
                aEmailBody + "</div></form></body></html>");

            //subject
            message.Subject = aMailSubject;
            message.Body = strEmailMessage.ToString();
            //set id the body is in html format
            message.IsBodyHtml = true;

            //sent the mail
            //var smtp = new SmtpClient();
            try
            {
                // Create a new Smpt Client using Google's servers
                var mailclient = new SmtpClient();
                mailclient.Host = "host";//ForGmail
                mailclient.Port = 25; //ForGmail


                // This is the critical part, you must enable SSL
                mailclient.EnableSsl = false;//ForGmail
                //mailclient.EnableSsl = false;
                mailclient.UseDefaultCredentials = true;

                // Specify your authentication details
                mailclient.Credentials = new System.Net.NetworkCredential("email", "password");//ForGmail
                mailclient.Send(message);
                mailclient.Dispose();
            }
            catch (Exception ex)
            {

            }
        }
    }
}