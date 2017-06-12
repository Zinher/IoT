using System.Collections.Generic;
using IoTModel;
using System.Linq;
using System.Data.Entity;

namespace IoTDAL
{
    public class DispositivoDAO
    {
        //static internal List<Dispositivo> dispositivos = new List<Dispositivo>();

        public int incluir(Dispositivo dispositivo)
        {
            using (var db = new IoTDataModel())
            {
                db.Dispositivo.Add(dispositivo);
                db.SaveChanges();
                return dispositivo.Id;
            }
        }
        public void alterarNome(int idDispositivo, string nome)
        {
            using (var db = new IoTDataModel())
            {
                Dispositivo dispositivo = new Dispositivo();
                dispositivo.Id = idDispositivo;
                dispositivo.Nome = nome;
                db.Dispositivo.Attach(dispositivo);
                var entry = db.Entry(dispositivo);

                entry.Property(e => e.Nome).IsModified = true;
                db.SaveChanges();             
            }
        }
        /* Obtém um dispositivo dado o id.
         */
        public Dispositivo obter(int id)
        {
            using (var db = new IoTDataModel())
            {
                // obtém os dispositivos ...
                Dispositivo dispositivo = db.Dispositivo
                // ... onde o dispositivo.Id == id
                    .Where(d => d.Id == id)
                // incluindo o relacionamento AtuadorProgramavel (veja Dispositivo.cs)
                    .Include(dd => dd.AtuadorProgramavel)
                // retornando o primeiro encontrado (como a busca é pelo Id então só retorna 1)
                    .FirstOrDefault<Dispositivo>();
                return dispositivo;
            }
        }

        public List<Dispositivo> obterTodos()
        {
            using (var db = new IoTDataModel())
            {
                return db.Dispositivo.ToList();
            }
        }

        public List<Dispositivo> obterSensores()
        {
            using (var db = new IoTDataModel())
            {
                List<Dispositivo> sensores = (from d in db.Dispositivo
                                              where d.Tipo == 0
                                              orderby d.Nome ascending
                                              select d).ToList();
                return sensores;
            }
        }

        //Código antigo do professor percorrendo a lista
        //List<Dispositivo> sensores = new List<Dispositivo>();
        /*foreach (Dispositivo dispositivo in dispositivos)
        {
            if (dispositivo.Tipo == 0)
            {
                sensores.Add(dispositivo);
            }
        }
        return sensores;
    }*/

        public List<Dispositivo> obterAtuadores()
        {
            /*Código do professor carregando da lista.*/
            /*List<Dispositivo> atuadores = new List<Dispositivo>();
            foreach (Dispositivo dispositivo in dispositivos)
            {
                if (dispositivo.Tipo == 1)
                {
                    atuadores.Add(dispositivo);
                }
            }
            return atuadores;*/

            using (var db = new IoTDataModel())
            {
                List<Dispositivo> atuadores = (from d in db.Dispositivo
                                               where d.Tipo == 1
                                               orderby d.Nome ascending
                                               select d).ToList();
                return atuadores;
            }
        }

        public void alterarPrograma(int idDispositivo, int? ligar, int? desligar)
        {
            using (var dbCtx = new IoTDataModel())
            {
                AtuadorProgramavel atuadorProgramavel = new AtuadorProgramavel();
                atuadorProgramavel.Id = idDispositivo;
                atuadorProgramavel.Ligar = ligar;
                atuadorProgramavel.Desligar = desligar;
                if (dbCtx.AtuadorProgramavel.Any(e => e.Id == idDispositivo))
                {
                    dbCtx.AtuadorProgramavel.Attach(atuadorProgramavel);
                    dbCtx.Entry(atuadorProgramavel).State = EntityState.Modified;
                }
                else
                {
                    dbCtx.AtuadorProgramavel.Add(atuadorProgramavel);
                }
                dbCtx.SaveChanges();
            }
        }
    }
}

