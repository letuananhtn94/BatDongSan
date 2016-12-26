using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Repository.IRepository
{
    public interface IGenericRepository<TEntity>
    {
        /// <summary>
        /// Get all entity from db
        /// </summary>
        /// <param name="entity"></param>
        IList<TEntity> GetAll(params Expression<Func<TEntity, object>>[] includes);

        /// <summary>
        /// Get single entity by primary key
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        TEntity Get(long id);

        TEntity Get(long id, params Expression<Func<TEntity, object>>[] includes);

        /// <summary>
        /// Add entity to db
        /// </summary>
        /// <param name="entity"></param>
        TEntity Create(TEntity entity);

        /// <summary>
        /// Edit entity in db
        /// </summary>
        /// <param name="entity"></param>
        void Update(TEntity entity);

        /// <summary>
        /// Remove entity from db
        /// </summary>
        /// <param name="id"></param>
        void Delete(TEntity entityToDelete);

        /// <summary>
        /// Save Changes
        /// </summary>
        void SaveChanges();
    }
}
