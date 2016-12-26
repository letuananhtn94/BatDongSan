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
    public interface ICriteriaService
    {

        List<Criteria> GetByID(long groupId, string code, string codeFull);
        List<Criteria> GetAll();
    }

    internal class CriteriaService : ICriteriaService
    {
        private readonly ICriteriaRepository _repository;

        public CriteriaService(ICriteriaRepository repository)
        {
            _repository = repository;
        }
       
        public List<Criteria> GetByID(long groupId, string code, string codeFull)
        {
            try
            {
                var result = _repository.Get(groupId, code, codeFull);

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Criteria, Criteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Criteria>();
            }

        }

        public List<Criteria> GetAll()
        {
            try
            {
                var result = _repository.GetAll();

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Criteria, Criteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Criteria>();
            }

        }
    }
}
