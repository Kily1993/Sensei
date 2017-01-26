$(document).ready(function(){
		
	$(document).on("click", ".open-Modal", function(){
		var Jug = $(this).data("id");
		var nomjug = $(this).data("nombre");
		$(".modal-body #jug").val(Jug);
		$(".modal-body #jugnombre").text(nomjug);
	})
	
	$(".btn-borrar").on("click", function(){
		var id=$(".modal-body #jug").val();		
		$.ajax({
			url : "/sensei/jugadores/"+id,
			type: 'DELETE',
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();				
		    }
		});
									
	})
})