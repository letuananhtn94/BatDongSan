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
    public interface IRoleService
    {
        List<Role> GetAll();
        Role Get(long id);
    }

    internal class RoleService : IRoleService
    {
        private readonly IRoleRepository _repository;

        public RoleService(IRoleRepository repository)
        {
            _repository = repository;
        }

        public Role Get(long id)
        {
            try
            {
                var result = _repository.Get(id);
                return result != null ? MappingConfig.Mapper.Map<Entity.Role, Role>(result) : new Role();
            }
            catch (Exception ex)
            {
                return new Role();
            }
        }

        public List<Role> GetAll()
        {
            try
            {
                var result = _repository.GetAll();
                return result.Select(v => MappingConfig.Mapper.Map<Entity.Role, Role>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Role>();
            }
        }
    }
}
