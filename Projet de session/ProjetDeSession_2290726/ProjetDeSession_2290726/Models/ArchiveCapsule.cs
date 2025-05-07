using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCapsule", Schema = "Archives")]
public partial class ArchiveCapsule
{
    [Key]
    [Column("ArchiveCapsuleID")]
    public int ArchiveCapsuleId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    [StringLength(300)]
    public string DescriptionCourte { get; set; } = null!;

    [StringLength(1500)]
    public string DescriptionLongue { get; set; } = null!;

    [StringLength(1000)]
    public string DescriptionGout { get; set; } = null!;

    [StringLength(1000)]
    public string? DescriptionTorrefaction { get; set; }

    public int? Amertume { get; set; }

    [Column(TypeName = "numeric(4, 2)")]
    public decimal PrixUnite { get; set; }

    [Column("CollectionID")]
    public int CollectionId { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
