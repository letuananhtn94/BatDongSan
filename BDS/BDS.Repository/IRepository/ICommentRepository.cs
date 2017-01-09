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
    public interface ICommentRepository : IGenericRepository<Comment>
    {
        List<Comment> GetListById(long id);
    }
}
