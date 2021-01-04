using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProAgroApi.Models
{
    [Table("Usuario")]
    public class Usuario
    {
        [Key]
        public int idUsuario { get; set; }
        public string Contrasenia { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaN_C { get; set; }
        public string RFC { get; set; }
    }
}
