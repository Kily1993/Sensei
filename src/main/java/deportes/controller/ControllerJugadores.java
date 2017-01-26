package deportes.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Jugador;
import deportes.modelo.propertyEditors.EquipoPropertyEditor;
import deportes.modelo.repositorio.RepositorioEquipo;
import deportes.modelo.repositorio.RepositorioJugador;

@Controller
@RequestMapping("/jugadores")
public class ControllerJugadores {
	
	
	@Autowired
	private RepositorioJugador repojug;
	@Autowired
	private RepositorioEquipo repoeq;
	@Autowired
	private EquipoPropertyEditor eqpro;
	

	@RequestMapping(method = RequestMethod.GET)
	public String listJugar(Model model){
		
		model.addAttribute("jugadores", repojug.findAll() );
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/jugadores";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String contjug(Model model, @Valid @ModelAttribute Jugador jug, BindingResult bindingResult) {
		repojug.save(jug);

		model.addAttribute("jugadores", repojug.findAll() );
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/jugadores";
	}
	
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> borrar(@PathVariable Long id){
		try{
		repojug.delete(id);
		return new ResponseEntity<String>(HttpStatus.OK);
		}
		catch(Exception e){
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Equipo.class, eqpro);
	}
	
	
}
