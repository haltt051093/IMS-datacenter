using IMS;
using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(AppConfig))]
namespace IMS
{
    public class AppConfig
    {
        public void Configuration(IAppBuilder builder)
        {
            builder.MapSignalR("/signalr", new HubConfiguration());
        }
    }
}