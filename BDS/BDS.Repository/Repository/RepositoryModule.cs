using System;
using Autofac;
using BDS.Repository.Repository;
using BDS.Repository.IRepository;

namespace BDS.Repository.Repository
{
    public class RepositoryModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            RegisterForWeb(builder);
        }


        private void RegisterForWeb(ContainerBuilder builder)
        {
            builder.RegisterType<BaseRepository>().As<IBaseRepository>().InstancePerRequest();
            builder.RegisterType<ProjectRepository>().As<IProjectRepository>().InstancePerRequest();
            builder.RegisterType<ProvinceRepository>().As<IProvinceRepository>().InstancePerRequest();
            builder.RegisterType<DistrictRepository>().As<IDistrictRepository>().InstancePerRequest();
            builder.RegisterType<CriteriaRepository>().As<ICriteriaRepository>().InstancePerRequest();
            builder.RegisterType<DetailProjectRepositoty>().As<IDetailProjectRepositoty>().InstancePerRequest();
            builder.RegisterType<UserRepository>().As<IUserRepository>().InstancePerRequest();
            builder.RegisterType<CommentRepository>().As<ICommentRepository>().InstancePerRequest();
            builder.RegisterType<SaveRepository>().As<ISaveRepository>().InstancePerRequest();
        }

    }
}
