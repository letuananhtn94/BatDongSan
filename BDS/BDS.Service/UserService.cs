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
        List<User> GetAll();
        long InsertForFacebook(User entity);
        int Login(string userName, string passWord, bool isLoginAdmin = false);
        long Insert(User entity);
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

        public List<User> GetAll()
        {
            try
            {
                var result = _repository.GetAll(t => t.Role).OrderByDescending(a => a.CreatedDate);
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

        public long Insert(User entity)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<User, Entity.User>(entity);
                return _repository.Insert(model);
            }
            catch (Exception ex)
            {
                return entity.ID;
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
    }
}
