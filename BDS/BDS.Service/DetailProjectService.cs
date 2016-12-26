using System;
using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using Entity = BDS.Repository.EntityFramework;
using BDS.Repository.IRepository;
using System.Linq;

namespace BDS.Service
{
    public interface IDetailProjectService
    {
    }

    internal class DetailProjectService : IDetailProjectService
    {
        private readonly IDetailProjectRepositoty _detailProjectRepositoty;

        public DetailProjectService(IDetailProjectRepositoty detailProjectRepositoty)
        {
            _detailProjectRepositoty = detailProjectRepositoty;
        }

        
    }
}
