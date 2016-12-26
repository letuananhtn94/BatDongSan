using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Like : BaseData
    {
        public long? ProjectID { get; set; }
        public long? UserID { get; set; }

        public virtual Project Project { get; set; }
        public virtual User User { get; set; }
    }
}
