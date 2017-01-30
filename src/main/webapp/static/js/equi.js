$(document).ready(function(){
		
	$(document).on("click", ".open-Modal", function(){
		var Equi = $(this).data("id");
		var nomequi = $(this).data("nombre");
		$(".modal-body #Equi").val(Equi);
		$(".modal-body #equinombre").text(nomequi);
	})
	
	$(".btn-borrar").on("click", function(){
		var id=$(".modal-body #Equi").val();		
		$.ajax({
			url : "/sensei/equipos/"+id,
			type: 'DELETE',
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();				
		    }
		});
									
	})
	
	$(".editar-equi").on('click', function(){
	var id = $(this).parents('tr').data('id');
	var url = '/sensei/equipos/'+id;
	
	$.get(url)
		.done(function(equipo){
			$('.modal-title').text("Editar Equipo");
			$('#nombre-equipo').val(equipo.nombre);
			$('#estadio-equipo').val(equipo.estadio);
			$('#presupuesto-equipo').val(equipo.presupuesto);
			$('#imagen-equipo').val(equipo.imagen);
			$('#id-equi').val(equipo.id);
			
			$('#modal-equipo').modal('show');
		})
		
	})
})








$(document).ready(function(){
	editarEquipo();	
	borrarEqui();
	
	
})
var limpiarModal=function(){
	$('.modal-title').text("Añadir Equipo");
	$('#nombre-equipo').val('');
	$('#edad-equipo').val('');
	$('#goles-equipo').val('');
	$('#imagen-equipo').val('');
	$('#id-equi').val('');
	
}
var cogerId=function(){
		$(document).on("click", ".open-Modal", function(){
			var Equi = $(this).data('id');
			var nomequi = $(this).data("nombre");
			$(".modal-body #equi").val(Equi);
			$(".modal-body #equinombre").text(nomequi);
		});
		
}
var borraEqui=function(){
	cogerId();
	

$(".btn-borrar").on("click", function(){
	var id=$(".modal-body #equi").val();		
	$.ajax({
		url : "/sensei/equipos/"+id,
		type: 'DELETE',
	    success: function(result) {
	    	$('tr[data-id="'+id+'"]').remove();				
	    }
	});
								
})
}


var editarEquipo=function(){
	cogerId();

	
	
	$(".editar-equi").on('click', function(){
	var id = $(this).parents('tr').data('id');
	var url = '/sensei/equipos/'+id;
	
	$.get(url)
		.done(function(equipo){
			$('.modal-title').text("Editar Equipo");
			$('#nombre-equipo').val(equipo.nombre);
			$('#edad-jugador').val(jugador.edad);
			$('#goles-jugador').val(jugador.goles);
			$('#imagen-equipo').val(jugador.imagen);
			$('#id-juga').val(jugador.id);
			
			$('#modal-jugador').modal('show');
		})
		$('#modal-jugador').on('hide.bs.modal', limpiarModal);
	})
}