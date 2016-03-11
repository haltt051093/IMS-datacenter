using System.Collections.Generic;

namespace IMS.Models
{
    public class SidebarItemModel
    {
        public SidebarItemModel()
        {
            SubMenu = new List<SidebarItemModel>();
        }

        public SidebarItemModel(string title, string action, string controller)
        {
            Title = title;
            Action = action;
            Controller = controller;
            SubMenu = new List<SidebarItemModel>();
        }

        public string Title { get; set; }
        public string Action { get; set; }
        public string Controller { get; set; }
        public List<string> Roles { get; set; }
        public List<SidebarItemModel> SubMenu { get; set; }
    }
}