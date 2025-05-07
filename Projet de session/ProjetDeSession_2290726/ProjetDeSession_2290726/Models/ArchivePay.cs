using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchivePays", Schema = "Archives")]
public partial class ArchivePay
{
    [Key]
    [Column("ArchivePaysID")]
    public int ArchivePaysId { get; set; }

    [Column("PaysID")]
    public int PaysId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    public int AnneeIntroductionCafe { get; set; }

    [StringLength(1000)]
    public string HistoireCafe { get; set; } = null!;

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
