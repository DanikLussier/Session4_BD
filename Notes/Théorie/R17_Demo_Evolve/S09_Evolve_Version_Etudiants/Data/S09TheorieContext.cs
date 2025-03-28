using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
//using S09_Evolve.Models;

namespace S09_Evolve.Data;

public partial class S09TheorieContext : DbContext
{
    public S09TheorieContext()
    {
    }

    public S09TheorieContext(DbContextOptions<S09TheorieContext> options)
        : base(options)
    {
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=S09_Evolve");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
