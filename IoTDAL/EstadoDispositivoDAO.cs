using IoTModel;
using System.Linq;

namespace IoTDAL
{
    public class EstadoDispositivoDAO
    {
        public int incluir(EstadoDispositivo estado)
        {
            using (var db = new IoTDataModel())
            {
                db.EstadoDispositivo.Add(estado);
                db.SaveChanges();
                return estado.Id;
            }
                
        }
        public EstadoDispositivo obterUltimo(int dispositivoId)
        {

            using (var db = new IoTDataModel())
            {
                EstadoDispositivo estadoDispositivo = db.EstadoDispositivo
                    .Where(ed => ed.DispositivoId == dispositivoId)
                    .OrderByDescending(id => id.DispositivoId).FirstOrDefault();
                return estadoDispositivo;
            }

            /*if (dispositivoId <= DispositivoDAO.dispositivos.Count)
            {
                Dispositivo dispositivo = DispositivoDAO.dispositivos[dispositivoId - 1];
                int max = 0;
                EstadoDispositivo retorno = null;
                foreach (EstadoDispositivo estado in dispositivo.Historico)
                {
                    if (estado.Id > max)
                    {
                        max = estado.Id;
                        retorno = estado;
                    }
                }
                return retorno;
            }*/
        }
    }
}
