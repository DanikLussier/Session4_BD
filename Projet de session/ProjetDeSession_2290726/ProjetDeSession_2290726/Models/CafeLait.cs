using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("CafeLait", Schema = "ProprieteCapsule")]
[Index("CapsuleId", Name = "UC_CafeLait_CapsuleID", IsUnique = true)]
public partial class CafeLait
{
    [Key]
    [Column("CafeLaitID")]
    public int CafeLaitId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    public int GoutLait { get; set; }

    public int TextureCremeuse { get; set; }

    [ForeignKey("CapsuleId")]
    [InverseProperty("CafeLait")]
    public virtual Capsule Capsule { get; set; } = null!;
}
