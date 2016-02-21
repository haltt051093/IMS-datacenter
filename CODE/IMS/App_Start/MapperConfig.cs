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
                config.CreateMap<RequestIPViewModel, NotificationExtendedModel>();
                //request add server
                config.CreateMap<RequestAddServerViewModel,Server>();
            });
        }
    }
}