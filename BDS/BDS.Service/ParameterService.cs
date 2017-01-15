using System;
using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using Entity = BDS.Repository.EntityFramework;
using BDS.Repository.IRepository;
using System.Linq;

namespace BDS.Service
{
    public interface IParameterService
    {
    }

    internal class ParameterService : IParameterService
    {
        private readonly IParameterRepository _repositoty;

        public ParameterService(IParameterRepository repositoty)
        {
            _repositoty = repositoty;
        }

        
    }
}
