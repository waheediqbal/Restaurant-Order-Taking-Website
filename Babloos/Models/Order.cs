//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Babloos.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    [MetadataTypeAttribute(typeof(OrderAnnotation))]
    public partial class Order
    {
        public Order()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public long Id { get; set; }
        public Nullable<long> UserId { get; set; }
        public string Email { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public decimal TotalAmount { get; set; }
        public System.DateTime OrderDate { get; set; }
        public string DeliveryOption { get; set; }
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public string Instructions { get; set; }
        public string OrderStatus { get; set; }
        public string MobileNumber { get; set; }
    
        public virtual UserInfo UserInfo { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
