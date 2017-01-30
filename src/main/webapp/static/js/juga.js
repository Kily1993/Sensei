$(document).ready(function() {
	editarJugador();
	borrarJug();

})
var limpiarModal = function() {
	$('.modal-title').text("Añadir Jugador");
	$('#nombre-jugador').val('');
	$('#edad-jugador').val('');
	$('#goles-jugador').val('');
	$('#imagen-equipo').val('');
	$('#id-juga').val('');

}
var cogerId = function() {
	$(document).on("click", ".open-Modal", function() {
		var Juga = $(this).data('id');
		var nomjuga = $(this).data("nombre");
		$(".modal-body #juga").val(Juga);
		$(".modal-body #juganombre").text(nomjuga);
	});

}
var borrarJug = function() {
	cogerId();

	$(".btn-borrar").on("click", function() {
		var id = $(".modal-body #juga").val();
		$.ajax({
			url : "/sensei/jugadores/" + id,
			type : 'DELETE',
			success : function(result) {
				$('tr[data-id="' + id + '"]').remove();
			}
		});

	})
}

var editarJugador = function() {
	cogerId();

	$(".editar-juga").on('click', function() {
		var id = $(this).parents('tr').data('id');
		var url = '/sensei/jugadores/' + id;

		$.get(url).done(function(jugador) {
			$('.modal-title').text("Editar Jugador");
			$('#nombre-jugador').val(jugador.nombre);
			$('#edad-jugador').val(jugador.edad);
			$('#goles-jugador').val(jugador.goles);
			$('#imagen-equipo').val(jugador.imagen);
			$('#id-juga').val(jugador.id);

			$('#modal-jugador').modal('show');
		})
		$('#modal-jugador').on('hide.bs.modal', limpiarModal);
	})
}