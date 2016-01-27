﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class AccountExtendedModel : Account
    {
        public string RoleName { get; set; }
        public string GroupName { get; set; }
        
    }
}
