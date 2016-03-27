using System.Collections.Generic;

namespace IMS.Models
{
    public class JsonResultModel
    {
        public JsonResultModel()
        {
            Codes = new List<string>();
            Messages = new List<string>();
        }

        public bool Success { get; set; }

        public List<string> Codes { get; set; }
        
        public List<string> Messages { get; set; }
    }
}