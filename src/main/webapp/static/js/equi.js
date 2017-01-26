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
})