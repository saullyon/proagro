using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProAgroApi.Context;
using ProAgroApi.Models;

namespace ProAgroApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeorreferenciasController : ControllerBase
    {
        private readonly AppDbContext _context;

        public GeorreferenciasController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Georreferencias
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Georreferencias>>> GetGeorreferencias()
        {
            return await _context.Georreferencias.Include(e => e.Estados).ToListAsync();
        }

        // GET: api/Georreferencias/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Georreferencias>> GetGeorreferencias(int id)
        {
            var georreferencias = await _context.Georreferencias.FindAsync(id);

            if (georreferencias == null)
            {
                return NotFound();
            }

            return georreferencias;
        }

        // PUT: api/Georreferencias/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutGeorreferencias(int id, Georreferencias georreferencias)
        {
            if (id != georreferencias.idGeorreferencia)
            {
                return BadRequest();
            }

            _context.Entry(georreferencias).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GeorreferenciasExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Georreferencias
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Georreferencias>> PostGeorreferencias(Georreferencias georreferencias)
        {
            _context.Georreferencias.Add(georreferencias);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetGeorreferencias", new { id = georreferencias.idGeorreferencia }, georreferencias);
        }

        // DELETE: api/Georreferencias/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Georreferencias>> DeleteGeorreferencias(int id)
        {
            var georreferencias = await _context.Georreferencias.FindAsync(id);
            if (georreferencias == null)
            {
                return NotFound();
            }

            _context.Georreferencias.Remove(georreferencias);
            await _context.SaveChangesAsync();

            return georreferencias;
        }

        [HttpGet("{idEstado}/*")]
        public ActionResult<List<Georreferencias>> GetGeo(int idEstado)
        {
            var georreferencias = _context.Georreferencias.Include(e => e.Estados).Where(georreferencias => georreferencias.idEstado.Equals(idEstado)).ToList();

            if (georreferencias == null)
            {
                return NotFound();
            }

            return georreferencias;
        }
        private bool GeorreferenciasExists(int id)
        {
            return _context.Georreferencias.Any(e => e.idGeorreferencia == id);
        }
    }
}
