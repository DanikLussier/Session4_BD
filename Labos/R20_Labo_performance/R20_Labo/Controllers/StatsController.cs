using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using R20_Labo.Data;
using R20_Labo.Models;
using R20_Labo.ViewModels;


namespace R20_Labo.Controllers
{
    public class StatsController : Controller
    {
        private readonly SussyKartContext _context;

        public StatsController(SussyKartContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        // Section 1 : Compléter ToutesParticipations (Obligatoire)
        async public Task<IActionResult> ToutesParticipations()
        {
            // Obtenir les participations grâce à une vue SQL mais n'obtenez que les 30 premières participations
            List<VwToutesLesParticipation> participations = await _context.ParticipationCourses.Take(30).Select(p => new VwToutesLesParticipation
            {
                UtilisateurId = p.UtilisateurId,
                Pseudo = p.Utilisateur.Pseudo,
                CourseId = p.CourseId,
                Nom = p.Course.Nom,
                NbJoueurs = p.NbJoueurs,
                Position = p.Position,
                Chrono = p.Chrono,
                DateParticipation = p.DateParticipation
            }).ToListAsync();

            FiltreParticipationVM data = new FiltreParticipationVM
            {
                VWParticipations = participations
            };

            return View(data);
        }

        async public Task<IActionResult> ToutesParticipationsFiltre(FiltreParticipationVM fpvm)
        {
            // Obtenir TOUTES les participations grâce à une vue SQL (et on va filtrer ensuite)

            List<VwToutesLesParticipation> participations = await _context.ParticipationCourses.Select(p => new VwToutesLesParticipation
            {
                UtilisateurId = p.UtilisateurId,
                Pseudo = p.Utilisateur.Pseudo,
                CourseId = p.CourseId,
                Nom = p.Course.Nom,
                NbJoueurs = p.NbJoueurs,
                Position = p.Position,
                Chrono = p.Chrono,
                DateParticipation = p.DateParticipation
            }).ToListAsync();

            if (fpvm.Pseudo != null)
            {
                participations = participations.Where(p => p.Pseudo == fpvm.Pseudo).ToList();
            }

            if (fpvm.Course != "Toutes")
            {
                participations = participations.Where(p => p.Nom == fpvm.Course).ToList();
            }

            // Trier soit par date, soit par chrono (fpvm.Ordre) de manière croissante ou décroissante (fpvm.TypeOrdre)
            if (fpvm.TypeOrdre == "DESC")
            {
                if (fpvm.Ordre == "Date")
                {
                    participations = participations.OrderByDescending(p => p.DateParticipation).ToList();
                }
                else if (fpvm.Ordre == "Chrono")
                {
                    participations = participations.OrderByDescending(p => p.Chrono).ToList();
                }
            } else
            {
                if (fpvm.Ordre == "Date")
                {
                    participations = participations.OrderBy(p => p.DateParticipation).ToList();
                }
                else if (fpvm.Ordre == "Chrono")
                {
                    participations = participations.OrderBy(p => p.Chrono).ToList();
                }
            }

            // Sauter des paquets de 30 participations si la page est supérieure à 1
            participations = participations.Skip((fpvm.Page - 1)*30).Take(30).ToList();

            fpvm.VWParticipations = participations;

            return View("ToutesParticipations", fpvm);
        }


    }
}

