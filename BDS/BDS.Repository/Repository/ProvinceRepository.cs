using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;

namespace BDS.Repository.Repository
{
    public class ProvinceRepository : GenericRepository<Province>, IProvinceRepository
    {
        public ProvinceRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public Province Get(string id)
        {
            var projects = Query().Include(v => v.District);

            if (!string.IsNullOrEmpty(id))
            {
                projects = projects.Where(p => p.ID == id).OrderBy(a => a.Name);
            }

            return projects.FirstOrDefault();
        }
    }
}
