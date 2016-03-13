using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestRentRackViewModel
    {
        //main info
        public int RackNumbers { get; set; }
        public List<SelectListItem> Numbers { get; set; }
        public string Description { get; set; }
        public MultiSelectList AvailableRacks { get; set; }
        public string[] SelectedRacks { get; set; }
        public List<RackExtendedModel> listRackByRows { get; set; }
        //customer info
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        //request info
        public string StaffName { get; set; }
        public string StaffCode { get; set; }
        public List<SelectListItem> AssignGroup { get; set; }
        public string Company { get; set; }
        public string Phone { get; set; }
        public string Username { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public string StatusName { get; set; }
        public bool IsViewed { get; set; }

    }

}