using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models;

[Keyless]
[Table("CarteBancaireEnClair", Schema = "Clients")]
public partial class CarteBancaireEnClair
{
    [StringLength(16)]
    public string Numero { get; set; } = null!;

    [StringLength(5)]
    public string Echeance { get; set; } = null!;
}
