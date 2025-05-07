using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("CapsulePays", Schema = "ProprieteCapsule")]
public partial class CapsulePay
{
    [Key]
    [Column("CapsulePaysID")]
    public int CapsulePaysId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    [Column("PaysID")]
    public int PaysId { get; set; }

    [ForeignKey("CapsuleId")]
    [InverseProperty("CapsulePays")]
    public virtual Capsule Capsule { get; set; } = null!;

    [ForeignKey("PaysId")]
    [InverseProperty("CapsulePays")]
    public virtual Pay Pays { get; set; } = null!;
}
