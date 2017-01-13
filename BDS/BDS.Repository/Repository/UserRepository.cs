using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using BDS.Data.Common;

namespace BDS.Repository.Repository
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        public UserRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
            
        }

        public bool CheckEmail(string email)
        {
            var user = Query();
            return user.Count(x => x.Email == email) > 0;
        }

        public bool CheckUserName(string userName)
        {
            var user = Query();
            return user.Count(x => x.UserName == userName) > 0;
        }

        public User GetById(string userName)
        {
            var user = Query();
            var result = user.SingleOrDefault(x => x.UserName == userName);
            return result;
        }
        
        public long InsertForFacebook(User entity)
        {
            var user = Query();
            var user1 = user.SingleOrDefault(x => x.UserName == entity.UserName);
            if (user1 == null)
            {
                this.Create(entity);                
                return entity.ID;
            }
            else
            {
                return user1.ID;
            }
        }

        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var user = Query();
            var result = user.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (result.RoleID.Contains("1"))
                    {
                        if (result.Active == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (result.Password == passWord)
                                return 1;
                            else
                                return -2;
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Active == false)
                    {
                        return -1;
                    }
                    else
                    {
                        if (result.Password == passWord)
                            return 1;
                        else
                            return -2;
                    }
                }
            }
        }
    }
}
