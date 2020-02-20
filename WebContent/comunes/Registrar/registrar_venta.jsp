<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Registro de ventas</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css"
	rel="stylesheet">
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css"
	rel="stylesheet">
<!-- Estilos -->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css"
	rel="stylesheet">

<!-- SCRIPTS  -->
<script
	src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>

</head>

<body>

	<!-- Barra de navegacion -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a
				href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/index.jsp">
				<img
				src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png"
				class="img-fluid" alt="logo zeus gym" height="100" width="100">
				<a class="navbar-brand" style="color: white">Zeus Gym</a>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home<span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Quienes
							Somos</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Instalaciones</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contacto</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div  class="container" style="margin-top: 60px">

		<div id ="div1" class="container">
			<div class="row justify-content-center mb-2 pb-2">
				<div  id ="contenedor" class="col-md-7">
					<div class="" align="center">
						<img
							src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/dinero.png"
							height="110" width="110">
						<h1 class="display-4 titulosize">Registrar venta</h1>
						<hr class="bg-info">
					</div>
					<form id ="form" action="<c:out value="${pageContext.servletContext.contextPath}"/>/Registrar?op=Venta" method="post">

						<div class="row form-group">
							<label for="Producto" class="col-form-label col-md-4">Producto:	</label> 
							<select id="idproducto" name="idproducto" class="form-control">
								<option value="0">--Elige un producto--</option>
								<c:forEach var="dato" items="${datos}">
									<option value="${dato.getIdProducto()}" onclick="javascript:muestrasegunselect('input_precio','${dato.getPrecio()}')">${dato.getNombre()}</option>
								</c:forEach>
							</select>
						</div>

						<div class="row form-group">
							<label for="fecha" class="col-form-label col-md-4">Fecha de venta: </label>
							<div class="col-md-8">
								<input type="date" name="fechaventa" id="fechaventa"
									class="form-control" required>
							</div>
						</div>
						
						<div class="row form-group">
							<label for="idProducto" class="col-form-label col-md-4">Precio unitario(monto): </label>
							<div class="col-md-8">
								<input type="number" name="monto" id="input_precio" required placeholder="Precio" readonly value="">
							</div>
						</div>
						
						<div class="row form-group">
							<label for="idProducto" class="col-form-label col-md-4">Cantidad:
							</label>
							<div class="col-md-8">
								<input type="number" name="cantidad" id="cantidad"	class="form-control" required placeholder="cantidad">
							</div>
						</div>

						<div class="row form-group">
							<label for="idProducto" class="col-form-label col-md-4">Total Compra: </label>
							<div class="col-md-8">
								<input type="number" name="Total" required placeholder="Total" readonly value="">
								
							</div>
						</div>
						<input onclick="clonar();" type="reset" class="btn btn-info" value="Agregar">
						<input type="reset" class="btn btn-danger" value="Borrar">
						


						
						
					</form>
					
				</div>
				<div  id ="botones">
				<br>
							<button type="submit" class="btn btn-success" name="button">LISTO</button>
							<a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Ventas?op=Regresar"
								class="btn btn-danger">Cancelar</a>
						</div>
			</div>
		</div>




	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Grupo DIS,
				Zeus Gym 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>


</html>