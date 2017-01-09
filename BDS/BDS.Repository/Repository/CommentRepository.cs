using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using System.Collections.Generic;

namespace BDS.Repository.Repository
{
    public class CommentRepository : GenericRepository<Comment>, ICommentRepository
    {
        public CommentRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public List<Comment> GetListById(long id)
        {
            var comments = Query().Include(v => v.Project).Include(v => v.User).Include(v => v.Image);
            comments = comments.Where(p => p.ProjectID == id).OrderBy(a => a.CreatedDate);            
            return comments.ToList();
        }
    }
}
