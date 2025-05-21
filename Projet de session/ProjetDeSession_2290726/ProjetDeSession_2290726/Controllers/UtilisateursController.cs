using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Build.ObjectModelRemoting;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProjetDeSession_2290726.Data;
using ProjetDeSession_2290726.Models;
using ProjetDeSession_2290726.ViewModels;
using System.Security.Claims;

namespace ProjetDeSession_2290726.Controllers
{
    public class UtilisateursController : Controller
    {
        readonly NespressoContext _context;
        public UtilisateursController(NespressoContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Inscription()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Inscription(InscriptionViewModel ivm)
        {
            bool existeDeja = await _context.Utilisateurs.AnyAsync(x => x.Pseudo == ivm.Pseudo);
            if (existeDeja)
            {
                ModelState.AddModelError("Pseudo", "Ce pseudo est déjà pris.");
                return View(ivm);
            }

            string query = "EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo, @Mdp, @Pensee";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName = "@Pseudo", Value = ivm.Pseudo },
                new SqlParameter{ParameterName = "@Mdp", Value = ivm.Mdp },
                new SqlParameter{ParameterName = "@Pensee", Value = ivm.Pensee }
            };

            try
            {
                await _context.Database.ExecuteSqlRawAsync(query, parameters.ToArray());
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Une erreur est survenue. Veuillez réessayer.");
                return View(ivm);
            }

            return RedirectToAction("Connexion", "Utilisateurs");
        }

        [HttpGet]
        public async Task<IActionResult> Connexion()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Connexion(ConnexionViewModel cvm)
        {
            string query = "EXEC Utilisateurs.USP_ConnecterUtilisateur @Pseudo, @MotDePasse";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName = "@Pseudo", Value = cvm.Pseudo},
                new SqlParameter{ParameterName = "@MotDePasse", Value = cvm.Mdp}
            };

            Utilisateur? utilisateur = (await _context.Utilisateurs.FromSqlRaw(query, parameters.ToArray()).ToListAsync()).FirstOrDefault();
            if (utilisateur == null)
            {
                ModelState.AddModelError("", "Nom d'utilisateur ou mot de passe invalide");
                return View(cvm);
            }

            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, utilisateur.UtilisateurId.ToString()),
                new Claim(ClaimTypes.Name, utilisateur.Pseudo)
            };

            ClaimsIdentity identite = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            ClaimsPrincipal principal = new ClaimsPrincipal(identite);
            await HttpContext.SignInAsync(principal);

            return RedirectToAction("Index", "Capsules");
        }

        [HttpGet]
        public async Task<IActionResult> Deconnexion()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Capsules");
        }
        
    }
}
