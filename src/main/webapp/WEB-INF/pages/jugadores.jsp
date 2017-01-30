<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/juga.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jugadores</title>
</head>
<body>

<c:if test="${not empty equipoUnico}">
<h3 class="text-center">${equipoUnico.nombre}</h3>

<div class="container">
			<div class="row">
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="${equipoUnico.imagen}" alt="Image" width="240" height="240">
					</a>
					<div class="media-body">
						<h4 class="media-heading">${equipoUnico.nombre }</h4>
						<p>${equipoUnico.estadio }</p>
					</div>
				</div>

			</div>
		</div>
</c:if>
<c:if test="${not empty pichichi}">
<h3>Hay pichichi</h3>
<p>${pichichi.goles} - ${pichichi.nombre}</p>
</c:if>

<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Edad</th>
				<th>Goles</th>
				<th>Equipo</th>
				<th>Editar</th>
				<th>Borrar</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${jugadores}" var="jugador">
				<tr data-id="${jugador.id}">
					<td>${jugador.id}</td>
					<td><a href="<c:url value="/jugadores/jugador/${jugador.id}" />">${jugador.nombre}</a></td>
					<td>${jugador.edad}</td>
					<td>${jugador.goles}</td>
					<td><a href="<c:url value="/equipos/equipo/${jugador.equi.id}" />">${jugador.equi.nombre}</a></td>
					<td><a	 class="editar-juga btn btn-warning">Editar</a></td>
					<td><a class="btn btn-danger open-Modal"
						data-nombre="${jugador.nombre}" data-id="${jugador.id}"
						data-toggle="modal" href='#modal-borrar'>Borrar</a></td>


				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><a class="btn btn-primary" data-toggle="modal"
					href='#modal-jugador'>Añadir Jugador</a></td>
			</tr>
		</tbody>
	</table>
	<!-- Empieza la diversion -->
	<div class="modal fade" id="modal-jugador">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Añadir Jugador</h4>
				</div>
				<div class="modal-body">
					<form method="POST" action="<c:url value="/jugadores" />" role="form">
						<legend>Jugador</legend>


						<div class="form-group">
							<label for="Nombre">Nombre</label> <input type="text"
								class="form-control" id="nombre-jugador" name="nombre"
								placeholder="Nombre..">
						</div>

						<div class="form-group">
							<label for="Edad">Edad</label> <input type="text"
								class="form-control" id="edad-jugador" name="edad"
								placeholder="Edad..">
						</div>

						<div class="form-group">
							<label for="Goles">Goles</label> <input type="text"
								class="form-control" id="goles-jugador" name="goles"
								placeholder="Goles..">
						</div>
						<div class="form-group">
								<label for="">Imagen</label> <input type="url"
									class="form-control" id="imagen-jugador" placeholder="Imagen..."
									name="imagen">
							</div>
						<input type="hidden" name="id" id="id-juga" class="form-control"
							value="">

						<div class="form-group">
							<label for="Equipo">Equipo</label> <select name="equi"
								id="input" class="form-control">
								<c:forEach items="${equipos}" var="equi">

									<option value="${equi.id}">${equi.nombre}</option>

								</c:forEach>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Guardar</button>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Empieza la diversion 2.0 -->


	<div class="modal fade" id="modal-borrar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">¿Estas seguro?</h4>
				</div>
				<div class="modal-body">
					¿Estas seguro?¿Borrar esta mierda? <input type="hidden" id="jug">
					<strong><span id="jugnombre"></span></strong>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					<button type="button" class="btn btn-primary btn-borrar"
						data-dismiss="modal">Si</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>