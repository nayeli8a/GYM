<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Administración de ventas</title>
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
  	<script src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
  	
</head>

<body>

	<!-- Barra de navegaciÃ³n -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a href="#"> ​<img
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
					<li class="nav-item active"><a class="nav-link" href="#">
							Home <span class="sr-only">(current)</span>
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
	<div class="container" style="margin-top: 100px">
	<h2>Buscador</h2>
	  <p>Busca ventas a partir de sus datos.</p>  
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">

		<div class="container">
			<h2 align="center">Ventas</h2>
			<form action="Ventas?op=Listar" method="post">
				<input type="submit" name="op" value="Actualizar" class="btn btn-info">
			</form>
			<hr class="bg-info">
			<div class="table-responsive table-bordered table-striped">
				<table class="table table-sm">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>idProducto</th>
							<th>Fecha de venta</th>
							<th>Monto</th>
							<th>Cantidad</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody id= "myTable">
						<c:forEach var="dato" items="${datos}">
							<tr>
								<td>${dato.getIdVenta()}</td>
								<td>${dato.getIdProducto()}</td>
								<td>${dato.getFechaVenta()}</td>
								<td>${dato.getMonto()}</td>
								<td>${dato.getCantidad()}</td>
								<td>									
										<form action="Ventas" method="post">
										<input type="hidden" name="id" value="${dato.getIdVenta()}">
							             <div id="${dato.getIdVenta()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
										</div>
									</form>
									</td>
							</tr>
							<script>
                        	javascript:mostrarSegunTipo('${usuario.getTipo()}','${dato.getIdVenta()}');
                        </script>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="form-group" align="right">
				<a href="Ventas?op=Regresar" class="btn btn-info">Regresar</a>
			</div>
		</div>




	</div>
	<!-- /.container -->

	<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Grupo DIS, Zeus Gym 2019</p>
    </div>
    <!-- /.container -->
  </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</html>