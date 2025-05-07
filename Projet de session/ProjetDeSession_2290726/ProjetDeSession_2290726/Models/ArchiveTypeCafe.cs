using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveTypeCafe", Schema = "Archives")]
public partial class ArchiveTypeCafe
{
    [Key]
    [Column("ArchiveTypeCafeID")]
    public int ArchiveTypeCafeId { get; set; }

    [Column("TypeCafeID")]
    public int TypeCafeId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    [StringLength(300)]
    public string Description { get; set; } = null!;

    [Column("QteML")]
    public int QteMl { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
