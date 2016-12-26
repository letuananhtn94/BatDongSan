using System.Data.Entity;

namespace BDS.Repository.IRepository
{
    public interface IBaseRepository
    {
        DbContext GetContext();
    }
}
