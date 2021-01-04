using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProAgroApi.Models
{
    [Table("Permisos")]
    public class Permisos
    {
        [Key]
        public int idPermiso { get; set; }
        public int idEstado { get; set; }
        public int idUsuario { get; set; }

        [ForeignKey("idEstado")]
        public virtual Estados Estados { get; set; }

        [ForeignKey("idUsuario")]
        public virtual Usuario Usuario { get; set; }

    }

}
