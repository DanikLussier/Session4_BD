using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models;

[Table("CarteBancaire", Schema = "Clients")]
public partial class CarteBancaire
{
    [Key]
    [Column("CarteBancaireID")]
    public int CarteBancaireId { get; set; }

    public byte[] Numero { get; set; } = null!;

    public byte[] Echeance { get; set; } = null!;

    [Column("ClientID")]
    public int ClientId { get; set; }

    [ForeignKey("ClientId")]
    [InverseProperty("CarteBancaires")]
    public virtual Client Client { get; set; } = null!;
}
