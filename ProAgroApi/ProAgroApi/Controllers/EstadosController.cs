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
    public class EstadosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public EstadosController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Estados
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Estados>>> GetEstados()
        {
            return await _context.Estados.ToListAsync();
        }

        // GET: api/Estados/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Estados>> GetEstados(int id)
        {
            var estados = await _context.Estados.FindAsync(id);

            if (estados == null)
            {
                return NotFound();
            }

            return estados;
        }

        // PUT: api/Estados/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstados(int id, Estados estados)
        {
            if (id != estados.idEstado)
            {
                return BadRequest();
            }

            _context.Entry(estados).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstadosExists(id))
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

        // POST: api/Estados
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Estados>> PostEstados(Estados estados)
        {
            _context.Estados.Add(estados);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEstados", new { id = estados.idEstado }, estados);
        }

        // DELETE: api/Estados/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Estados>> DeleteEstados(int id)
        {
            var estados = await _context.Estados.FindAsync(id);
            if (estados == null)
            {
                return NotFound();
            }

            _context.Estados.Remove(estados);
            await _context.SaveChangesAsync();

            return estados;
        }

        [HttpGet("{idEstado}/{Estado}")]
        public ActionResult<List<Estados>> GetGeo(int idEstado, string Estado)
        {
            var estado = _context.Estados.Where(estado => estado.idEstado.Equals(idEstado) && estado.Estado.Equals(Estado)).ToList();

            if (estado == null)
            {
                return NotFound();
            }

            return estado;
        }
        private bool EstadosExists(int id)
        {
            return _context.Estados.Any(e => e.idEstado == id);
        }
    }
}
