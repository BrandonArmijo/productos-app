using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ProductosAPI.Models;
using ProductosAPI.Dtos;
using ProductosAPI.Repository;
using ProductosAPI.Helpers;

namespace ProductosAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {
        private readonly IUserRepository _repository;
        private readonly JwtService _jwtService;

        public AuthController(IUserRepository repository, JwtService jwtService)
        {
            _repository = repository;
            _jwtService = jwtService;
        }

        /// <summary>
        /// Registra un nuevo usuario.
        /// </summary>
        /// <response code="200">OK. Usuario registrado correctamente.</response>
        [HttpPost("register")]
        public IActionResult Register(RegisterDto dto)
        {
            var user = new User
            {
                Name = dto.Name,
                Username = dto.Username,
                Password = BCrypt.Net.BCrypt.HashPassword(dto.Password)
            };

            return Created("success", _repository.Create(user));
        }

        /// <summary>
        /// Inicia sesión el usuario registrado.
        /// </summary>
        /// <response code="200">OK. Acceso exitoso.</response>
        [HttpPost("login")]
        public IActionResult Login(LoginDto dto)
        {
            var user = _repository.GetByUsername(dto.Username);

            if (user == null) return BadRequest(new { message = "Invalid Credentials" });

            if (!BCrypt.Net.BCrypt.Verify(dto.Password, user.Password))
            {
                return BadRequest(new { message = "Invalid Credentials" });
            }

            var jwt = _jwtService.Generate(user.Id);

            Response.Cookies.Append("jwt", jwt, new CookieOptions
            {
                HttpOnly = true
            });

            return Ok(new
            {
                message = "success"
            });
        }

        /// <summary>
        /// Muestra info del usuario que ha iniciado sesión.
        /// </summary>
        /// <response code="200">OK. Se muestra el usuario logueado.</response>
        [HttpGet("user")]
        public IActionResult User()
        {
            try
            {
                var jwt = Request.Cookies["jwt"];

                var token = _jwtService.Verify(jwt);

                int userId = int.Parse(token.Issuer);

                var user = _repository.GetById(userId);

                return Ok(user);
            }
            catch (Exception)
            {
                return Unauthorized();
            }
        }

        /// <summary>
        /// Cierra sesión el usuario logueado.
        /// </summary>
        /// <response code="200">OK. Sesión cerrada.</response>
        [HttpPost("logout")]
        public IActionResult Logout()
        {
            Response.Cookies.Delete("jwt");

            return Ok(new
            {
                message = "success"
            });
        }

    }
}
