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
    public class SaveRepository : GenericRepository<Save>, ISaveRepository
    {
        public SaveRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        
    }
}
