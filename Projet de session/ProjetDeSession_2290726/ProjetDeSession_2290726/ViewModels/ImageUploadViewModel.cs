using Microsoft.AspNetCore.Antiforgery;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ProjetDeSession_2290726.ViewModels
{
    public class ImageUploadViewModel
    {
        [Required(ErrorMessage = "Il faut jindre un fichier Image")]
        public IFormFile FormFile { get; set; } = null!;

        [Required(ErrorMessage = "Il faut spécifier le nom de l'image")]
        [DisplayName("Nom de l'image en minuscule")]
        public string NomImage { get; set; } = null!;
    }
}
