namespace IoTDAL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using IoTModel;

    public partial class IoTDataModel : DbContext
    {
        public IoTDataModel()
            : base("name=IoTDB")
        {
        }

        public virtual DbSet<AtuadorProgramavel> AtuadorProgramavel { get; set; }
        public virtual DbSet<Dispositivo> Dispositivo { get; set; }
        public virtual DbSet<EstadoDispositivo> EstadoDispositivo { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Dispositivo>()
                .HasOptional(e => e.AtuadorProgramavel)
                .WithRequired(e => e.Dispositivo);

            modelBuilder.Entity<Dispositivo>()
                .HasMany(e => e.Historico)
                .WithRequired(e => e.Dispositivo)
                .WillCascadeOnDelete(false);
        }
    }
}
