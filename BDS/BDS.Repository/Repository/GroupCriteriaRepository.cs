using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;

namespace BDS.Repository.Repository
{
    public class GroupCriteriaRepository : GenericRepository<GroupCriteria>, IGroupCriteriaRepository
    {
        public GroupCriteriaRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        
    }
}
