namespace IoTModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("AtuadorProgramavel")]
    public partial class AtuadorProgramavel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? Ligar { get; set; }

        public int? Desligar { get; set; }

        public virtual Dispositivo Dispositivo { get; set; }
    }
}
