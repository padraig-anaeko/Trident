using System;
using System.Threading.Tasks;
using Trident.Web.Core.Configuration;
using Trident.Web.Core.Models;
using Trident.Web.Core.Models.ViewModels;

namespace Trident.Web.DataAccess
{
    public interface ISyncLogRepository : IBaseRepository<SyncLogModel>
    {
        Task<PagedViewModel<SyncLogModel>> GetAllAsync(int syncId, DateTime lastDateRetrieved);
    }

    public class SyncLogRepository : BaseRepository<SyncLogModel>, ISyncLogRepository
    {
        public SyncLogRepository(IMetricConfiguration metricConfiguration) : base(metricConfiguration)
        {
        }

        public Task<PagedViewModel<SyncLogModel>> GetAllAsync(int syncId, DateTime lastDateRetrieved)
        {
            return base.GetAllAsync(0, int.MaxValue, "Id", isAsc: true, $"Where syncId = {syncId} and Created > '{lastDateRetrieved}'");
        }
    }
}
