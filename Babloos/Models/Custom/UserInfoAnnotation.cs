using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Babloos.Models
{
    public class UserInfoAnnotation
    {
        [Required]
        public string Title { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        public string Phone { get; set; }

        [Display(Name = "Alternative Phone")]
        public string AlternativePhone { get; set; }

        [Required]
        public string Address1 { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string EmailAddress { get; set; }

        [Required]
        public string Password { get; set; }
    }
}