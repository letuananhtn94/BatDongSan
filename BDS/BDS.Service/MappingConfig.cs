using AutoMapper;
using BDS.Data.Dto;
using Entity = BDS.Repository.EntityFramework;

namespace BDS.Service
{
    public class MappingConfig
    {
        private static IMapper _mapper;

        public static IMapper Mapper
        {
            get
            {
                return _mapper;
            }
        }

        public static void RegisterMapping()
        {
            var mapperConfig = new MapperConfiguration(config =>
            {
                config.CreateMap<Entity.Project, Project>();
                config.CreateMap<Project,Entity.Project >();

                config.CreateMap<Entity.Image, Image>();
                config.CreateMap<Image,Entity.Image >();

                config.CreateMap<Entity.Province, Province>();
                config.CreateMap<Province, Entity.Province>();

                config.CreateMap<Entity.Criteria, Criteria>();
                config.CreateMap<Criteria, Entity.Criteria>();

                config.CreateMap<Entity.District, District>();
                config.CreateMap<District, Entity.District>();

                config.CreateMap<Entity.Comment, Comment>();
                config.CreateMap<Comment, Entity.Comment>();

                config.CreateMap<Entity.Like, Like>();
                config.CreateMap<Like, Entity.Like>();

                config.CreateMap<Entity.Save, Save>();
                config.CreateMap<Save, Entity.Save>();

                config.CreateMap<Entity.User, User>();
                config.CreateMap<User, Entity.User>();

                config.CreateMap<Entity.TypeProject, TypeProject>();
                config.CreateMap<TypeProject, Entity.TypeProject>();

                config.CreateMap<Entity.Role, Role>();
                config.CreateMap<Role, Entity.Role>();

                config.CreateMap<Entity.Parameter, Parameter>();
                config.CreateMap<Parameter, Entity.Parameter>();

                config.CreateMap<Entity.DetailProject, DetailProject>();
                config.CreateMap<DetailProject, Entity.DetailProject>();

                config.CreateMap<Entity.GroupCriteria, GroupCriteria>();
                config.CreateMap<GroupCriteria, Entity.GroupCriteria>();
                //.ConvertUsing<ProjectConverter>();
                // .ForMember(p => p.Status, m => m.MapFrom(f => f.Name + " hai"))
                // .ForMember(p => p.Name, m => m.MapFrom(f => f.Name + " hai"));
            });
            _mapper = mapperConfig.CreateMapper();
        }
    }

    #region Class Converter
    public class ProjectConverter : ITypeConverter<Entity.Project, Project>
    {
        public Project Convert(
            Entity.Project source,
            Project destination,
            ResolutionContext context)
        {
            if (source == null)
                return null;

            if (destination == null)
                destination = new Project();

            destination.Name = source.Name + "hai";

            return destination;
        }
    }
    #endregion
}
