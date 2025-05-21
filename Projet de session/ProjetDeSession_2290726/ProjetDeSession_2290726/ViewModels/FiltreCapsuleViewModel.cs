using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;
using ProjetDeSession_2290726.Models;

namespace ProjetDeSession_2290726.ViewModels
{
    public class FiltreCapsuleViewModel
    {
        public List<Capsule> Capsules { get; set; } = null!;

        public int AmertumeMax { get; set; } = 10;

        public int AmertumeMin { get; set; } = 0;

        public decimal PrixUniteMax { get; set; } = 10;

        public string Name { get; set; } = null!;
    }
}
