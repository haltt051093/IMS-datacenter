using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ServerDetailsViewModel
    {
        public ServerExtendedModel Server { get; set; }
        public List<AttributeExtendedModel> Attributes { get; set; }
    }
}