using BDS.Data.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Dto.Response
{
    public class ServiceResult<T>
    {
        public ResultCode ResultCode { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
    }
}
