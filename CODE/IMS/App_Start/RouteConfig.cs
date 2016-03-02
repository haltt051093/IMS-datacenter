using System.Web.Mvc;
using System.Web.Routing;

namespace IMS
{
    public class RouteConfig
    {
        public static void Configure(RouteCollection builder)
        {
            builder.IgnoreRoute("{resource}.axd/{*pathInfo}");

            builder.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
