using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class ServerIP : BaseModel
    {
        public int Id { get; set; }

        public int ServerId { get; set; }

        public int CurrentIP { get; set; }
    }
}
