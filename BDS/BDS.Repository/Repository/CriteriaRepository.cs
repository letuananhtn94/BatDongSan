using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Extensions;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System.Collections.Generic;
using System;

namespace BDS.Repository.Repository
{
    public class CriteriaRepository : GenericRepository<Criteria>, ICriteriaRepository
    {
        public CriteriaRepository(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public List<Criteria> Get(long id, string code, string codeFull = null)
        {
            Criteria cr = new Criteria();
            List<Criteria> data = new List<Criteria>();

            if (!string.IsNullOrEmpty(codeFull))
            {
                cr = Query().Where(p => p.Code == codeFull).FirstOrDefault();
            }            
            
            var criteria = Query().Include(v => v.GroupCriteria);

            if (id != -1)
            {
                criteria = criteria.Where(p => p.GroupID == id && p.Code.Contains(code)).OrderBy(a => a.Code);
            }

            data = criteria.ToList();
            data.Remove(cr);

            return data;

        }

    }
}
