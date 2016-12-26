using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Repository.EntityFramework;

namespace BDS.Repository.IRepository
{
    public interface IDetailProjectRepositoty : IGenericRepository<DetailProject>
    {
        SearchResult<DetailProject> Search(SearchProject search);
    }
}
