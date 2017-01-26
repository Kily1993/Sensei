package deportes.modelo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import deportes.modelo.entidades.Equipo;

@Repository
public interface RepositorioEquipo extends JpaRepository<Equipo, Long> {

}
