using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace ProductosAPI.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(100)")]
        public string Name { get; set; } = "";

        [Column(TypeName = "nvarchar(100)")]
        public string Username { get; set; } = "";

        [Column(TypeName = "nvarchar(100)")]
        [JsonIgnore] public string Password { get; set; } = "";
    }
}
