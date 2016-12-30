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
    public class ProjectRepository : GenericRepository<Project>, IProjectRepository
    {
        public ProjectRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public List<Project> GetListTopHome()
        {
            var projects = Query().Include(v => v.Image);
            
            projects = projects.OrderByDescending(a => a.CreatedDate).Take(6);
          
            return projects.ToList();
        }
    }
}
