using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Parameter : BaseData
    {       
        public string ParaKey { get; set; }
        public string Value { get; set; }
        public string Description { get; set; }
    }
}
