namespace IoTModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("EstadoDispositivo")]
    public partial class EstadoDispositivo
    {
        public int Id { get; set; }

        public DateTime Data { get; set; }

        public int Valor { get; set; }

        public int DispositivoId { get; set; }

        public virtual Dispositivo Dispositivo { get; set; }
    }
}
