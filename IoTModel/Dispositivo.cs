namespace IoTModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Dispositivo")]
    public partial class Dispositivo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Dispositivo()
        {
            Historico = new HashSet<EstadoDispositivo>();
        }

        public int Id { get; set; }

        [Required(ErrorMessage ="Preencha o campo nome")]
        [StringLength(50, ErrorMessage = "Preencher dispositivo")]
        public string Nome { get; set; }

        public int Tipo { get; set; }

        public virtual AtuadorProgramavel AtuadorProgramavel { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EstadoDispositivo> Historico { get; set; }
    }
}
