using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProAgroApi.Models
{
    [Table("Estados")]
    public class Estados
    {
        [Key]
        public int idEstado { get; set; }
        public string Estado { get; set; }
        public string Abreviatura { get; set; }
    }
}
