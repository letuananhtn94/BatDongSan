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
    public interface IUserService
    {
        IEnumerable<User> GetAll();
        long InsertForFacebook(User entity);
        int Login(string userName, string passWord, bool isLoginAdmin = false);
        string Insert(User entity);
        string Update(User entity);
        string Delete(User entity);
        User Get(long id);
        User GetById(string userName);
        bool CheckEmail(string email);
        bool CheckUserName(string userName);
    }

    internal class UserService : IUserService
    {
        private readonly IUserRepository _repository;

        public UserService(IUserRepository repository)
        {
            _repository = repository;
        }

        public bool CheckEmail(string email)
        {
            return _repository.CheckEmail(email);
        }

        public bool CheckUserName(string userName)
        {
            return _repository.CheckUserName(userName);
        }

        public string Delete(User entity)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<User, Entity.User>(entity);
                _repository.Delete(model);
                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public User Get(long id)
        {
            try
            {
                var result = _repository.Get(id);
                return result != null ? MappingConfig.Mapper.Map<Entity.User, User>(result) : new User();
            }
            catch (Exception ex)
            {
                return new User();
            }
        }

        public IEnumerable<User> GetAll()
        {
            try
            {
                var result = _repository.GetAll().OrderByDescending(a => a.CreatedDate);
                return result.Select(v => MappingConfig.Mapper.Map<Entity.User, User>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<User>();
            }
        }

        public User GetById(string userName)
        {
            try
            {
                var result = _repository.GetById(userName);
                return result != null ? MappingConfig.Mapper.Map<Entity.User, User>(result) : new User();
            }
            catch (Exception ex)
            {
                return new User();
            }
        }

        public string Insert(User entity)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<User, Entity.User>(entity);
                var result = _repository.Create(model);
                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public long InsertForFacebook(User entity)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<User, Entity.User>(entity);
                return _repository.InsertForFacebook(model);
            }
            catch (Exception ex)
            {
                return entity.ID;
            }
        }

        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            try
            {
                var result = _repository.Login(userName, passWord, isLoginAdmin);
                return result;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public string Update(User entity)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<User, Entity.User>(entity);
                _repository.Update(model);
                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
