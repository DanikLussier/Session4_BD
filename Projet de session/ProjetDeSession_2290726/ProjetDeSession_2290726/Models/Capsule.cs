using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("Capsule", Schema = "CapsuleNespresso")]
[Index("Nom", Name = "UC_Capsule_Nom", IsUnique = true)]
public partial class Capsule
{
    [Key]
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

    [InverseProperty("Capsule")]
    public virtual CafeLait? CafeLait { get; set; }

    [InverseProperty("Capsule")]
    public virtual CafeNoir? CafeNoir { get; set; }

    [InverseProperty("Capsule")]
    public virtual ICollection<CapsulePay> CapsulePays { get; set; } = new List<CapsulePay>();

    [InverseProperty("Capsule")]
    public virtual ICollection<CapsuleTypeCafe> CapsuleTypeCaves { get; set; } = new List<CapsuleTypeCafe>();

    [ForeignKey("CollectionId")]
    [InverseProperty("Capsules")]
    public virtual Collection Collection { get; set; } = null!;
}
