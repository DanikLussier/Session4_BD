using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjetDeSession_2290726.Data;
using ProjetDeSession_2290726.Models;

namespace ProjetDeSession_2290726.Controllers
{
    public class CapsulesController : Controller
    {
        private readonly NespressoContext _context;

        public CapsulesController(NespressoContext context)
        {
            _context = context;
        }

        // GET: Vue
        public async Task<IActionResult> IndexVue()
        {
            return View(await _context.VwNbCapsulesDuBresilParCollections.ToListAsync());
        }

        // GET: Capsules
        public async Task<IActionResult> Index()
        {
            var nespressoContext = _context.Capsules.Include(c => c.Collection);
            return View(await nespressoContext.ToListAsync());
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
