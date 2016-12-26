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
    public interface IGroupCriteriaService
    {
        GroupCriteria GetById(long id);
        List<GroupCriteria> GetAll();
    }

    internal class GroupCriteriaService : IGroupCriteriaService
    {
        private readonly IGroupCriteriaRepository _repository;

        public GroupCriteriaService(IGroupCriteriaRepository repository)
        {
            _repository = repository;
        }

        public List<GroupCriteria> GetAll()
        {
            try
            {
                var result = _repository.GetAll().OrderBy(a => a.ID);
                return result.Select(v => MappingConfig.Mapper.Map<Entity.GroupCriteria, GroupCriteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<GroupCriteria>();
            }
        }

        public GroupCriteria GetById(long id)
        {
            try
            {
                var result = _repository.Get(id, c => c.Criteria);
                return result != null ? MappingConfig.Mapper.Map<Entity.GroupCriteria, GroupCriteria>(result) : new GroupCriteria();
            }
            catch (Exception ex)
            {
                return new GroupCriteria();
            }
        }
    }
}
