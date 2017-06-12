using System.Collections.Generic;

using IoTDAL;
using IoTModel;

namespace IoTBLL
{
    public class DispositivoService
    {
        static private DispositivoDAO dispositivoDAO = new DispositivoDAO();
        static private EstadoDispositivoDAO estadoDispositivoDAO = new EstadoDispositivoDAO();
        static private AtuadorProgramavel atuadorProgramavelDAO = new AtuadorProgramavel();

        public int incluir(Dispositivo dispositivo) { return dispositivoDAO.incluir(dispositivo); }
        public void alterarNome(int idDispositivo, string nome) { dispositivoDAO.alterarNome(idDispositivo, nome); }
        public Dispositivo obter(int id) { return dispositivoDAO.obter(id); }
        public List<Dispositivo> obterTodos() { return dispositivoDAO.obterTodos(); }
        public int alterarEstado(EstadoDispositivo estado) { return estadoDispositivoDAO.incluir(estado); }
        public EstadoDispositivo ultimoEstado(int dispositivoId) { return estadoDispositivoDAO.obterUltimo(dispositivoId); }
        public List<Dispositivo> obterAtuadores() { return dispositivoDAO.obterAtuadores(); }
        public List<Dispositivo> obterSensores() { return dispositivoDAO.obterSensores(); }
        public void alterarPrograma (int idDipositivo, int? ligar, int? desligar) { dispositivoDAO.alterarPrograma(idDipositivo, ligar, desligar); }
    }
}
