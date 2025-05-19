using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetDeSession_2290726.Models;

[Keyless]
public partial class VwNbCapsulesDuBresilParCollection
{
    [Column("CollectionID")]
    public int CollectionId { get; set; }

    [StringLength(50)]
    public string Nom { get; set; } = null!;

    [Column("Nombre de capsules du Brésil")]
    public int? NombreDeCapsulesDuBrésil { get; set; }
}
