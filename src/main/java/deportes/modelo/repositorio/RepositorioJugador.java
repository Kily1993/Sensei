package deportes.modelo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Jugador;

@Repository
public interface RepositorioJugador extends JpaRepository<Jugador, Long> {

	Iterable<Jugador> findAllByEqui(Equipo equi);

	Jugador findFirstByEquiOrderByGolesDesc(Equipo equi);



}
