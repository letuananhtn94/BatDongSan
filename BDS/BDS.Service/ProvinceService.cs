using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Data.Enum;
using BDS.Repository.IRepository;
using System.Linq;
using Entity = BDS.Repository.EntityFramework;
using System;
using System.Collections.Generic;

namespace BDS.Service
{
    public interface IProvinceService
    {
        Province GetById(string id);
        List<Province> GetAll();
    }

    internal class ProvinceService : IProvinceService
    {
        private readonly IProvinceRepository _repository;

        public ProvinceService(IProvinceRepository repository)
        {
            _repository = repository;
        }

        public List<Province> GetAll()
        {
            try
            {
                var result = _repository.GetAll().OrderBy(a => a.Name);
                return result.Select(v => MappingConfig.Mapper.Map<Entity.Province, Province>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Province>();
            }
        }

        public Province GetById(string id)
        {
            try
            {
                var result = _repository.Get(id);

                return result != null ? MappingConfig.Mapper.Map<Entity.Province, Province>(result) : new Province();
            }
            catch (Exception ex)
            {
                return new Province();
            }
        }
    }
}
