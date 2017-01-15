using System;
using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using Entity = BDS.Repository.EntityFramework;
using BDS.Repository.IRepository;
using System.Linq;

namespace BDS.Service
{
    public interface ILikeService
    {
    }

    internal class LikeService : ILikeService
    {
        private readonly ILikeRepository _repositoty;

        public LikeService(ILikeRepository repositoty)
        {
            _repositoty = repositoty;
        }

        
    }
}
