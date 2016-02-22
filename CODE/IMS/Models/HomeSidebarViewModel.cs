using System.Collections.Generic;

namespace IMS.Models
{
    public class HomeSidebarViewModel
    {
        public HomeSidebarViewModel()
        {
            SubMenu = new List<HomeSidebarViewModel>();
        }

        public HomeSidebarViewModel(string title, string action, string controller)
        {
            Title = title;
            Action = action;
            Controller = controller;
            SubMenu = new List<HomeSidebarViewModel>();
        }

        public string Title { get; set; }
        public string Action { get; set; }
        public string Controller { get; set; }
        public List<string> Roles { get; set; }
        public List<HomeSidebarViewModel> SubMenu { get; set; }
    }
}