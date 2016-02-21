using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace IMS
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            //GlobalFilters.Filters.Add(new AuthorizeAttribute());
            AreaRegistration.RegisterAllAreas();
            BundleConfig.Configure(BundleTable.Bundles);
            FilterConfig.Configure(GlobalFilters.Filters);
            GlobalConfiguration.Configure(WebApiConfig.Configure);
            RouteConfig.Configure(RouteTable.Routes);
            MapperConfig.Configure();
            Scheduler.JobScheduler.Start();
        }
    }
}
