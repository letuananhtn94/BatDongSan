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
    public interface ITypeProjectService
    {
        List<TypeProject> GetAll();
        TypeProject Get(long id);
    }

    internal class TypeProjectService : ITypeProjectService
    {
        private readonly ITypeProjectRepository _repository;

        public TypeProjectService(ITypeProjectRepository repository)
        {
            _repository = repository;
        }

        public TypeProject Get(long id)
        {
            try
            {
                var result = _repository.Get(id);
                return result != null ? MappingConfig.Mapper.Map<Entity.TypeProject, TypeProject>(result) : new TypeProject();
            }
            catch (Exception ex)
            {
                return new TypeProject();
            }
        }

        public List<TypeProject> GetAll()
        {
            try
            {
                var result = _repository.GetAll();
                return result.Select(v => MappingConfig.Mapper.Map<Entity.TypeProject, TypeProject>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<TypeProject>();
            }
        }
    }
}
