using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class DetailProject : BaseData
    {
        public long? ProjectID { get; set; }
        public int? CriteriaID { get; set; }
        public int? Value { get; set; }

        public virtual Criteria Criteria { get; set; }
        public virtual Project Project { get; set; }
    }
}
