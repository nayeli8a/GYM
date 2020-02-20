<%@page import="com.sun.org.glassfish.gmbal.ParameterNames"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Cliente</title>

  <!-- Bootstrap core CSS -->
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
  <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css" rel="stylesheet">
  <!-- Estilos -->
  <link href ="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css" rel="stylesheet">
  
  <!-- SCRIPTS  -->
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/inicio_usuario.js"></script>
  
  
</head>
<body onload="javascript:mostrarBarraAlerta('${usuario.getEstatus()}','barraalerta_estatus','barraalerta_mensaje')">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a href="#">
        <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" class="img-fluid" alt="logo zeus gym" height="100" width="100">
        <a class="navbar-brand" style="color:white">Zeus Gym</a>
      </a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
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
                    <li>
                        <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp#instalaciones">Instalaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp#contacto">Contacto</a>
                    </li>
                    <li>
                    	<form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Usuario?op=CS" method="post">
                    		<button type="submit" class="btn btn-danger">Cerrar Sesion</button>
                    	</form>
                        
                    </li>
                </ul>
            </div>
    </div>
  </nav>


  <br>
  <br>
  <br>
<div style="text-align:center">
    <div class="mw-100 bg-danger">B I E N V E N I D O: 
    	<b>
        <c:out value="${usuario.APaterno}"> </c:out>
        <c:out value="${usuario.AMaterno}"> </c:out>
        <c:out value="${usuario.nombre}"></c:out>
        </b>
    </div>
   
    <div class="alert alert-success alert-dismissible" id="BarraAlerta">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <strong id="barraalerta_estatus"></strong> <p id="barraalerta_mensaje"></p>
    </div>
    

    <div class="row navbar-abajo">

      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <h2>INFORMACION PERSONAL</h2>
          <a href="#">
            <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/usuario.png" height="200" width="200">
          </a>
          <div class="card-body">
            <h5 style="text-align: center">
              <b>
		        <c:out value="${usuario.APaterno}"> </c:out>
		        <c:out value="${usuario.AMaterno}"> </c:out>
		        <c:out value="${usuario.nombre}"></c:out>
		        <br>
		        <c:out value="${usuario.getCorreo()}"></c:out>
		        <br>
		        <c:out value="${usuario.getTelefono()}"></c:out>
		        <br>
		        <c:out value="${usuario.getNom_Usuario()}"></c:out>
		      </b>
            </h5>
            <br>
            <form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Usuario?op=Editar" method="post">
            	<input type="hidden" name="id" value="${usuario.getIdUsuario()}">
            	<input type="submit" class="btn btn-danger" name="op" value="Editar">
             	
            </form>
          </div>

        </div>
      </div>

      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <H2>R U T I N A S</H2>
          <a href="#">
          <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ejercicio.png" height="200" width="200">
          </a>
          <div class="card-body">
            <br>
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Rutinas?op=AdminRutinas"><button type="button"
                                class="btn btn-primary">CONSULTAR</button></a>
            <p class="card-text">Consultar la rutina personalizada. </p>
          </div>

        </div>
      </div>

      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <H2>M E M B R E S I A</H2>
          <a href="#">
            <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/socio.png" height="200" width="200">
          </a>


          <div class="card-body">
            <br>
            E s t a t u s:
            <br>
            	<h5 id="estatus_nombre">ESTATUS</h5>
            	<script>javascript:mostrarEstatus('${usuario.getEstatus()}','estatus_nombre')</script>
            <br>
            Fecha de proximo pago:
            <br>
            	<h5 id="fecha_pago">FECHA PAGO</h5>
            	<script>javascript:mostrarFechaPago('${membresia.getFechaProximoPago()}','fecha_pago')</script>
            <br>
          </div>

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
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.min.js"></script>
  <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>