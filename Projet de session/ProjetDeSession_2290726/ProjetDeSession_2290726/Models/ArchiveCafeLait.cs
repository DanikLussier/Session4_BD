using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCafeLait", Schema = "Archives")]
public partial class ArchiveCafeLait
{
    [Key]
    [Column("ArchiveCafeLaitID")]
    public int ArchiveCafeLaitId { get; set; }

    [Column("CafeLaitID")]
    public int CafeLaitId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    public int GoutLait { get; set; }

    public int TextureCremeuse { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
