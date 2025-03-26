using System;
using System.Collections.Generic;
using ArtistesEmploye.Models;
using Microsoft.EntityFrameworkCore;

namespace ArtistesEmploye.Data;

public partial class ArtistesContext : DbContext
{
    public ArtistesContext()
    {
    }

    public ArtistesContext(DbContextOptions<ArtistesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Artiste> Artistes { get; set; }

    public virtual DbSet<Employe> Employes { get; set; }

    public virtual DbSet<VwListeArtiste> VwListeArtistes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=BDArtistes");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Artiste>(entity =>
        {
            entity.HasKey(e => e.ArtisteId).HasName("PK_Artiste_ArtisteID");

            entity.ToTable("Artiste", "Employes", tb => tb.HasTrigger("TR_dSupprArtiste"));

            entity.HasOne(d => d.Employe).WithMany(p => p.Artistes)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Artiste_EmployeID");
        });

        modelBuilder.Entity<Employe>(entity =>
        {
            entity.HasKey(e => e.EmployeId).HasName("PK_Employe_EmployeID");

            entity.Property(e => e.NoTel).IsFixedLength();
        });

        modelBuilder.Entity<VwListeArtiste>(entity =>
        {
            entity.ToView("VW_ListeArtistes", "Employes");

            entity.Property(e => e.NoTel).IsFixedLength();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
