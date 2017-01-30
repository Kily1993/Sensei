<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/static/js/equi.js" />"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Equipos</title>
</head>
<body>

	<c:if test="${not empty federacionUnica}">
		<h3 class="text-center">${federacionUnica.nombre}</h3>
		<div class="container">
			<div class="row">
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="${federacionUnica.imagen}" alt="Image" width="240" height="240">
					</a>
					<div class="media-body">
						<h4 class="media-heading">${federacionUnica.nombre }</h4>
						<p>${federacionUnica.pais }</p>
					</div>
				</div>

			</div>
		</div>

	</c:if>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Estadio</th>
				<th>Presupuesto</th>
				<th>Federacion</th>
				<th>Pais</th>
				<th>Ver</th>
				<th>Editar</th>
				<th>Borrar</th>


			</tr>
		</thead>
		<tbody>
			<c:forEach items="${equipos}" var="equipo">
				<tr data-id="${equipo.id}">
					<td>${equipo.id}</td>
					<td>${equipo.nombre}</td>
					<td>${equipo.estadio}</td>
					<td>${equipo.presupuesto}</td>
					<td><a
						href="<c:url value="/federaciones/federacion/${equipo.fede.id}"  />">${equipo.fede.nombre}</a></td>
					<td>${equipo.fede.pais}</td>
					<td><a href="<c:url value="/equipos/equipo/${equipo.id}" />">Ver</a></td>
					<td><a class="editar-equi btn btn-warning">Editar</a></td>
					<td><a class="btn btn-danger open-Modal"
						data-nombre="${equipo.nombre}" data-id="${equipo.id}"
						data-toggle="modal" href='#modal-borrar'>Borrar</a></td>


				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><a class="btn btn-primary" data-toggle="modal"
					href='#modal-equipo'>Añadir Equipo</a></td>
			</tr>
		</tbody>
	</table>
	<!-- Empieza la diversion -->
	<div class="modal fade" id="modal-equipo">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Añadir Equipo</h4>
				</div>
				<div class="modal-body">
					<form method="POST" action="<c:url value="/equipos" />"
						role="form">
						<legend>Equipo</legend>


						<div class="form-group">
							<label for="Nombre">Nombre</label> <input type="text"
								class="form-control" id="nombre-equipo" name="nombre"
								placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="Estadio">Estadio</label> <input type="text"
								class="form-control" id="estadio-equipo" name="estadio"
								placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="Presupuesto">Presupuesto</label> <input type="text"
								class="form-control" id="presupuesto-equipo" name="presupuesto"
								placeholder="Input field">
						</div>
						<div class="form-group">
							<label for="">Imagen</label> <input type="url"
								class="form-control" id="imagen-equipo" placeholder="Imagen..."
								name="imagen">
						</div>
						<input type="hidden" name="id" id="id-equi" class="form-control"
							value="">

						<div class="form-group">
							<label for="Federacion">Federacion</label> <select name="fede"
								id="input" class="form-control">
								<c:forEach items="${federac}" var="fede">

									<option value="${fede.id}">${fede.nombre}</option>

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
					¿Estas seguro?¿Borrar esta mierda? <input type="hidden" id="Equi">
					<strong><span id="equinombre"></span></strong>

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