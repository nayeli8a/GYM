<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Zeus Web</title>

  <!-- Bootstrap core CSS -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Custom styles for this template -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css" rel="stylesheet">
  	<!-- Estilos -->
  	<link href ="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css" rel="stylesheet">
  
</head>

<body>

  <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
          ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" class="img-fluid" alt="logo zeus gym" height="100" width="100">
          <a href="#" class="navbar-brand" style="color:white">Zeus Gym</a>
          
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp">Inicio<span class="sr-only">(current)</span>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp#quienes_somos">Quienes Somos</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/Producto?op=ListarSinUsuario">Productos</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp#instalaciones">Instalaciones</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp#contacto">Contacto</a>
                  </li>
                  <li class="nav-item">
                  	<a class="btn btn-danger" href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/login.jsp">Iniciar Sesion</a>
                  </li>
              </ul>
          </div>
      </div>
  </nav>

  <!-- Page Content -->
  <div class="container" style="margin-top:100px">

    <div class="row">

      <div class="col-lg-3">
        <center><B>
            <font size=7, face="COURIER NEW" , color="#9733">Lo mejor en productos para deportistas</font>
          </B></center>
      </div>
      <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/proteina.jpg">


      <div class="row">
		<tbody>
			<c:forEach var="producto" items = "${datos}">
				
				<div class="col-lg-4 col-md-6 mb-4">
		          <div class="card h-100">
		            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
		            <div class="card-body">
		              <h4 class="card-title" d="${producto.getIdProducto()}">${producto.getNombre()}</h4>
		              <h5 id="${producto.getIdProducto()}">$${producto.getPrecio()}</h5>
		              <p class="card-text">${producto.getDescripcion()}</p>
		            </div>
		          </div>
		        </div>
			</c:forEach>
		</tbody>
        

      </div>
      <!-- finalizar los bloques de productos -->

    </div>
    <!-- /.col-lg-9 -->

  </div>
  <!-- /.row -->


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

</html>