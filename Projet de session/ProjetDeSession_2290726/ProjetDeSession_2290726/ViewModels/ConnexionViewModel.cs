using System.ComponentModel.DataAnnotations;

namespace ProjetDeSession_2290726.ViewModels
{
    public class ConnexionViewModel
    {
        [Required(ErrorMessage = "Veuillez préciser un nom d'utilisateur")]
        public string Pseudo { get; set; } = null!;

        [Required(ErrorMessage = "Veuillez entrer un mot de passe.")]
        public string Mdp { get; set; } = null!;
    }
}
