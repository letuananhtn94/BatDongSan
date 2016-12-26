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
    public interface IDistrictService
    {       
        List<District> GetAllById(string provinceId);       
    }

    internal class DistrictService : IDistrictService
    {
        private readonly IDistrictRepository _districtRepository;

        public DistrictService(IDistrictRepository districtRepository)
        {
            _districtRepository = districtRepository;
        }

        public List<District> GetAllById(string provinceId)
        {
            try
            {
                var result = _districtRepository.Get(provinceId);

                return result.Select(v => MappingConfig.Mapper.Map<Entity.District, District>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<District>();
            }

        }
       
    }
}
