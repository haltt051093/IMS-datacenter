using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestReturnRackViewModel
    {
        public List<SelectListItem> RackOfCustomer { get; set; }
    }
}