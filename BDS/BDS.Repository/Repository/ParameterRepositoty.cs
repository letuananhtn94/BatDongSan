using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using BDS.Data.Enum;
using LinqKit;
using System.Collections.Generic;

namespace BDS.Repository.Repository
{
    class ParameterRepositoty : GenericRepository<Parameter>, IParameterRepository
    {
        public ParameterRepositoty(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }
       
    }
}
