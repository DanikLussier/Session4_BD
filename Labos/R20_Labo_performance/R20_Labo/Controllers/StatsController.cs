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
        public async Task<IActionResult> ToutesParticipations()
        {
            // Obtenir les participations grâce à une vue SQL mais n'obtenez que les 30 premières participations
            List<VwToutesLesParticipation> participations = await _context.VwToutesLesParticipations.Take(30).ToListAsync();
            

            FiltreParticipationVM data = new FiltreParticipationVM
            {
                VWParticipations = participations
            };

            return View(data);
        }

        async public Task<IActionResult> ToutesParticipationsFiltre(FiltreParticipationVM fpvm)
        {
            // Obtenir TOUTES les participations grâce à une vue SQL (et on va filtrer ensuite)

            IQueryable<VwToutesLesParticipation> participations = _context.VwToutesLesParticipations.AsQueryable();

            if (fpvm.Pseudo != null)
            {
                participations = participations.Where(p => p.Pseudo == fpvm.Pseudo);
            }

            if (fpvm.Course != "Toutes")
            {
                participations = participations.Where(p => p.Nom == fpvm.Course);
            }

            // Trier soit par date, soit par chrono (fpvm.Ordre) de manière croissante ou décroissante (fpvm.TypeOrdre)
            if (fpvm.TypeOrdre == "DESC")
            {
                if (fpvm.Ordre == "Date")
                {
                    participations = participations.OrderByDescending(p => p.DateParticipation);
                }
                else if (fpvm.Ordre == "Chrono")
                {
                    participations = participations.OrderByDescending(p => p.Chrono);
                }
            } else
            {
                if (fpvm.Ordre == "Date")
                {
                    participations = participations.OrderBy(p => p.DateParticipation);
                }
                else if (fpvm.Ordre == "Chrono")
                {
                    participations = participations.OrderBy(p => p.Chrono);
                }
            }

            // Sauter des paquets de 30 participations si la page est supérieure à 1
            participations = participations.Skip((fpvm.Page - 1)*30).Take(30);

            fpvm.VWParticipations = await participations.ToListAsync();

            return View("ToutesParticipations", fpvm);
        }


    }
}

