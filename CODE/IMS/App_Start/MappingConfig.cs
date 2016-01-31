using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.App_Start
{
    public static class MappingConfig
    {
        public static void RegisterMaps()
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
            });
        }
    }
}