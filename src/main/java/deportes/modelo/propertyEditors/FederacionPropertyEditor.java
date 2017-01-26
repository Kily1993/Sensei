package deportes.modelo.propertyEditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import deportes.modelo.entidades.Federacion;
import deportes.modelo.repositorio.RepositorioFederacion;


@Component
public class FederacionPropertyEditor extends PropertyEditorSupport {
	
	@Autowired
	private RepositorioFederacion repof;
	
	
		@Override
		public void setAsText(String text) {
			long idFederacion = Long.parseLong(text);
			Federacion fede = repof.findOne(idFederacion);
			setValue(fede);
		}
	
}
