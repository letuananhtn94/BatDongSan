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
                config.CreateMap<Entity.Project, Project>().MaxDepth(3);
                config.CreateMap<Project,Entity.Project >().MaxDepth(3);

                config.CreateMap<Entity.Image, Image>().MaxDepth(3);
                config.CreateMap<Image,Entity.Image >().MaxDepth(3);

                config.CreateMap<Entity.Province, Province>().MaxDepth(3);
                config.CreateMap<Province, Entity.Province>().MaxDepth(3);

                config.CreateMap<Entity.Criteria, Criteria>().MaxDepth(3);
                config.CreateMap<Criteria, Entity.Criteria>().MaxDepth(3);

                config.CreateMap<Entity.District, District>().MaxDepth(3);
                config.CreateMap<District, Entity.District>().MaxDepth(3);

                config.CreateMap<Entity.Comment, Comment>().MaxDepth(3);
                config.CreateMap<Comment, Entity.Comment>().MaxDepth(3);

                config.CreateMap<Entity.Like, Like>().MaxDepth(3);
                config.CreateMap<Like, Entity.Like>().MaxDepth(3);

                config.CreateMap<Entity.Save, Save>().MaxDepth(3);
                config.CreateMap<Save, Entity.Save>().MaxDepth(3);

                config.CreateMap<Entity.User, User>().MaxDepth(3);
                config.CreateMap<User, Entity.User>().MaxDepth(3);

                config.CreateMap<Entity.TypeProject, TypeProject>().MaxDepth(3);
                config.CreateMap<TypeProject, Entity.TypeProject>().MaxDepth(3);

                config.CreateMap<Entity.Role, Role>().MaxDepth(3);
                config.CreateMap<Role, Entity.Role>().MaxDepth(3);

                config.CreateMap<Entity.Parameter, Parameter>().MaxDepth(3);
                config.CreateMap<Parameter, Entity.Parameter>().MaxDepth(3);

                config.CreateMap<Entity.DetailProject, DetailProject>().MaxDepth(3);
                config.CreateMap<DetailProject, Entity.DetailProject>().MaxDepth(3);

                config.CreateMap<Entity.GroupCriteria, GroupCriteria>().MaxDepth(3);
                config.CreateMap<GroupCriteria, Entity.GroupCriteria>().MaxDepth(3);
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
