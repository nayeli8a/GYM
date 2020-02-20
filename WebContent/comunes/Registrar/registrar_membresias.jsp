<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Registro de clientes</title>
  
   <!-- Bootstrap core CSS -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Custom styles for this template -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css" rel="stylesheet">
  	<!-- Estilos -->
  	<link href ="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css" rel="stylesheet">
  
  
</head>

<body>

  <!-- Barra de navegación -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      ​<a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/index.jsp">
        ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" class="img-fluid" alt="logo zeus gym" height="100" width="100">
        <a class="navbar-brand" style="color:white">Zeus Gym</a>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">
              Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Quienes Somos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Instalaciones</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contacto</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container" style="margin-top:100px">

    <div class="container">
      <div class="row justify-content-center mb-2 pb-2">
        <div class="col-md-7">
          <div class="" align="center">
            ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/membresia.png" height="100" width="100">
            <h1 class="display-4 titulosize">Registrar Membresia</h1>
            <hr class="bg-info">
          </div>
          <form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Registrar?op=TipoMembresia" method="post">
            <div class="row form-group">
              <label for="nombre" class="col-form-label col-md-4">Nombre: </label>
              <div class="col-md-8">
                <input type="text" name="nombre" value="" id="nombre" class="form-control" required
                  placeholder="Nombre de la mebresia">
              </div>
            </div>
            <div class="row form-group">
              <label for="nombre" class="col-form-label col-md-4">Precio: </label>
              <div class="col-md-8">
                <input type="number" name="precio" id="precio" class="form-control" required
                  placeholder="Precio en MXN">
              </div>
            </div>
            <div class="row form-group">
              <label for="Vigencia" class="col-form-label col-md-4">Vigencia: </label>
              <div class="col-md-8">
                <input type="number" name="vigencia" id="vigencia" class="form-control" required
                  placeholder="Vigencia">
              </div>
            </div>
            <div class="row form-group">
              <label for="Tiempo Limite" class="col-form-label col-md-4">Tiempo Limite: </label>
              <div class="col-md-8">
                <textarea name="tiempolimite" id="tiempolimite" class="form-control" rows="3" required
                  placeholder="Tiempo Limite"></textarea>
              </div>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-success" name="button">Agregar</button>
              <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/TipoMembresia?op=Regresar" class="btn btn-danger">Cancelar</a>
            </div>
          </form>
        </div>
      </div>
    </div>




  </div>
  <!-- /.container -->

  <!-- Footer -->
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