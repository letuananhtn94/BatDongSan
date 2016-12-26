using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System.Collections.Generic;

namespace BDS.Repository.Repository
{
    public class DistrictRepository : GenericRepository<District>, IDistrictRepository
    {
        public DistrictRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public List<District> Get(string id)
        {
            var projects = Query().Include(v => v.Province);

            if (!string.IsNullOrEmpty(id))
            {              
                projects = projects.Where(p => p.ProvinceID == id).OrderBy(a => a.Name);                 
            }

            return projects.ToList();

        }
    }
}
