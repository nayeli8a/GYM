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
  
  	<!-- SCRIPTS  -->
  	<script src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
</head>

<body onload="javascript:OcultarFormularioClientes('clientes_tipomembresia','clientes_fechaapertura','clientes_fechapago')">

  <!-- Barra de navegacion -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/index.jsp">
        <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" class="img-fluid" alt="logo zeus gym" height="100" width="100">
        <a class="navbar-brand" style="color:white">Zeus Gym</a>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home<span class="sr-only">(current)</span>
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

      <div class="container" align="center">
        <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/usuario.png" height="150" width="150">
        <h2>Registrar cliente</h2>
        <hr class="bg-info">
        <form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Registrar?op=RegistrarCliente" method="post">
        	<div class="form-group">
              <label for="" class="letra" float: left>Nombre: </label>
              <input type="text" placeholder="Nombre" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">

              <label for="" class="letra">Apellido paterno: </label>
              <input type="text" placeholder="Apellido paterno" id="a_paterno" name="apaterno" required>
              <label for="" class="letra">Apellido materno: </label>
              <input type="text" placeholder="Apellido materno" id="a_materno" name="amaterno" required>
            </div>

            <div class="form-group">
              <label for="" class="letra">Correo: </label>
              <input type="email" placeholder="correo@ejemplo.com" id="correo" name="correo" required>

              <label for="" class="letra">Telefono: </label>              
              <input type="tel" placeholder="###-###-####" id="telefono" name="telefono" required maxlength="10">
              
            </div>

            <div class="form-group">
              <label for="" class="letra">Nombre de Usuario: </label>
              <input type="text" placeholder="Usuario" id="user" name="nom_usuario"required>
              <label for="" class="letra">Codigo</label>
              <input type="password" placeholder="####" id="codigo" name="codigo" required>
            </div>
			
			<div class="form-group">
    		<label for="Estatus" class="letra">Estatus</label>
    		<select class="form-control" id="estatus" name = "estatus">
      			<option value="A">Activo</option>
      			<option value="I">Inactivo</option>
    		</select>
  			</div>
			
			<div class="form-group">
    		<label for="Tipo" class="letra">Tipo</label>
    		<select class="form-control" id="tipo" name ="tipo">
      			<option value="A" onclick="javascript:OcultarFormularioClientes('clientes_tipomembresia','clientes_fechaapertura','clientes_fechapago')">Administrador</option>
      			<option value="F" onclick="javascript:OcultarFormularioClientes('clientes_tipomembresia','clientes_fechaapertura','clientes_fechapago')">Finanzas</option>
      			<option value="R" onclick="javascript:OcultarFormularioClientes('clientes_tipomembresia','clientes_fechaapertura','clientes_fechapago')">Recepcionista</option>
      			<option value="C" onclick="javascript:MostrarFormularioClientes('clientes_tipomembresia','clientes_fechaapertura','clientes_fechapago')">Cliente</option>
    		</select>
  			</div>
  			
  			<div class="form-group" id="clientes_tipomembresia">
    		<label for="Tipo Membresia" class="letra">Tipo Membresia</label>
    		<select class="form-control" id="tipomembresia" name ="tipomembresia">
    			<c:forEach var="datos" items="${tmembresia}">
    				<option value="${datos.getIdTipo()}">${datos.getNombre()}</option>
    			</c:forEach>
    		</select>
  			</div>
			
			<div class="row form-group" id="clientes_fechaapertura">
                <label for="fecha entrada" class="col-form-label col-md-4">Fecha Apertura: </label>
                <div class="col-md-8">
                   <input type="date" name="fecha_apertura" id="fecha_apertura" class="form-control"
                   placeholder="Fecha Apertura" value="">
                </div>
            </div>
            
            <div class="row form-group" id="clientes_fechapago">
                <label for="fecha entrada" class="col-form-label col-md-4">Fecha Pago: </label>
                <div class="col-md-8">
                   <input type="date" name="fecha_pago" id="fecha_pago" class="form-control"
                   placeholder="Fecha Pago" value="">
                </div>
            </div>
			
            <div class="group" >
              <button type="submit" class="btn btn-success">AGREGAR</button>
              <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Usuario?op=Regresar" class="btn btn-danger">Cancelar</a>
            </div>
        </form>
            
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