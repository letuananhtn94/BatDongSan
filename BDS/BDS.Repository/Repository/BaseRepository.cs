using BDS.Repository.EntityFramework;
using BDS.Repository.IRepository;
using System;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;

namespace BDS.Repository.Repository
{
    public class BaseRepository : IBaseRepository
    {
        private DbContext context;

        public BaseRepository()
        {
            context = new dbBatDongSanEntities();
            context.Configuration.LazyLoadingEnabled = false;
        }

        public DbContext GetContext()
        {
            if (context == null)
            {
                context = new dbBatDongSanEntities();
                context.Configuration.LazyLoadingEnabled = false;
            }
            return context;
        }
    }
    public static class PredicateBuilder
    {
        public static Expression<Func<T, bool>> True<T>() { return f => true; }
        public static Expression<Func<T, bool>> False<T>() { return f => false; }

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> expr1,
                                                            Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>
                  (Expression.OrElse(expr1.Body, invokedExpr), expr1.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> expr1,
                                                             Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>
                  (Expression.AndAlso(expr1.Body, invokedExpr), expr1.Parameters);
        }
    }
}
