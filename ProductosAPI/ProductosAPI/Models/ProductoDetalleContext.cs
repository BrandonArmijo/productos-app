using Microsoft.EntityFrameworkCore;

namespace ProductosAPI.Models
{
    public class ProductoDetalleContext : DbContext
    {

        public ProductoDetalleContext(DbContextOptions<ProductoDetalleContext> options) : base(options)
        {
        }

        public DbSet<ProductoDetalle> ProductoDetalles { get; set; }

    }
}
