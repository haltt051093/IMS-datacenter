using IMS.Data.Models;
using IMS.Data.ViewModels;
using IMS.Models;

namespace IMS
{
    public static class MapperConfig
    {
        public static void Configure()
        {
            AutoMapper.Mapper.Initialize(config =>
            {
                //account
                config.CreateMap<Account, AccountIndexViewModel>();
                config.CreateMap<AccountCreateViewModel, Account>();
                config.CreateMap<Account, AccountCreateViewModel>();
                //server
                config.CreateMap<Server, ServerDetailsViewModel> ();
                config.CreateMap<ServerDetailsViewModel, Server>();
                //rack
                config.CreateMap<RackCreateViewModel, Rack>();
                //IP Address
                config.CreateMap<IPAddressPool, IPChangeStatusViewModel>();
                config.CreateMap<IPChangeStatusViewModel, IPAddressPool>();
                //Notification
                config.CreateMap<RequestRentRackViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestReturnRackViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestAddServerViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestBringServerAwayViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestAssignIPViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestChangeIPViewModel, NotificationExtendedModel>();
                config.CreateMap<RequestReturnIPViewModel, NotificationExtendedModel>();
                //request add server
                config.CreateMap<RequestAddServerViewModel,Server>();
                //process rent rack
                config.CreateMap<Request, RequestRentRackViewModel>();
                //process add server
                config.CreateMap<Request,RequestAddServerViewModel>();
                //process return rack
                config.CreateMap<Request, RequestReturnRackViewModel>();
                //process bring server away
                config.CreateMap<Request, RequestBringServerAwayViewModel>();
                //process assign, change, return ip
                config.CreateMap<Request, ProcessRequestChangeIPViewModel>();
                config.CreateMap<ServerExtendedModel, Server>();
            });
        }
    }
}