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
    public interface IProjectService
    {
        SearchResult<Project> Search(SearchProject search);

        List<Project> GetListTopHome();

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
                Project pro = new Project();
                var projectList = new List<Project>();
                var detailList = new List<DetailProject>();
                
                var result = _detailProjectRepositoty.Search(search);
                var detailProject = result.Data.Select(v => MappingConfig.Mapper.Map<Entity.DetailProject, DetailProject>(v)).ToList().OrderBy(t=>t.ProjectID);
                var detailProjects = detailProject.ToList();
                //int count;
                //var dp1 = detailProjects[0];
                //var dp2 = detailProjects[0];

                //for ( int i = 0; i < detailProjects.Count; i++ )
                //{
                //    foreach (var item in search.Criterias.ToList())
                //    {
                //        if (item.Selected && item.Prerequisite)
                //        {                            
                //            if (dp1.CriteriaID == item.ID)
                //            {
                //                if (dp1.ProjectID == dp2.ProjectID)
                //                {
                //                    detailList.Add(dp1);
                //                    detailProjects.Remove(dp1);
                //                    dp1 = detailProjects[0];

                //                    //if (detailList.Count <= 0)
                //                    //{
                //                    //    detailList.Add(dp1);
                //                    //    detailProjects.Remove(dp1);
                //                    //    dp1 = detailProjects[0];
                //                    //}
                //                    //else
                //                    //{
                //                    //    count = detailList.Count - 1;
                //                    //    if (detailList[count].ProjectID != dp1.ProjectID)
                //                    //    {
                //                    //        detailList.Add(dp1);
                //                    //        detailProjects.Remove(dp1);
                //                    //    }
                //                    //    detailProjects.Remove(dp1);
                //                    //    dp2 = detailProjects[0];
                //                    //}
                //                }

                //            }
                //            else
                //            {
                                

                //                if (dp1.ProjectID != dp2.ProjectID)
                //                {
                //                    dp1 = detailProjects[0];
                //                    detailList.Remove(dp2);
                //                    break;
                //                }
                //                else
                //                {
                //                    dp2 = detailProjects[0];
                //                    detailProjects.Remove(dp1);
                //                    dp1 = detailProjects[0];
                                    
                                    
                //                }
                //            }

                //        }
                //    }

                //    dp2 = detailProjects[0];
                //}

                var projectsId = detailProjects.Select(v => v.Project.ID).Distinct().ToList();
                foreach (var item in projectsId)
                {
                    pro = GetById(item);
                    projectList.Add(pro);
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
    }
}
