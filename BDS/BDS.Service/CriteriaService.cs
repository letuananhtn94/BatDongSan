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
    public interface ICriteriaService
    {
        List<Criteria> GetByID(long groupId, string code, string codeFull);
        IEnumerable<Criteria> GetList();
        List<Criteria> GetAll();
        List<Criteria> FilterList(List<Criteria> criteria);
        bool CheckPrerequisite(List<Criteria> criteria);
    }

    internal class CriteriaService : ICriteriaService
    {
        private readonly ICriteriaRepository _repository;

        public CriteriaService(ICriteriaRepository repository)
        {
            _repository = repository;
        }
       
        public List<Criteria> GetByID(long groupId, string code, string codeFull)
        {
            try
            {
                var result = _repository.Get(groupId, code, codeFull);

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Criteria, Criteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Criteria>();
            }

        }

        public List<Criteria> GetAll()
        {
            try
            {
                var result = _repository.GetAll();

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Criteria, Criteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Criteria>();
            }

        }

        public List<Criteria> FilterList(List<Criteria> criteria)
        {            
            List<Criteria> data = new List<Criteria>();
            List<Criteria> listPre = new List<Criteria>();

            foreach (var item in criteria.ToList())
            {
                if (item.Selected == true)
                {    
                    if(item.Prerequisite == true)
                    {
                        listPre.Add(item);
                    }
                    else
                    {
                        if(!string.IsNullOrEmpty(item.EnumType))
                        {
                            if(!string.IsNullOrEmpty(item.Value) && !item.Value.Equals("0"))
                            {
                                data.Add(item);
                            }                                                        
                        }
                        else
                        {
                            data.Add(item);
                        }
                        
                    }
                }                
            }

            if (listPre.Count != 0)
            {
                return listPre;
            }
            else
            {
                return data;
            }
        }

        public bool CheckPrerequisite(List<Criteria> criteria)
        {
            List<Criteria> data = new List<Criteria>();

            foreach (var item in criteria)
            {
                if (item.Selected == true && item.Prerequisite == true)
                {
                    data.Add(item);
                }
            }

            if (data.Count != 0)
                return true;
            return false;          
        }

        public IEnumerable<Criteria> GetList()
        {
            try
            {
                var result = _repository.GetAll();

                return result.Select(v => MappingConfig.Mapper.Map<Entity.Criteria, Criteria>(v)).ToList();
            }
            catch (Exception ex)
            {
                return new List<Criteria>();
            }
        }
        
    }
}
