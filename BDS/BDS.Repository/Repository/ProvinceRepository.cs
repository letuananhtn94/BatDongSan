using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;

namespace BDS.Repository.Repository
{
    public class ProvinceRepository : GenericRepository<Province>, IProvinceRepository
    {
        public ProvinceRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

    }
}
