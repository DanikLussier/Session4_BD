using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("ArchiveCapsulePays", Schema = "Archives")]
public partial class ArchiveCapsulePay
{
    [Key]
    [Column("ArchiveCapsulePaysID")]
    public int ArchiveCapsulePaysId { get; set; }

    [Column("CapsulePaysID")]
    public int CapsulePaysId { get; set; }

    [Column("CapsuleID")]
    public int CapsuleId { get; set; }

    [Column("PaysID")]
    public int PaysId { get; set; }

    [Column("DateMAJ", TypeName = "datetime")]
    public DateTime DateMaj { get; set; }
}
