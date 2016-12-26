using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Comment : BaseData
    {
        public long? ProjectID { get; set; }
        public long? UserID { get; set; }
        public string Content { get; set; }        
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Active { get; set; }

        public virtual Project Project { get; set; }
        public virtual User User { get; set; }
        public virtual IList<Image> Image { get; set; }
    }
}
