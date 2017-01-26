package deportes.modelo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import deportes.modelo.entidades.Jugador;

@Repository
public interface RepositorioJugador extends JpaRepository<Jugador, Long> {

}
