
using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(IMS.App_Code.AppConfig))]
namespace IMS.App_Code
{
    public class AppConfig
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR("/signalr", new HubConfiguration());
        }
    }
}