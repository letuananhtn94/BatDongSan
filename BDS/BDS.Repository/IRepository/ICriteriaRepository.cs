using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Repository.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Repository.IRepository
{
    public interface ICriteriaRepository : IGenericRepository<Criteria>
    {
        List<Criteria> Get(long id, string code, string codeFull);
        
    }
}
