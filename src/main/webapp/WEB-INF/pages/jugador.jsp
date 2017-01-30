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

<c:if test="${not empty jugadorUnico}">
<h3 class="text-center">${jugadorUnico.nombre}</h3>

<div class="container">
			<div class="row">
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="${jugadorUnico.imagen}" alt="Image" width="240" height="240">
					</a>
					<div class="media-body">
						<h4 class="media-heading">${jugadorUnico.nombre }</h4>
						<p>${jugadorUnico.goles }</p>
					</div>
				</div>

			</div>
		</div>
</c:if>




</body>
</html>