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
import org.springframework.web.bind.annotation.ResponseBody;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Federacion;
import deportes.modelo.entidades.Jugador;
import deportes.modelo.propertyEditors.FederacionPropertyEditor;
import deportes.modelo.repositorio.RepositorioEquipo;
import deportes.modelo.repositorio.RepositorioFederacion;
import deportes.modelo.repositorio.RepositorioJugador;


@Controller
@RequestMapping("/equipos")
public class ControllerEquipos {
	
	@Autowired
	private RepositorioEquipo repoeq;
	@Autowired
	private RepositorioFederacion repofe;
	
	@Autowired
	private FederacionPropertyEditor fepro;
	@Autowired
	private RepositorioJugador repojug;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listEqui(Model model){
		model.addAttribute("federac", repofe.findAll());
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/equipo";
	}
	
	@RequestMapping(value="/equipo/{id}", method = RequestMethod.GET)
	public String mostrarJugador(Model model, @PathVariable Long id){
		Equipo equi = repoeq.getOne(id);
		Iterable<Jugador> jug = repojug.findAllByEqui(equi);
		Jugador pichichi = repojug.findFirstByEquiOrderByGolesDesc(equi);
		model.addAttribute("equipos", repoeq.findAll());
		model.addAttribute("jugadores", jug);
		model.addAttribute("EquipoUnico", repoeq.findOne(id));
		model.addAttribute("pichichi", pichichi);
		return "pages/jugadores";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String guardaequi(Model model, @Valid @ModelAttribute Equipo equipo, BindingResult bindingResult){
		repoeq.save(equipo);
		model.addAttribute("federac", repofe.findAll());
		model.addAttribute("equipos", repoeq.findAll());
		return "pages/equipo";
	}
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> borrar(@PathVariable Long id){
		try{
		repoeq.delete(id);
		return new ResponseEntity<String>(HttpStatus.OK);
		}
		catch(Exception e){
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Federacion.class, fepro);
	}
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	@ResponseBody
	public Equipo buscarEquipo(@PathVariable Long id){
		Equipo equi =repoeq.findOne(id);
		return equi; 
	}
}
