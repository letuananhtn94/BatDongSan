using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Service
{
    public class ServiceModule: Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            RegisterForWeb(builder);
        }
        private void RegisterForWeb(ContainerBuilder builder)
        {
            builder.RegisterType<ProjectService>().As<IProjectService>().InstancePerRequest();
            builder.RegisterType<ProvinceService>().As<IProvinceService>().InstancePerRequest();
            builder.RegisterType<DistrictService>().As<IDistrictService>().InstancePerRequest();
            builder.RegisterType<CriteriaService>().As<ICriteriaService>().InstancePerRequest();
            builder.RegisterType<GroupCriteriaService>().As<IGroupCriteriaService>().InstancePerRequest();
            builder.RegisterType<UserService>().As<IUserService>().InstancePerRequest();
            builder.RegisterType<CommentService>().As<ICommentService>().InstancePerRequest();
            builder.RegisterType<SaveService>().As<ISaveService>().InstancePerRequest();
            builder.RegisterType<RoleService>().As<IRoleService>().InstancePerRequest();
        }

    }
}
