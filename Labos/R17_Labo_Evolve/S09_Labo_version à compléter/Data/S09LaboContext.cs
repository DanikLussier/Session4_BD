using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using S09_Labo.Models;

namespace S09_Labo.Data;

public partial class S09LaboContext : DbContext
{
    public S09LaboContext()
    {
    }

    public S09LaboContext(DbContextOptions<S09LaboContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Chanson> Chansons { get; set; }

    public virtual DbSet<Chanteur> Chanteurs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=S09_Labo");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Chanson>(entity =>
        {
            entity.HasKey(e => e.ChansonId).HasName("PK_Chanson_ChansonID");

            entity.HasOne(d => d.NomChanteurNavigation).WithMany(p => p.Chansons).HasConstraintName("FK_Chanson_NomChanteur");
        });

        modelBuilder.Entity<Chanteur>(entity =>
        {
            entity.HasKey(e => e.Nom).HasName("PK_Chanteur_Nom");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
