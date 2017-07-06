using ClosedXML.Excel;
using ClosedXML.Extensions;
using IoTBLL;
using IoTModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IoTWeb.Areas.mvc.Controllers
{
    public class RelatorioDispositivosController : Controller
    {
        static private DispositivoService dispositivoService = new DispositivoService();
        // GET: mvc/RelatorioDispositivos
        public ActionResult Index()
        {
            List<Dispositivo> dispositivos = dispositivoService.obterTodos();
            XLWorkbook workbook = new XLWorkbook();

            IXLWorksheet wsSensor = workbook.Worksheets.Add("Sensor");
            wsSensor.Cell(1, 1).SetValue("ID");
            wsSensor.Cell(1, 2).SetValue("Nome");
            wsSensor.Cell(1, 3).SetValue("Tipo");

            IXLWorksheet wsAtuador = workbook.Worksheets.Add("Atuador");
            wsAtuador.Cell(1, 1).SetValue("ID");
            wsAtuador.Cell(1, 2).SetValue("Nome");
            wsAtuador.Cell(1, 3).SetValue("Tipo");

            int rowSensor = 2;
            int rowAtuador = 2;

            foreach(Dispositivo dispositivo in dispositivos)
            {
                if(dispositivo.Tipo == 0)
                {
                    wsSensor.Cell(rowSensor, 1).SetValue(dispositivo.Id);
                    wsSensor.Cell(rowSensor, 2).SetValue(dispositivo.Nome);
                    wsSensor.Cell(rowSensor, 3).SetValue("Sensor");
                    rowSensor++;
                }
                else if(dispositivo.Tipo == 1)
                {
                    wsAtuador.Cell(rowAtuador, 1).SetValue(dispositivo.Id);
                    wsAtuador.Cell(rowAtuador, 2).SetValue(dispositivo.Nome);
                    wsAtuador.Cell(rowAtuador, 3).SetValue("Atuador");
                    rowAtuador++;
                }
            }

            return workbook.Deliver("Dispositivos.xls");
        }
    }
}