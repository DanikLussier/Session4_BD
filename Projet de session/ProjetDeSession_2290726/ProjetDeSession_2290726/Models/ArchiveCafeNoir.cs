using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCafeNoir", Schema = "Archives")]
public partial class ArchiveCafeNoir
{
    [Key]
    [Column("ArchiveCafeNoirID")]
    public int ArchiveCafeNoirId { get; set; }

    [Column("CafeNoirID")]
    public int CafeNoirId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    public int Intensite { get; set; }

    public int Torrefaction { get; set; }

    public int Acidite { get; set; }

    public int Corps { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
