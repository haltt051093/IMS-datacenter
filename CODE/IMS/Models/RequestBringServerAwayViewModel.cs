﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestBringServerAwayViewModel
    {
        //main content
        public List<ServerExtendedModel> ServerOfCustomer { get; set; }
        public List<Server> SelectedServers { get; set; }
        public List<SelectListItem> RackOfCustomer { get; set; }
        public string SelectedRack { get; set; }
        public int ServerNumber { get; set; }
        public int SelectedServerNumber { get; set; }
        public int ReturnIpNumber { get; set; }
        public int ReturnLocationNumber { get; set; }
        public string Description { get; set; }
        //customer info
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        public string Identification { get; set; }
        public DateTime? AppointmentTime { get; set; }
        public string Company { get; set; }
        public string Phone { get; set; }
        //request info
        public string StaffName { get; set; }
        public string StaffCode { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public string StatusName { get; set; }
        public List<SelectListItem> AssignGroup { get; set; } 

        public List<string> Servers { get; set; }
        public List<string> ServerIps { get; set; }
        public List<string> ServerLocation { get; set; }

        public string Username { get; set; }
    }
}