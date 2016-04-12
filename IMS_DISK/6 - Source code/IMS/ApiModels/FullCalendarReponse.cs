using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IMS.ApiModels
{
    public class FullCalendarReponse
    {
        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("start")]
        public string Start { get; set; }

        [JsonProperty("end")]
        public string End { get; set; }

        [JsonProperty("allDay")]
        public bool AllDay { get; set; }

        public string Status { get; set; }
    }
}