using Microsoft.AspNet.SignalR;

namespace IMS.Services
{
    public class RemoteControllerHub : Hub
    {
        public static IHubContext instance;
        public static IHubContext Current
        {
            get
            {
                if (instance == null)
                {
                    instance = GlobalHost.ConnectionManager.GetHubContext<RemoteControllerHub>();
                }
                return instance;
            }
        }
    }
}