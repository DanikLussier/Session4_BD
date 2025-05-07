using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("Pays", Schema = "ProprieteCapsule")]
[Index("Nom", Name = "UC_Pays_Nom", IsUnique = true)]
public partial class Pay
{
    [Key]
    [Column("PaysID")]
    public int PaysId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    public int AnneeIntroductionCafe { get; set; }

    [StringLength(1000)]
    public string HistoireCafe { get; set; } = null!;

    [InverseProperty("Pays")]
    public virtual ICollection<CapsulePay> CapsulePays { get; set; } = new List<CapsulePay>();
}
