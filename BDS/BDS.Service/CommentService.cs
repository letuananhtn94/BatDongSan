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
    public interface ICommentService
    {
        ServiceResult<Comment> Add(Comment comment);
        List<Comment> GetListById(long id);
    }

    internal class CommentService : ICommentService
    {
        private readonly ICommentRepository _repository;

        public CommentService(ICommentRepository repository)
        {
            _repository = repository;
        }

        public ServiceResult<Comment> Add(Comment comment)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<Comment, Entity.Comment>(comment);
                var result = _repository.Create(model);
                return new ServiceResult<Comment>
                {
                    Data = MappingConfig.Mapper.Map<Entity.Comment, Comment>(result)
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult<Comment>
                {
                    Message = ex.Message
                };
            }

        }

        public List<Comment> GetListById(long id)
        {
            try
            {
                var result = _repository.GetListById(id);

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Comment, Comment>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Comment>();
            }
        }
    }
}
