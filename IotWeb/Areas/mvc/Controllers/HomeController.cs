using IoTModel;
using IoTBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IoTWeb.Areas.mvc.Controllers
{
    public class HomeController : Controller
    {
        static private DispositivoService dispositivoService = new DispositivoService();

        // GET: mvc/Home
        public ActionResult Index()
        {
            dispositivoService.obterTodos();
            return View(dispositivoService.obterTodos());
        }

        [HttpGet]
        public ActionResult DetalheDispositivo(int id)
        {
            Dispositivo dispositivo = dispositivoService.obter(id);
            return View(dispositivo);
        }

        [HttpGet]
        public ActionResult IncluirDispositivo()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IncluirDispositivo(Dispositivo dispositivo)
        {
            dispositivoService.incluir(dispositivo);
            return View("DetalheDispositivo", dispositivo);
        }

        [HttpGet]
        public ActionResult AlterarDispositivo(int id)
        {
            Dispositivo dispositivo = dispositivoService.obter(id);
            return View(dispositivo);
        }

        [HttpPost]
        public ActionResult AlterarDispositivo(Dispositivo dispositivo)
        {
            dispositivoService.alterarNome(dispositivo.Id, dispositivo.Nome);
            return View(dispositivo);
        }
    }
}