﻿using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestHistoryViewModel
    {
        public RequestHistoryViewModel()
        {
            Request = new List<RequestExtendedModel>();
        }

        public List<RequestExtendedModel> Request { get; set; }
    }
}