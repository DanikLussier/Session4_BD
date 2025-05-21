using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("Compagnie", Schema = "CapsuleNespresso")]
[Index("Identifiant", Name = "UC_Compagnie_Identifiant", IsUnique = true)]
public partial class Compagnie
{
    [Key]
    [Column("CompagnieID")]
    public int CompagnieId { get; set; }

    [StringLength(100)]
    public string Nom { get; set; } = null!;

    public Guid Identifiant { get; set; }

    public byte[]? Photo { get; set; }
}
