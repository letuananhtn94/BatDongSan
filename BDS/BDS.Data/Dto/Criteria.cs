using BDS.Data.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Criteria : BaseData
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public double? Score { get; set; }
        public int? GroupID { get; set; }
        public int? Type { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Active { get; set; }

        public virtual GroupCriteria GroupCriteria { get; set; }
        public virtual IList<DetailProject> DetailProject { get; set; }

        public bool Selected { get; set; }
        public int Importance { get; set; }        
        public bool Prerequisite { get; set; }
        public string Value { get; set; }
        public string EnumType { get; set; }
    }
}
