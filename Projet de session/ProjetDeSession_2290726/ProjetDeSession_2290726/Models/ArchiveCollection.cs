using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCollection", Schema = "Archives")]
public partial class ArchiveCollection
{
    [Key]
    [Column("ArchiveCollectionID")]
    public int ArchiveCollectionId { get; set; }

    [Column("CollectionID")]
    public int CollectionId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    [StringLength(500)]
    public string Description { get; set; } = null!;

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
