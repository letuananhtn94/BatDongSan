using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Data.Enum;
using BDS.Repository.IRepository;
using System.Linq;
using Entity = BDS.Repository.EntityFramework;
using System;

namespace BDS.Service
{
    public interface IProjectService
    {
        SearchResult<Project> Search(SearchProject search);

        Project GetById(long projectId);

        ServiceResult<Project> Add(Project project);

        bool Update(Project project);
    }

    internal class ProjectService : IProjectService
    {
        private readonly IProjectRepository _projectRepository;
        private readonly IDetailProjectRepositoty _detailProjectRepositoty;

        public ProjectService(IProjectRepository projectRepository, IDetailProjectRepositoty detailProjectRepositoty)
        {
            _projectRepository = projectRepository;
            _detailProjectRepositoty = detailProjectRepositoty;
        }


        public SearchResult<Project> Search(SearchProject search)
        {
            try
            {
                // var result = _projectRepository.Search(search);
                var result = _detailProjectRepositoty.Search(search);
                var detailProjects = result.Data.Select(v => MappingConfig.Mapper.Map<Entity.DetailProject, DetailProject>(v)).ToList();
                var projects = detailProjects.Select(v => v.Project).Distinct().ToList();

                foreach (var project in projects)
                {
                    project.Score = detailProjects.Where(v => v.ProjectID == project.ID).
                        Sum(v => (float)v.Criteria.Score * (search.Criterias.
                                FirstOrDefault(s => s.ID == v.CriteriaID).doquantrong));



                }
                if (result.Data != null && result.Data.Any())
                {
                    return new SearchResult<Project>
                    {
                        Data = projects,
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
    }
}
