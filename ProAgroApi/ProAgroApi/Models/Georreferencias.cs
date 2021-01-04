using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProAgroApi.Models
{
    [Table("Georreferencias")]
    public class Georreferencias
    {
        [Key]
        public int idGeorreferencia { get; set; }
        public int idEstado { get; set; }
        public double Latitud { get; set; }
        public double Longitud { get; set; }

        [ForeignKey("idEstado")]
        public virtual Estados Estados { get; set; }
    }
}
