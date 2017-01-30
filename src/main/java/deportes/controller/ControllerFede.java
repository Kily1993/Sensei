package deportes.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Federacion;
import deportes.modelo.repositorio.RepositorioEquipo;
import deportes.modelo.repositorio.RepositorioFederacion;

@Controller
@RequestMapping("/federaciones")
public class ControllerFede {

	@Autowired
	private RepositorioFederacion repofe;
	@Autowired
	private RepositorioEquipo repoeq;

	@RequestMapping(method = RequestMethod.GET)
	public String listFedes(Model model) {
		model.addAttribute("federaciones", repofe.findAll());
		return "pages/federacion";
	}
	@RequestMapping(value="/federacion/{id}", method = RequestMethod.GET)
	public String mostrarEquipo(Model model, @PathVariable Long id){
		
		Federacion fede = repofe.getOne(id);
		Iterable<Equipo> equ = repoeq.findAllByFede(fede);
		model.addAttribute("federac", repofe.findAll());
		model.addAttribute("equipos", equ);
		model.addAttribute("federacionUnica", repofe.findOne(id));
		
		return "pages/equipo";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String contfede(Model model, @Valid @ModelAttribute Federacion fede) {
		repofe.save(fede);

		model.addAttribute("federaciones", repofe.findAll());
		return "pages/federacion";
	}
	
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> borrar(@PathVariable Long id){
		try{
		repofe.delete(id);
		return new ResponseEntity<String>(HttpStatus.OK);
		}
		catch(Exception e){
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}	
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	@ResponseBody
	public Federacion buscarFede(@PathVariable Long id){
		Federacion fede =repofe.findOne(id);
		return fede; 
	}
	

}
