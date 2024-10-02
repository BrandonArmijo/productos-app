using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProductosAPI.Models;

namespace ProductosAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoDetalleController : ControllerBase
    {
        private readonly ProductoDetalleContext _context;

        public ProductoDetalleController(ProductoDetalleContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Obtiene todos los productos.
        /// </summary>
        /// <response code="200">OK. Devuelve todos los productos.</response>     
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductoDetalle>>> GetProductoDetalles()
        {
          if (_context.ProductoDetalles == null)
          {
              return NotFound();
          }
            return await _context.ProductoDetalles.ToListAsync();
        }

        /// <summary>
        /// Obtiene el detalle de un producto en específico.
        /// </summary>
        /// <param name="id">ID del producto a consultar.</param>             
        /// <response code="200">OK. Devuelve el producto solicitado.</response>          
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductoDetalle>> GetProductoDetalle(int id)
        {
          if (_context.ProductoDetalles == null)
          {
              return NotFound();
          }
            var productoDetalle = await _context.ProductoDetalles.FindAsync(id);

            if (productoDetalle == null)
            {
                return NotFound();
            }

            return productoDetalle;
        }


        /// <summary>
        /// Actualiza un producto en específico.
        /// </summary>
        /// <param name="id">ID del producto a actualizar.</param>
        /// <param name="productoDetalle">Objeto de tipo ProductoDetalle a actualizar.</param>
        /// <response code="200">OK. El producto fue actualizado correctamente.</response>
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductoDetalle(int id, ProductoDetalle productoDetalle)
        {
            if (id != productoDetalle.ProductoId)
            {
                return BadRequest();
            }

            _context.Entry(productoDetalle).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductoDetalleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(await _context.ProductoDetalles.ToListAsync());
        }


        /// <summary>
        /// Agrega un nuevo producto.
        /// </summary>
        /// <param name="productoDetalle">Objeto de tipo ProductoDetalle a agregar.</param>
        /// <response code="200">OK. El producto fue agregado correctamente.</response>
        [HttpPost]
        public async Task<ActionResult<ProductoDetalle>> PostProductoDetalle(ProductoDetalle productoDetalle)
        {
          if (_context.ProductoDetalles == null)
          {
              return Problem("Entity set 'ProductoDetalleContext.ProductoDetalles'  is null.");
          }
            _context.ProductoDetalles.Add(productoDetalle);
            await _context.SaveChangesAsync();

            return Ok(await _context.ProductoDetalles.ToListAsync());
        }

        /// <summary>
        /// Elimina un producto en específico.
        /// </summary>
        /// <param name="id">ID del producto a eliminar.</param>
        /// <response code="200">OK. El producto fue eliminado correctamente.</response>
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProductoDetalle(int id)  
        {
            if (_context.ProductoDetalles == null)
            {
                return NotFound();
            }
            var productoDetalle = await _context.ProductoDetalles.FindAsync(id);
            if (productoDetalle == null)
            {
                return NotFound();
            }

            _context.ProductoDetalles.Remove(productoDetalle);
            await _context.SaveChangesAsync();

            return Ok(await _context.ProductoDetalles.ToListAsync());
        }

        private bool ProductoDetalleExists(int id)
        {
            return (_context.ProductoDetalles?.Any(e => e.ProductoId == id)).GetValueOrDefault();
        }
    }
}
