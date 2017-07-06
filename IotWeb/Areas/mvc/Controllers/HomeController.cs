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
            var listaTipo = new SelectList(new[]
            {
                new {Id = -1, Name = "Selecione..."},
                new {Id = 0, Name = "Sensor"},
                new {Id = 1, Name = "Atuador"}
            }, "Id", "Name", -1);
            ViewBag.Tipo = listaTipo;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult IncluirDispositivo(Dispositivo dispositivo)
        {

            if(dispositivo.Nome == null)
                {
                    return View(dispositivo);
                }
                
            dispositivoService.incluir(dispositivo);
            ViewBag.Sucesso = "Dispositivo salvo com sucesso";
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
            ViewBag.Sucesso = "Dispositivo ALTERADO com sucesso";
            return View("DetalheDispositivo", dispositivo);
        }
    }
}