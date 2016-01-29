using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;

namespace IMS.Models
{
    public class ServerDetailsViewModel
    {
        public Server Server { get; set; }
        public List<ServerAttribute> Attributes { get; set; }
    }
}