using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Resources;

namespace IMS.Models
{
    public class HomeIndexViewModel
    {
        public int countblockedip { get; set; }   
        public int countusedip { get; set; }
        public int countavailableip { get; set; }
    }
}
