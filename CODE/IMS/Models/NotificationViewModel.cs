using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class NotificationViewModel
    {
        public List<NotificationExtendedModel> NotificationList { get; set; }
        public List<SelectListItem> FilterByStatus { get; set; }
        public List<SelectListItem> FilterByRequestType { get; set; }
    }
}