<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Finanzas</title>

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
    <div class="mw-100 bg-danger">F I N A N Z A S: 
    	<b>
        <c:out value="${usuario.APaterno}"> </c:out>
        <c:out value="${usuario.AMaterno}"> </c:out>
        <c:out value="${usuario.nombre}"></c:out>
        </b>
    </div>

    <div class="row navbar-abajo">


      <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <H2>VENTAS GENERADAS</H2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/finanzas.png" height="160" width="160"></div>​
                    
                    <div class="card-body">
                        	<div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/reporte.jsp" class="btn btn-success btn-block">REPORTE</a></div>
                            <p class="card-text">Generar el reporte financiero.</p>
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