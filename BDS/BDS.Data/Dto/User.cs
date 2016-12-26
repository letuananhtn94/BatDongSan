using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class User : BaseData
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public int? RoleID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Active { get; set; }

        public virtual IList<Comment> Comment { get; set; }
        public virtual IList<Like> Like { get; set; }
        public virtual Role Role { get; set; }
        public virtual IList<Save> Save { get; set; }
    }
}
