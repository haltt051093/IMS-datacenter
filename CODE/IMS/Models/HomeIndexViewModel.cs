using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class HomeIndexViewModel
    {

        public List<ServerViewModel> Servers { get; set; }
    }
}