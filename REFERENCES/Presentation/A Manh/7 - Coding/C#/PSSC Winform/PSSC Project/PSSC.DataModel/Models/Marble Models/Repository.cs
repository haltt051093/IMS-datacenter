using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Ma.Repositories")]
    public class Repository
    {
        [Key]
        public int RepositoryId { get; set; }
        public string RepositoryName { get; set; }
        public string RespositoyDesciption { get; set; }
        public int? Quantity { get; set; }
        public int? QuantityLimits { get; set; }
        public int? MarbleId { get; set; }
        public System.Nullable<DateTime> DateOfCreation { get; set; }
        public System.Nullable<DateTime> DateOfLastModification { get; set; }

        [ForeignKey("MarbleId")]
        public Marble Marble { get; set; }
    }
}
