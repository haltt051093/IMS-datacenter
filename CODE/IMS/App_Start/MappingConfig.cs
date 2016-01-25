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
                config.CreateMap<Account, AccountIndexViewModel>();
            });
        }
    }
}