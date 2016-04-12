using System.Collections.Generic;
using Newtonsoft.Json;

namespace IMS.ApiModels
{
    public class DataTableModel<T> where T : class
    {
        [JsonProperty("data")]
        public List<T> Data { get; set; }
    }
}