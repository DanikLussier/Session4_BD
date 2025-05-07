using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("CafeNoir", Schema = "ProprieteCapsule")]
[Index("CapsuleId", Name = "UC_CafeNoir_CapsuleID", IsUnique = true)]
public partial class CafeNoir
{
    [Key]
    [Column("CafeNoirID")]
    public int CafeNoirId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    public int Intensite { get; set; }

    public int Torrefaction { get; set; }

    public int Acidite { get; set; }

    public int Corps { get; set; }

    [ForeignKey("CapsuleId")]
    [InverseProperty("CafeNoir")]
    public virtual Capsule Capsule { get; set; } = null!;
}
