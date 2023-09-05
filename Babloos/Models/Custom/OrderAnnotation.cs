using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Babloos.Models
{
    public class OrderAnnotation
    {
        [Required]
        public string Email { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        [Display(Name="First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        public string Address1 { get; set; }
        public string Address2 { get; set; }

        [Required]
        public string City { get; set; }

        [Display(Name = "Total Amount")]
        public decimal TotalAmount { get; set; }

        [Display(Name = "Order Date")]
        public System.DateTime OrderDate { get; set; }

        [Required]
        [Display(Name = "Delivery Option")]
        public string DeliveryOption { get; set; }

        [Display(Name = "Delivery Date")]
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public string Instructions { get; set; }

        [Display(Name = "Order Status")]
        public string OrderStatus { get; set; }

        [Required]
        [Display(Name = "Phone Number")]
        public string MobileNumber { get; set; }
    }
}