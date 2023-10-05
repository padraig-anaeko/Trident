using System.ComponentModel.DataAnnotations;

namespace Trident.Web.Core.Models
{
    public abstract class BaseModel
    {
        [Key]
        public int Id { get; set; }
    }
}
