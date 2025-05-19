using Microsoft.AspNetCore.Mvc;
using ProjetDeSession_2290726.Data;

namespace ProjetDeSession_2290726.Controllers
{
    public class UtilisateursController : Controller
    {
        readonly NespressoContext _context;
        public UtilisateursController(NespressoContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
