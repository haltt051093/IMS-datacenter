using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestReturnRackViewModel
    {
        //main info
        public List<SelectListItem> RackOfCustomer { get; set; }
        public List<RackOfCustomerExtendedModel> AllRacks { get; set; }
        public List<string> SelectedRacks { get; set; }
        public string Description { get; set; }
        //request info
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public string StatusCode { get; set; }
        public string StatusName { get; set; }
        public string StaffCode { get; set; }
        public string StaffName { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string Username { get; set; }
        public List<SelectListItem> AssignGroup { get; set; }
        //customer info
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        public string Company { get; set; }
        public string Phone { get; set; }

    }
}