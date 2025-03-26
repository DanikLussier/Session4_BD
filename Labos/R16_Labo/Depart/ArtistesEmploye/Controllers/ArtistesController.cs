using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ArtistesEmploye.Data;
using ArtistesEmploye.Models;

namespace ArtistesEmploye.Controllers
{
    public class ArtistesController : Controller
    {
        private readonly ArtistesContext _context;

        public ArtistesController(ArtistesContext context)
        {
            _context = context;
        }

        //-----------------------------------------------------------------------------------------------

        public async Task<IActionResult> Query1()
        {
            // Données des employés embauchés en 2023 (Utilisez VwListeArtiste)
            IEnumerable<VwListeArtiste> artistes = await _context.VwListeArtistes.Where(a => a.DateEmbauche.Year == 2023).ToListAsync();

            // N'oubliez pas d'envoyer artistes à la vue Razor ! 
            return View(artistes);
        }

        public async Task<IActionResult> Query2()
        {
            // Données des employés avec la spécialité "modélisation 3D" (Utilisez VwListeArtiste)
            IEnumerable<VwListeArtiste> artistes = await _context.VwListeArtistes.Where(a => a.Specialite == "modélisation 3D").ToListAsync();

            return View(artistes);
        }

        public async Task<IActionResult> Query3()
        {
            // Prénom et nom de tous les employés, classés par prénom ascendant
            // Concaténez prénoms et noms (avec une espace au centre) pour simplement obtenir une liste de strings.
            IEnumerable<VwListeArtiste> artistes = await _context.VwListeArtistes.Where(a => a.Specialite == "modélisation 3D").ToListAsync();
            IEnumerable<string> noms = artistes.Select(a => a.Nom);

            return View(noms);
        }

        public async Task<IActionResult> Query4()
        {
            // Toutes les données des employés artistes (Sans VwListeArtiste)

            return View();
        }

        public async Task<IActionResult> Query5()
        {
            // Combien d'artistes par spécialité ?

            return View();
        }

        public async Task<IActionResult> Query6()
        {
            // Combien d'artistes par spécialité ?  En utilisant une vue.

            return View();
        }

        //-----------------------------------------------------------------------------------------------

        // GET: Artistes
        public async Task<IActionResult> Index()
        {
            var artistesContext = _context.Artistes.Include(a => a.Employe);
            return View(await artistesContext.ToListAsync());
        }

        // GET: Artistes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes
                .Include(a => a.Employe)
                .FirstOrDefaultAsync(m => m.ArtisteId == id);
            if (artiste == null)
            {
                return NotFound();
            }

            return View(artiste);
        }

        // GET: Artistes/Create
        public IActionResult Create()
        {
            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId");
            return View();
        }

        // POST: Artistes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ArtisteId,Specialite,EmployeId")] Artiste artiste)
        {
            if (ModelState.IsValid)
            {
                _context.Add(artiste);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId", artiste.EmployeId);
            return View(artiste);
        }

        // GET: Artistes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes.FindAsync(id);
            if (artiste == null)
            {
                return NotFound();
            }
            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId", artiste.EmployeId);
            return View(artiste);
        }

        // POST: Artistes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ArtisteId,Specialite,EmployeId")] Artiste artiste)
        {
            if (id != artiste.ArtisteId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(artiste);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ArtisteExists(artiste.ArtisteId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId", artiste.EmployeId);
            return View(artiste);
        }

        // GET: Artistes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes
                .Include(a => a.Employe)
                .FirstOrDefaultAsync(m => m.ArtisteId == id);
            if (artiste == null)
            {
                return NotFound();
            }

            return View(artiste);
        }

        // POST: Artistes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var artiste = await _context.Artistes.FindAsync(id);
            if (artiste != null)
            {
                _context.Artistes.Remove(artiste);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ArtisteExists(int id)
        {
            return _context.Artistes.Any(e => e.ArtisteId == id);
        }
    }
}
