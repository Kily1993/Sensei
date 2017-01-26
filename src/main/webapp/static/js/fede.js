$(document).ready(function(){
		
	$(document).on("click", ".open-Modal", function(){
		var Fede = $(this).data("id");
		var nomfede = $(this).data("nombre");
		$(".modal-body #Fede").val(Fede);
		$(".modal-body #fedenombre").text(nomfede);
	})
	
	$(".btn-borrar").on("click", function(){
		var id=$(".modal-body #Fede").val();		
		$.ajax({
			url : "federaciones/"+id,
			type: 'DELETE',
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();				
		    }
		});
									
	})
})