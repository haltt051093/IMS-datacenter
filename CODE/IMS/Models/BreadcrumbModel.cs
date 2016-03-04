namespace IMS.Models
{
    public class BreadcrumbModel
    {
        public BreadcrumbModel()
        {
            
        }

        public BreadcrumbModel(string controller, string action, string title)
        {
            Controller = controller;
            Action = action;
            Title = title;
        }

        public string Controller { get; set; }
        public string Action { get; set; }
        public string Title { get; set; }
    }
}