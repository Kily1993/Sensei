package deportes.modelo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import deportes.modelo.entidades.Federacion;

@Repository
public interface RepositorioFederacion extends JpaRepository<Federacion, Long> {

}
