using Autofac;
using Autofac.Integration.Mvc;
using BDS.Repository.Repository;
using BDS.Service;
using System.Reflection;
using System.Web.Mvc;

namespace BDS
{
    public static class BootStrapper
    {
        public static void Run()
        {
            SetAutofacContainer();
        }

        private static void SetAutofacContainer()
        {
            var builder = new ContainerBuilder();

            // register controllers
            builder.RegisterControllers(Assembly.GetExecutingAssembly());

            // register modules
            builder.RegisterModule(new RepositoryModule());
            builder.RegisterModule(new ServiceModule());
           
            // register Filters
            builder.RegisterFilterProvider();

            var container = builder.Build();

            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
        static ILifetimeScope RegisterWebRequestScope(this IContainer container)
        {
            var scope = container.BeginLifetimeScope("AutofacWebRequest");
            return scope;
        }
    }
}