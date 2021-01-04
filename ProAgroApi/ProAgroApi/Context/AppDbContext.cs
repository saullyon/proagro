using Microsoft.EntityFrameworkCore;
using ProAgroApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProAgroApi.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

        public DbSet<Permisos> Permisos { get; set; }
        public DbSet<Estados> Estados { get; set; }
        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Georreferencias> Georreferencias { get; set; }
    }
}
