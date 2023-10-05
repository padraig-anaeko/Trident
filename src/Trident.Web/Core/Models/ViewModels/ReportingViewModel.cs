using System.Collections.Generic;

namespace Trident.Web.Core.Models.ViewModels
{
    public class ReportingViewModel
    {
        public InstanceModel Instance { get; set; }
        public IEnumerable<SpaceModel> SpaceList { get; set; }
            
    }
}
