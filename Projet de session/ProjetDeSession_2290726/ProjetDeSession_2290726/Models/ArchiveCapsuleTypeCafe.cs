using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCapsuleTypeCafe", Schema = "Archives")]
public partial class ArchiveCapsuleTypeCafe
{
    [Key]
    [Column("ArchiveCapsuleTypeCafeID")]
    public int ArchiveCapsuleTypeCafeId { get; set; }

    [Column("CapsuleTypeCafeID")]
    public int CapsuleTypeCafeId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    [Column("TypeCafeID")]
    public int TypeCafeId { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
