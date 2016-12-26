using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Role : BaseData
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual IList<User> User { get; set; }
    }
}
