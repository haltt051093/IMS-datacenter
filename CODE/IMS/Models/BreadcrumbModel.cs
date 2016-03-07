namespace IMS.Models
{
    public class BreadcrumbModel
    {
        public BreadcrumbModel()
        {
            
        }

        public BreadcrumbModel(string controller, string action, string title, object routeValue = null)
        {
            Controller = controller;
            Action = action;
            Title = title;
            RouteValue = routeValue;
        }

        public string Controller { get; set; }
        public string Action { get; set; }
        public string Title { get; set; }
        public object RouteValue { get; set; }
    }
}