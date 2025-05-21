using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProjetDeSession_2290726.Data;
using ProjetDeSession_2290726.Models;
using ProjetDeSession_2290726.ViewModels;

namespace ProjetDeSession_2290726.Controllers
{
    public class CapsulesController : Controller
    {
        private readonly NespressoContext _context;

        public CapsulesController(NespressoContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> CreateImage()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AjouterImage(ImageUploadViewModel iuvm)
        {
            if (ModelState.IsValid)
            {
                Compagnie compagnie = new Compagnie
                {
                    Nom = iuvm.NomImage
                };

                await _context.Compagnies.AddAsync(compagnie);

                if (iuvm.FormFile != null && iuvm.FormFile.Length > 0)
                {
                    MemoryStream stream = new MemoryStream();
                    await iuvm.FormFile.CopyToAsync(stream);
                    byte[] fichierImage = stream.ToArray();
                    compagnie.Photo = fichierImage;
                }

                await _context.SaveChangesAsync();
                return View("IndexImages");
            }

            return View();
        }

        // GET: Images
        public async Task<IActionResult> IndexImages()
        {
            IndexImageViewModel iivm = new IndexImageViewModel();
            iivm.NomsCompagnies = await _context.Compagnies.Select(c => c.Nom).ToListAsync();
            iivm.PhotosCompagnies = await _context.Compagnies
                .Select(c => c.Photo == null ? null : $"data:image/png;base64, {Convert.ToBase64String(c.Photo)}")
                .ToListAsync();

            return View(iivm);
        }

        // GET: Vue
        public async Task<IActionResult> IndexVue()
        {
            return View(await _context.VwNbCapsulesDuBresilParCollections.ToListAsync());
        }

        // GET: Capsules
        public async Task<IActionResult> Index()
        {
            ViewData["utilisateur"] = "Visiteur";
            IIdentity? identite = HttpContext.User.Identity;
            if (identite != null && identite.IsAuthenticated)
            {
                string pseudo = HttpContext.User.FindFirstValue(ClaimTypes.Name);
                Utilisateur? utilisateur = await _context.Utilisateurs.FirstOrDefaultAsync(x => x.Pseudo == pseudo);
                if (utilisateur != null)
                {
                    ViewData["utilisateur"] = utilisateur.Pseudo;
                }
            }
            var nespressoContext = _context.Capsules.Include(c => c.Collection);

            FiltreCapsuleViewModel fcvm = new FiltreCapsuleViewModel
            {
                Capsules = await nespressoContext.ToListAsync()
            };

            return View(fcvm);
        }

        public async Task<IActionResult> IndexFiltre(FiltreCapsuleViewModel fcvm)
        {
            string query = "EXEC CapsuleNespresso.USP_FiltreCapsule @AmertumeMax, @AmertumeMin, @PrixUniteMax, @Nom";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName = "@AmertumeMax", Value = fcvm.AmertumeMax},
                new SqlParameter{ParameterName = "@AmertumeMin", Value = fcvm.AmertumeMin},
                new SqlParameter{ParameterName = "@PrixUniteMax", Value = fcvm.PrixUniteMax},
                new SqlParameter{ParameterName = "@Nom", Value = fcvm.Name == null ? "" : fcvm.Name}
            };

            fcvm.Capsules = await _context.Capsules.FromSqlRaw(query, parameters.ToArray()).ToListAsync();

            return View("Index", fcvm);
        }

        // GET: Capsules/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var capsule = await _context.Capsules
                .Include(c => c.Collection)
                .FirstOrDefaultAsync(m => m.CapsuleId == id);
            if (capsule == null)
            {
                return NotFound();
            }

            return View(capsule);
        }

        // GET: Capsules/Create
        public IActionResult Create()
        {
            ViewData["CollectionId"] = new SelectList(_context.Collections, "CollectionId", "CollectionId");
            return View();
        }

        // POST: Capsules/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CapsuleId,Nom,DescriptionCourte,DescriptionLongue,DescriptionGout,DescriptionTorrefaction,Amertume,PrixUnite,CollectionId")] Capsule capsule)
        {
            if (ModelState.IsValid)
            {
                _context.Add(capsule);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CollectionId"] = new SelectList(_context.Collections, "CollectionId", "CollectionId", capsule.CollectionId);
            return View(capsule);
        }

        // GET: Capsules/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var capsule = await _context.Capsules.FindAsync(id);
            if (capsule == null)
            {
                return NotFound();
            }
            ViewData["CollectionId"] = new SelectList(_context.Collections, "CollectionId", "CollectionId", capsule.CollectionId);
            return View(capsule);
        }

        // POST: Capsules/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CapsuleId,Nom,DescriptionCourte,DescriptionLongue,DescriptionGout,DescriptionTorrefaction,Amertume,PrixUnite,CollectionId")] Capsule capsule)
        {
            if (id != capsule.CapsuleId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(capsule);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CapsuleExists(capsule.CapsuleId))
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
            ViewData["CollectionId"] = new SelectList(_context.Collections, "CollectionId", "CollectionId", capsule.CollectionId);
            return View(capsule);
        }

        // GET: Capsules/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var capsule = await _context.Capsules
                .Include(c => c.Collection)
                .FirstOrDefaultAsync(m => m.CapsuleId == id);
            if (capsule == null)
            {
                return NotFound();
            }

            return View(capsule);
        }

        // POST: Capsules/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var capsule = await _context.Capsules.FindAsync(id);
            if (capsule != null)
            {
                _context.Capsules.Remove(capsule);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CapsuleExists(int id)
        {
            return _context.Capsules.Any(e => e.CapsuleId == id);
        }
    }
}
