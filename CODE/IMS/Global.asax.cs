using System.Web.Mvc;
using System.Web.Routing;
using IMS.App_Start;
using IMS.Controllers;

namespace IMS
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            //GlobalFilters.Filters.Add(new AuthorizeAttribute());
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            MappingConfig.RegisterMaps();
            Scheduler.JobScheduler.Start();
        }
    }
}
