using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto
{
    public class Image:BaseData
    {
        public long? ProjectID { get; set; }
        public long? CommentID { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
    }
}
