<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Modificar clientes</title>
<!-- Bootstrap core CSS -->
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css" rel="stylesheet">
  <!-- Estilos -->
  <link href ="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css" rel="stylesheet">
  
  <!-- SCRIPTS  -->
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
  
  
  
</head>

<body>

  <!-- Barra de navegacion -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" alt="logo zeus gym" height="100" width="100">
      <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp" class="navbar-brand" style="color:white">Zeus Gym</a>
		
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


   
    <div class="form-group">

      <div class="container" align="center">
        <div class="card h-100">
        <div class="center">
         <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/usuario.png" height="150" width="150">
                     <h2>Modificar cliente</h2>
        </div>  
                  
		<form action="Usuario?op=Modificar" method="post">

            <hr class="bg-info">

            <div class="form-group">
              	<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="id" readonly required placeholder="id" value="${user.getIdUsuario() }">
              	<label for="" class="letra" float: left>Nombre: </label>
				<input type="text" name="Nombre" required placeholder="Nombre" value="${user.getNombre() }">
            </div>
            
            <div class="form-group">
				<label for="" class="letra">Apellido paterno: </label>
				<input type="text" name="Apellido Paterno" required placeholder="Apellido Paterno" value= "${user.getAPaterno()}" }>
              	<label for="" class="letra">Apellido materno: </label>
				<input type="text" name="Apellido Materno" required placeholder="Apellido Materno" value ="${user.getAMaterno()}" }>
            </div>

            <div class="form-group">
              	<label for="" class="letra">Correo: </label>
				<input type="text" name="Correo" required placeholder="Correo" value ="${user.getCorreo()}" }>
              	<label for="" class="letra">Telefono: </label>
				<input type="text" name="Telefono" required maxlength="10" placeholder ="Telefono" value= "${user.getTelefono()}" }>
            </div>

            <div class="form-group">
            	<label for="" class="letra">Codigo</label>
				<input type="text" name="Codigo" required placeholder="Codigo" value ="${user.getCodigo()}" }>
              	<label for="" class="letra">Usuario: </label>
				<input type="text" name ="Nombre de usuario" readonly  value = "${user.getNom_Usuario()}" >
            </div>
            <div id ="mod_estatus" class="form-group">
              	<label for="" class="letra">Estatus: </label>
				<input type="text" name ="Estatus"   value = "${user.getEstatus()}" >
              	<label for="" class="letra">Tipo</label>
				<input type="text" name="Tipo" required placeholder="Codigo" value ="${user.getTipo()}" }>
            </div>
            
            <script>javascript:mostrarSegunTipo('${usuario.getTipo()}','mod_estatus')</script>

            <div class="form-group">
				<input type="submit" value="Modificar" class="btn btn-success" onclick="modificar()" >
				<a href="Usuario?op=Regresar" class="btn btn-secondary">Regresar</a>
            </div>

          </form>
          
          
        </div>
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
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.min.js"></script>
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>