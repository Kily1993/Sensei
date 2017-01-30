<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/fede.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Federacion</title>
</head>
<body>



	<table class="table table-striped table-hover">
		<thead>
			<h3 class="text-center">Hola soy Federacion</h3>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Pais</th>
				<th>Ver</th>
				<th>Editar</th>
				<th>Borrar</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${federaciones}" var="federacion">
				<tr data-id="${federacion.id}">
					<td>${federacion.id}</td>
					<td>${federacion.nombre}</td>
					<td>${federacion.pais}</td>
					<td><a href="<c:url value="/federaciones/federacion/${federacion.id}" />">Ver</td>
					<td><a class="editar-fede btn btn-warning">Editar</a></td>
					<td><a class="btn btn-danger open-Modal" data-nombre="${federacion.nombre}" data-id="${federacion.id}" data-toggle="modal" href='#modal-borrar'>Borrar</a></td>

				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><a class="btn btn-primary" data-toggle="modal"
					href='#modal-federacion'>Añadir Federacion</a></td>
			</tr>
		</tbody>
		</table>

		<!-- Empieza la diversion -->
		<div class="modal fade" id="modal-federacion">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Añadir Federacion</h4>
					</div>
					<div class="modal-body">
						<form method="POST" action="<c:url value="/federaciones" />" role="form">
							<legend>Federacion</legend>

							<div class="form-group">
								<label for="">Nombre</label> <input type="text"
									class="form-control" id="nombre-fede" placeholder="Nombre.."
									name="nombre">
							</div>
							<div class="form-group">
								<label for="">Pais</label> <input type="text"
									class="form-control" id="pais-fede" placeholder="Pais.."
									name="pais">
							</div>
							<div class="form-group">
								<label for="">Imagen</label> <input type="url"
									class="form-control" id="imagen-fede" placeholder="Imagen..."
									name="imagen">
							</div>
							<input type="hidden" id="id-fede" name="id">



						
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
					¿Estas seguro?¿Borrar esta mierda?  
					<input type="hidden" id="Fede">
					<strong><span id="fedenombre"></span></strong>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
						<button type="button" class="btn btn-primary btn-borrar" data-dismiss="modal">Si</button>
					</div>
				</div>
			</div>
		</div>

	
</body>
</html>