package deportes.modelo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Federacion;

@Repository
public interface RepositorioEquipo extends JpaRepository<Equipo, Long> {

	Iterable<Equipo> findAllByFede(Federacion fede);



}
