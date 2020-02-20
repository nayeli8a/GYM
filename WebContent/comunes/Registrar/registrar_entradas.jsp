<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Registrar Entradas</title>
    
    <!-- Bootstrap core CSS -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Custom styles for this template -->
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
  	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/style.css" rel="stylesheet">
  	<!-- Estilos -->
  	<link href ="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css" rel="stylesheet">
  
    <script>
        function registrar() {

            alert("Se ha registardo correctamente");
            return;
        }
    </script>
    
</head>

<body>

    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            ​<img
				src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png"
				alt="logo zeus gym" height="100" width="100"> <a
				href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp"
				class="navbar-brand" style="color: white">Zeus Gym</a> </a>
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
                        <a class="nav-link" href="../index.html#quienes_somos">Quienes Somos</a>
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
                    <h1 class="display-4 titulosize">Registrar Entrada</h1>
                    <hr class="bg-info">
                    <form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Registrar?op=RegistrarEntradas" method="post">
                        <div class="row form-group">
                            <label for="nombre usuario" class="col-form-label col-md-4">Nombre Usuario: </label>
                            <div class="col-md-8">
                                <input type="text" name="nom_usuario" id="nombre" class="form-control" required
                                    placeholder="Nombre Usuario" value="">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="hora entrada" class="col-form-label col-md-4">Hora entrada: </label>
                            <div class="col-md-8">
                                <input type="time" name="hora_entrada" id="cantidad" class="form-control" required
                                    placeholder="Hora Entrada" value="">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="fecha entrada" class="col-form-label col-md-4">Fecha entrada: </label>
                            <div class="col-md-8">
                                <input type="date" name="fecha_entrada" id="fecha entrada" class="form-control" required
                                    placeholder="Fecha Entrada" value="">
                            </div>
                        </div>
                        <div class="group">
                            <button type="submit" class="btn btn-success" name="button"
                                onclick="javascript:registrar()">Registrar</button>
                            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Entradas?op=Regresar" class="btn btn-danger">Cancelar</a>
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
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>