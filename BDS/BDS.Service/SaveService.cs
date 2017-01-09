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
    public interface ISaveService
    {
        ServiceResult<Save> Add(Save comment);
    }

    internal class SaveService : ISaveService
    {
        private readonly ISaveRepository _repository;

        public SaveService(ISaveRepository repository)
        {
            _repository = repository;
        }

        public ServiceResult<Save> Add(Save comment)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<Save, Entity.Save>(comment);
                var result = _repository.Create(model);
                return new ServiceResult<Save>
                {
                    Data = MappingConfig.Mapper.Map<Entity.Save, Save>(result)
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult<Save>
                {
                    Message = ex.Message
                };
            }
        }
    }
}
