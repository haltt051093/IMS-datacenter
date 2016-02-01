using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestReturnRackViewModel
    {
        public List<RackOfCustomer> RackOfCustomer { get; set; }
        public List<String> RackCodes { get; set; }
        //public List<CheckBox> Checkboxracks { get; set; }
    }
}