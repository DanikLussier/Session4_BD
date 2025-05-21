using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Security.Principal;
using WrapUpBilleterie.Data;
using WrapUpBilleterie.ViewModels;
using WrapUpBilleterie.Models;

namespace WrapUpBilleterie.Controllers
{
    public class ClientsController : Controller
    {
        readonly R22_BilleterieContext _context;
        public ClientsController(R22_BilleterieContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            ViewData["PrenomNom"] = "visiteur";
            IIdentity? identite = HttpContext.User.Identity;
            if (identite != null && identite.IsAuthenticated)
            {
                string courriel = HttpContext.User.FindFirstValue(ClaimTypes.Name);
                Client? client = await _context.Clients.FirstOrDefaultAsync(x => x.Courriel == courriel);
                if (client != null)
                {
                    // Pour dire "Bonjour X" sur l'index
                    ViewData["PrenomNom"] = client.Prenom + " " + client.Nom;
                }
            }
            return View();
        }

        // Inscription en requête get
        public IActionResult Inscription()
        {
            return View();
        }

        // Inscription en requête post
        [HttpPost]
        public async Task<IActionResult> Inscription(InscriptionViewModel ivm)
        {
            bool existeDeja = await _context.Clients.AnyAsync(x => x.Courriel == ivm.Courriel);

            if (existeDeja)
            {
                ModelState.AddModelError("Courriel", "Le courriel est déjà pris.");
                return View(ivm);
            }

            // On INSERT l'utilisateur avec une procédure stockée qui va s'occuper de
            // hacher le mot de passe, chiffrer la couleur ...
            string query = "EXEC Clients.USP_CreerClient @Nom, @Prenom, @Courriel, @MotDePasse";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName = "@Nom", Value = ivm.Nom},
                new SqlParameter{ParameterName = "@Prenom", Value = ivm.Prenom},
                new SqlParameter{ParameterName = "@Courriel", Value = ivm.Courriel},
                new SqlParameter{ParameterName = "@MotDePasse", Value = ivm.MotDePasse}
            };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(query, parameters.ToArray());
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Une erreur est survenue. Veuillez réessayez.");
                return View(ivm);
            }

            return RedirectToAction("Index", "Spectacles");
        }

        public IActionResult Connexion()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Connexion(ConnexionViewModel cvm)
        {
            // Procédure stockée qui compare le mot de passe fourni à celui dans la BD
            // Retourne juste l'utilisateur si le mot de passe est valide
            string query = "EXEC Clients.USP_AuthClient @Courriel, @MotDePasse";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName = "@Courriel", Value = cvm.Courriel},
                new SqlParameter{ParameterName = "@MotDePasse", Value = cvm.MotDePasse}
            };
            Client? client = (await _context.Clients.FromSqlRaw(query, parameters.ToArray()).ToListAsync()).FirstOrDefault();
            if (client == null)
            {
                ModelState.AddModelError("", "Nom d'utilisateur ou mot de passe invalide");
                return View(cvm);
            }

            // Construction du cookie d'authentification 
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, client.ClientId.ToString()),
                new Claim(ClaimTypes.Name, client.Courriel)
            };

            ClaimsIdentity identite = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            ClaimsPrincipal principal = new ClaimsPrincipal(identite);

            // Cette ligne fournit le cookie à l'utilisateur
            await HttpContext.SignInAsync(principal);

            return RedirectToAction("Index", "Spectacles");
        }

        [HttpGet]
        public async Task<IActionResult> Deconnexion()
        {
            // Cette ligne mange le cookie 🍪 Slurp
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Spectacles");
        }

        // GET: Clients/Profil/5
        [Authorize]
        public async Task<IActionResult> Profil()
        {
            IIdentity? identite = HttpContext.User.Identity;
            if (identite != null && identite.IsAuthenticated)
            {
                string courriel = HttpContext.User.FindFirstValue(ClaimTypes.Name);
                Client? client = await _context.Clients.FirstOrDefaultAsync(x => x.Courriel == courriel);
                if (client != null)
                {
                    // Récupérer les cartes bancaires
                    string query = "EXEC Clients.USP_RecupererCarteBancaire @ClientID";
                    List<SqlParameter> parameters = new List<SqlParameter>
                    {
                        new SqlParameter{ParameterName = "@ClientID", Value = client.ClientId}
                    };

                    List<CarteBancaireEnClair> cartes = await _context.CarteBancaireEnClairs.FromSqlRaw(query, parameters.ToArray()).ToListAsync();

                    // Construire le ViewModel
                    ProfilClientViewModel vm = new ProfilClientViewModel()
                    {
                        Client = client,
                        Cartes = cartes
                    };

                    // Envoyez la vue
                    return View(vm);
                }
            }

            return View("Index", "Spectacles");
        }

    }
}
