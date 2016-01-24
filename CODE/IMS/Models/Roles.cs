using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IMS.Models
{
    [MetadataType(typeof(RolesMetadata))]
    public partial class Roles
    {

    }

    public class RolesMetadata
    {
        public List<Role> Roles
        {
            get
            {
                IMSContextDB db = new IMSContextDB();
                return db.Role.ToList();
            }
        }
    }
}