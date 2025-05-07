using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("Collection", Schema = "CapsuleNespresso")]
[Index("Nom", Name = "UC_Collection_Nom", IsUnique = true)]
public partial class Collection
{
    [Key]
    [Column("CollectionID")]
    public int CollectionId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    [StringLength(500)]
    public string Description { get; set; } = null!;

    [InverseProperty("Collection")]
    public virtual ICollection<Capsule> Capsules { get; set; } = new List<Capsule>();
}
