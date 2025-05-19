using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Table("Utilisateur", Schema = "Utilisateurs")]
public partial class Utilisateur
{
    [Key]
    [Column("UtilisateurID")]
    public int UtilisateurId { get; set; }

    [StringLength(50)]
    public string Pseudo { get; set; } = null!;

    [MaxLength(32)]
    public byte[] MdpHache { get; set; } = null!;

    [MaxLength(16)]
    public byte[] MdpSel { get; set; } = null!;

    [StringLength(200)]
    public string Pensee { get; set; } = null!;
}
