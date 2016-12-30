using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto.Request
{
    public class BaseSearchProject
    {
        public string Address { get; set; }
        public int Price { get; set; }
        public int Acreage { get; set; }
    }

    public class SearchProject : SearchCriteria
    {
        public List<Criteria> Criterias { get; set; }
        public BaseSearchProject BaseSearchProject { get; set; }
    }
}
