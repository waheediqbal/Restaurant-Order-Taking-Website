using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Babloos.Models
{
    public class AllMenu
    {
        public AllMenu()
            {
                menuList = new List<Menu>();
                menuitemList = new List<MenuItem>();
            }

            public List<Menu> menuList { get; set; }
            public List<MenuItem> menuitemList { get; set; }
    }
}