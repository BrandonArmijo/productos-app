using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductosAPI.Models
{
    public class ProductoDetalle
    {
        [Key]
        public int ProductoId { get; set; }

        [Column(TypeName = "nvarchar(100)")]
        public string Nombre { get; set; } = "";

        [Column(TypeName = "decimal(18,2)")]
        public double Precio { get; set; } = 0.0;

        [Column(TypeName = "int")]
        public int Stock { get; set; } = 0;



    }
}
