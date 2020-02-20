<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Administración de productos</title>
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

	<!-- Barra de navegación -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<img
				src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png"
				alt="logo zeus gym" height="100" width="100"> <a
				href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp"
				class="navbar-brand" style="color: white">Zeus Gym</a> </a>
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
	  <p>Busca productos a partir de su nombre, precio, stock o descripción.</p>  
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
	  <br>

		<div class="container">
			<h2 align="center">Productos</h2>
			<form action="Producto?op=Listar" method="post">
				<input type="submit" name="op" value="Actualizar" class="btn btn-info">
			</form>
			<hr class="bg-info">
			<div class="table-responsive table-bordered table-striped">
				<table class="table table-sm">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Stock</th>
							<th>Descripción</th>
							<th>Imagen Producto</th>
							<th>Acciones</th>
							
						</tr>
					</thead>
					
					<tbody id ="myTable">
						<c:forEach var="dato" items="${datos}">
							<tr>
								<td>${dato.getIdProducto()}</td>
								<td>${dato.getNombre() }</td>
								<td>${dato.getPrecio()}</td>
								<td>${dato.getStock()}</td>
								<td>${dato.getDescripcion()}</td>
								<td>
	                            	<a href="" data-toggle="modal" class="openImageDialog thumbnail" data-target="#myModal" 
	                            	onclick="javascript:pasarIdRutinaModal('myImage','IMGProductos?id=${dato.getIdProducto()}')">
	                            		<img src="IMGProductos?id=${dato.getIdProducto()}" style="max-width:100%;">
	                            	</a>
                            	</td>
								<td>
									<form action="Producto" method="post">
										<input type="hidden" name="id" value="${dato.getIdProducto()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="form-group" align="right">
				<a href="Producto?op=Regresar" class="btn btn-info">Regresar</a>
			</div>
		</div>
	</div>
	<!-- /.container -->
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Mostrar Imagen</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="modal_div">
	       	<img id="myImage" src="" style="max-width:100%;" >
	      </div>
			
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
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