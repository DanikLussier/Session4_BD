using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using ProjetDeSession_2290726.Models;

namespace ProjetDeSession_2290726.Data;

public partial class NespressoContext : DbContext
{
    public NespressoContext()
    {
    }

    public NespressoContext(DbContextOptions<NespressoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ArchiveCafeLait> ArchiveCafeLaits { get; set; }

    public virtual DbSet<ArchiveCafeNoir> ArchiveCafeNoirs { get; set; }

    public virtual DbSet<ArchiveCapsule> ArchiveCapsules { get; set; }

    public virtual DbSet<ArchiveCapsulePay> ArchiveCapsulePays { get; set; }

    public virtual DbSet<ArchiveCapsuleTypeCafe> ArchiveCapsuleTypeCaves { get; set; }

    public virtual DbSet<ArchiveCollection> ArchiveCollections { get; set; }

    public virtual DbSet<ArchivePay> ArchivePays { get; set; }

    public virtual DbSet<ArchiveTypeCafe> ArchiveTypeCaves { get; set; }

    public virtual DbSet<CafeLait> CafeLaits { get; set; }

    public virtual DbSet<CafeNoir> CafeNoirs { get; set; }

    public virtual DbSet<Capsule> Capsules { get; set; }

    public virtual DbSet<CapsulePay> CapsulePays { get; set; }

    public virtual DbSet<CapsuleTypeCafe> CapsuleTypeCaves { get; set; }

    public virtual DbSet<Changelog> Changelogs { get; set; }

    public virtual DbSet<Collection> Collections { get; set; }

    public virtual DbSet<Pay> Pays { get; set; }

    public virtual DbSet<TypeCafe> TypeCaves { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=Nespresso");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ArchiveCafeLait>(entity =>
        {
            entity.HasKey(e => e.ArchiveCafeLaitId).HasName("PK_ArchiveCafeLait_ArchiveCafeLaitID");
        });

        modelBuilder.Entity<ArchiveCafeNoir>(entity =>
        {
            entity.HasKey(e => e.ArchiveCafeNoirId).HasName("PK_ArchiveCafeNoir_ArchiveCafeNoirID");
        });

        modelBuilder.Entity<ArchiveCapsule>(entity =>
        {
            entity.HasKey(e => e.ArchiveCapsuleId).HasName("PK_ArchiveCapsule_ArchiveCapsuleID");
        });

        modelBuilder.Entity<ArchiveCapsulePay>(entity =>
        {
            entity.HasKey(e => e.ArchiveCapsulePaysId).HasName("PK_ArchiveCapsulePays_ArchiveCapsulePaysID");
        });

        modelBuilder.Entity<ArchiveCapsuleTypeCafe>(entity =>
        {
            entity.HasKey(e => e.ArchiveCapsuleTypeCafeId).HasName("PK_ArchiveCapsuleTypeCafe_ArchiveCapsuleTypeCafeID");
        });

        modelBuilder.Entity<ArchiveCollection>(entity =>
        {
            entity.HasKey(e => e.ArchiveCollectionId).HasName("PK_ArchiveCollection_ArchiveCollectionID");
        });

        modelBuilder.Entity<ArchivePay>(entity =>
        {
            entity.HasKey(e => e.ArchivePaysId).HasName("PK_ArchivePays_ArchivePaysID");
        });

        modelBuilder.Entity<ArchiveTypeCafe>(entity =>
        {
            entity.HasKey(e => e.ArchiveTypeCafeId).HasName("PK_ArchiveTypeCafe_ArchiveTypeCafeID");
        });

        modelBuilder.Entity<CafeLait>(entity =>
        {
            entity.HasKey(e => e.CafeLaitId).HasName("PK_CafeLait_CafeLaitID");

            entity.HasOne(d => d.Capsule).WithOne(p => p.CafeLait).HasConstraintName("FK_CafeLait_CapsuleID");
        });

        modelBuilder.Entity<CafeNoir>(entity =>
        {
            entity.HasKey(e => e.CafeNoirId).HasName("PK_CafeNoir_CafeNoirID");

            entity.HasOne(d => d.Capsule).WithOne(p => p.CafeNoir).HasConstraintName("FK_CafeNoir_CapsuleID");
        });

        modelBuilder.Entity<Capsule>(entity =>
        {
            entity.HasKey(e => e.CapsuleId).HasName("PK_Capsule_CapsuleID");

            entity.Property(e => e.PrixUnite).HasDefaultValueSql("((0.97))");

            entity.HasOne(d => d.Collection).WithMany(p => p.Capsules).HasConstraintName("FK_Capsule_CollectionID");
        });

        modelBuilder.Entity<CapsulePay>(entity =>
        {
            entity.HasKey(e => e.CapsulePaysId).HasName("PK_CapsulePays_CapsulePaysID");

            entity.HasOne(d => d.Capsule).WithMany(p => p.CapsulePays).HasConstraintName("FK_CapsulePays_CapsuleID");

            entity.HasOne(d => d.Pays).WithMany(p => p.CapsulePays).HasConstraintName("FK_CapsulePays_PaysID");
        });

        modelBuilder.Entity<CapsuleTypeCafe>(entity =>
        {
            entity.HasKey(e => e.CapsuleTypeCafeId).HasName("PK_CapsuleTypeCafe_CapsuleTypeCafeID");

            entity.HasOne(d => d.Capsule).WithMany(p => p.CapsuleTypeCaves).HasConstraintName("FK_CapsuleTypeCafe_CapsuleID");

            entity.HasOne(d => d.TypeCafe).WithMany(p => p.CapsuleTypeCaves).HasConstraintName("FK_CapsuleTypeCafe_TypeCafeID");
        });

        modelBuilder.Entity<Changelog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__changelo__3213E83FDE8FE6E5");

            entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
        });

        modelBuilder.Entity<Collection>(entity =>
        {
            entity.HasKey(e => e.CollectionId).HasName("PK_Collection_CollectionID");
        });

        modelBuilder.Entity<Pay>(entity =>
        {
            entity.HasKey(e => e.PaysId).HasName("PK_Pays_PaysID");
        });

        modelBuilder.Entity<TypeCafe>(entity =>
        {
            entity.HasKey(e => e.TypeCafeId).HasName("PK_TypeCafe_TypeCafeID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
