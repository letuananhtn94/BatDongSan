using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Repository.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Repository.IRepository
{
    public interface IUserRepository: IGenericRepository<User>
    {
        long InsertForFacebook(User entity);
        int Login(string userName, string passWord, bool isLoginAdmin = false);
        User GetById(string userName);
        bool CheckUserName(string userName);
        bool CheckEmail(string email);
    }
}
