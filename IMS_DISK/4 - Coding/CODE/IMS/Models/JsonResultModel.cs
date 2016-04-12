using System.Collections.Generic;
using Antlr.Runtime.Misc;

namespace IMS.Models
{
    public class JsonResultModel
    {
        public JsonResultModel()
        {
            Codes = new List<string>();
            Messages = new List<string>();
        }

        public string Action { get; set; }

        public bool Success { get; set; }

        public List<string> Codes { get; set; }
        
        public List<string> Messages { get; set; }
    }
}