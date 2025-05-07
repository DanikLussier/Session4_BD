using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("CapsuleTypeCafe", Schema = "ProprieteCapsule")]
public partial class CapsuleTypeCafe
{
    [Key]
    [Column("CapsuleTypeCafeID")]
    public int CapsuleTypeCafeId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    [Column("TypeCafeID")]
    public int TypeCafeId { get; set; }

    [ForeignKey("CapsuleId")]
    [InverseProperty("CapsuleTypeCaves")]
    public virtual Capsule Capsule { get; set; } = null!;

    [ForeignKey("TypeCafeId")]
    [InverseProperty("CapsuleTypeCaves")]
    public virtual TypeCafe TypeCafe { get; set; } = null!;
}
