using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using BDS.Data.Common;

namespace BDS.Repository.Repository
{
    public class TypeProjectRepository : GenericRepository<TypeProject>, ITypeProjectRepository
    {
        public TypeProjectRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
            
        }

       
    }
}
