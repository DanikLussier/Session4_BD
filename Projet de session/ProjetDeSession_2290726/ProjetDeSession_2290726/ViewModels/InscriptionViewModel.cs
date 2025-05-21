using System.ComponentModel.DataAnnotations;

namespace ProjetDeSession_2290726.ViewModels
{
    public class InscriptionViewModel
    {
        [Required(ErrorMessage = "Un pseudonyme est requis")]
        public string Pseudo { get; set; } = null!;

        [Required(ErrorMessage = "Un mot de passe est requis")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Le mot de passe doit contenir de 6 à 50 charactères")]
        [DataType(DataType.Password)]
        public string Mdp { get; set; } = null!;

        [Required(ErrorMessage = "Veuillez confirmer le mot de passe")]
        [DataType(DataType.Password)]
        [Compare(nameof(Mdp), ErrorMessage = "Les deux mots de passe doivent être identiques")]
        public string MdpConfirmation { get; set; } = null!;

        [Required(ErrorMessage = "Une petite phrase est requise")]
        public string Pensee { get; set; } = null!;
    }
}
