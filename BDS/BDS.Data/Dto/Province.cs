using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Province
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }

        public virtual ICollection<District> District { get; set; }
    }
}
