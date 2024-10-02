using ProductosAPI.Models;

namespace ProductosAPI.Repository
{
    public interface IUserRepository
    {
        User Create(User user);
        User GetByUsername(string username);
        User GetById(int id);
    }
}
