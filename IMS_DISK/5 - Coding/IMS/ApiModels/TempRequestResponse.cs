﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.ViewModels;

namespace IMS.ApiModels
{
    public class TempRequestResponse
    {
        public string TempCode { get; set; }
        public ServerExtendedModel Server { get; set; }
    }
}