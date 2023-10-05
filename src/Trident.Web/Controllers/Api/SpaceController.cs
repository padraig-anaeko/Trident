using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Trident.Web.Core.Models;
using Trident.Web.Core.Models.ViewModels;
using Trident.Web.DataAccess;

namespace Trident.Web.Controllers.Api
{
    [ApiController]
    [Route("api/instances/{instanceId}/spaces")]
    public class SpaceController : ControllerBase
    {
        private readonly ISpaceRepository _repository;

        public SpaceController(ISpaceRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public Task<PagedViewModel<SpaceModel>> GetAll(int instanceId, int currentPage = 1, int rowsPerPage = 10, string sortColumn = "Start", bool isAsc = true)
        {
            return _repository.GetAllAsync(currentPage, rowsPerPage, sortColumn, isAsc, instanceId);
        }

        [HttpGet]
        [Route("{id}")]
        public Task<SpaceModel> GetById(int id)
        {
            return _repository.GetByIdAsync(id);
        }
        
        [HttpPost]        
        public Task<SpaceModel> Insert(int instanceId, SpaceModel model)
        {
            model.InstanceId = instanceId;

            return _repository.InsertAsync(model);
        }
        
        [HttpPut]
        [Route("{id}")]
        public Task<SpaceModel> Update(int instanceId, int id, SpaceModel model)
        {
            model.InstanceId = instanceId;
            model.Id = id;
            return _repository.UpdateAsync(model);
        }
        
        [HttpDelete]
        [Route("{id}")]
        public Task Delete(int instanceId, int id)
        {
            return _repository.DeleteAsync(id);
        }
    }
}