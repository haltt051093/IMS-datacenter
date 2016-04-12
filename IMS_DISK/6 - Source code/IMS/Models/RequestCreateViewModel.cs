using System;
using System.Collections.Generic;
using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestCreateViewModel
    {
        public RequestCreateViewModel()
        {
            RequestTypes = new List<RequestType>();
        }

        public string Type { get; set; }
        public string RackCode { get; set; }

        public List<RequestType> RequestTypes { get; set; }
    }
}