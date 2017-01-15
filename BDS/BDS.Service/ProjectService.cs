using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Data.Enum;
using BDS.Repository.IRepository;
using System.Linq;
using Entity = BDS.Repository.EntityFramework;
using System;
using System.Collections.Generic;
using BDS.Service;

namespace BDS.Service
{
    public interface IProjectService
    {
        SearchResult<Project> Search(SearchProject search);

        List<Project> GetListTopHome();

        List<Project> GetAll();

        IEnumerable<Project> GetList();

        Project GetById(long projectId);

        ServiceResult<Project> Add(Project project);

        bool Update(Project project);

        bool Check(Project project, List<Criteria> listPre);
        
    }

    internal class ProjectService : IProjectService
    {
        private readonly IProjectRepository _projectRepository;
        private readonly IDetailProjectRepositoty _detailProjectRepositoty;

        private readonly ICriteriaService _criteriaService;

        public ProjectService(IProjectRepository projectRepository, IDetailProjectRepositoty detailProjectRepositoty, ICriteriaService criteriaService)
        {
            _projectRepository = projectRepository;
            _detailProjectRepositoty = detailProjectRepositoty;
            _criteriaService = criteriaService;
        }


        public SearchResult<Project> Search(SearchProject search)
        {
            try
            {
                Project pro = new Project();
                var projectList = new List<Project>();
                var detailList = new List<DetailProject>();
                               
                var result = _detailProjectRepositoty.Search(search);
                var detailProject = result.Data.Select(v => MappingConfig.Mapper.Map<Entity.DetailProject, DetailProject>(v)).ToList().OrderBy(t=>t.ProjectID);
                var detailProjects = detailProject.ToList();
                
                var projectsId = detailProjects.Select(v => v.Project.ID).Distinct().ToList();
                foreach (var item in projectsId)
                {
                    pro = GetById(item);
                    projectList.Add(pro);
                }

                var checkPre = _criteriaService.CheckPrerequisite(search.Criterias);

                if (checkPre)
                {
                    var count = projectList.Count;
                    var list = projectList;
                    for (var item = 1; item <= count; item++)
                    {
                        if (!Check(projectList[item - 1], search.Criterias))
                        {
                            projectList.Remove(projectList[item - 1]);
                            item--;
                            count--;                         
                        }
                    }
                }
                            
                foreach (var project in projectList)
                {
                    project.Score = detailProjects.Where(v => v.ProjectID == project.ID).
                        Sum(v => (float)v.Criteria.Score * (search.Criterias.
                                FirstOrDefault(s => s.ID == v.CriteriaID).Importance));

                }

                if (result.Data != null && result.Data.Any())
                {
                    return new SearchResult<Project>
                    {
                        Data = projectList.OrderByDescending(t => t.Score),
                        CurrentPage = result.CurrentPage,
                        PageCount = result.PageCount,
                        PageSize = result.PageSize,
                        ResultCode = ResultCode.Ok,
                        RowCount = result.RowCount
                    };
                }
                else
                {
                    return new SearchResult<Project>();
                }
            }
            catch (Exception ex)
            {
                return new SearchResult<Project>()
                {
                    Message = ex.Message
                };
            }

        }

        public Project GetById(long projectId)
        {
            try
            {
                var result = _projectRepository.Get(projectId, p => p.Image);

                return result != null ? MappingConfig.Mapper.Map<Entity.Project, Project>(result) : new Project();
            }
            catch (Exception ex)
            {
                return new Project();
            }

        }


        public ServiceResult<Project> Add(Project project)
        {
            try
            {
                var model = MappingConfig.Mapper.Map<Project, Entity.Project>(project);
                var result = _projectRepository.Create(model);
                return new ServiceResult<Project>
                {
                    Data = MappingConfig.Mapper.Map<Entity.Project, Project>(result)
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult<Project>
                {
                    Message = ex.Message
                };
            }

        }

        public bool Update(Project project)
        {
            try
            {
                var model = _projectRepository.Get(project.ID, p => p.Image, p => p.DetailProject);
                model.Lat = project.Lat;

                if (project.Image != null && project.Image.Any())
                {
                    model.Image = project.Image.Select(v => MappingConfig.Mapper.Map<Image, Entity.Image>(v)).ToList();
                }

                _projectRepository.Update(model);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public List<Project> GetListTopHome()
        {
            try
            {
                var result = _projectRepository.GetListTopHome();
                return result.Select(v => MappingConfig.Mapper.Map<Entity.Project, Project>(v)).ToList();
            }
            catch (Exception ex)
            {

                return new List<Project>();
            }
        }

        public List<Project> GetAll()
        {
            try
            {
                var result = _projectRepository.GetAll();
                return result.Select(v => MappingConfig.Mapper.Map<Entity.Project, Project>(v)).ToList();
            }
            catch (Exception ex)
            {

                return new List<Project>();
            }
        }

        public bool Check(Project project, List<Criteria> listPre)
        {
            var dem = 0;
            foreach (var item in listPre)
            {
                foreach (var dp in project.DetailProject.ToList())
                {
                    if (dp.CriteriaID == item.ID)
                    {
                        dem++;
                    }
                }
            }

            if (dem == listPre.Count)
                return true;
            return false;
        }

        public IEnumerable<Project> GetList()
        {
            try
            {
                var result = _projectRepository.GetAll();
                return result.Select(v => MappingConfig.Mapper.Map<Entity.Project, Project>(v)).ToList();
            }
            catch (Exception ex)
            {

                return new List<Project>();
            }
        }
    }
}
