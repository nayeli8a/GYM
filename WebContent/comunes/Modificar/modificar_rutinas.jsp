<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Modificar Rutina</title>
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
 					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ejercicio.png" height="150" width="150">
                        <h1 class="display-4 titulosize">Modificar Rutinas</h1>
                        <hr class="bg-info">
                    </div>
                    <form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Rutinas?op=Modificar" method="post" enctype="multipart/form-data">
                      <div class="row form-group">
                            <label for="nombre" class="col-form-label col-md-4">ID: </label>
                            <div class="col-md-8">
                                <input type="text" readonly name="txtid"  class="form-control" required
                                    placeholder="id de la rutina" value="${rutinas.getIdRutina() }">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="nombre" class="col-form-label col-md-4">Nombre: </label>
                            <div class="col-md-8">
                                <input type="text" name="txtNombre" id="nombre" class="form-control" required
                                    placeholder="Nombre de la rutina" value="${rutinas.getNombre() }">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="areacuerpo" class="col-form-label col-md-4">Area cuerpo: </label>
                            <div class="col-md-8">
                                <input type="text" name="txtArea"  class="form-control" required
                                    placeholder="Area cuerpo" value="${rutinas.getAreaCuerpo() }">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="series" class="col-form-label col-md-4">Series: </label>
                            <div class="col-md-8">
                                <input type="text" name="txtSeries"  class="form-control" required
                                    placeholder="Series" value="${rutinas.getSeries() }">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="repeticiones" class="col-form-label col-md-4">Repeticiones: </label>
                            <div class="col-md-8">
                                <input type="number" name="txtRepeticiones"  class="form-control" rows="3"
                                    required placeholder="Repeticiones" value="${rutinas.getRepeticiones() }">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="repeticiones" class="col-form-label col-md-4">Descripcion: </label>
                            <div class="col-md-8">
                                <textarea type="" name="txtDescripcion"  class="form-control" rows="3"
                                    required
                                    placeholder="Descripcion">${rutinas.getDescripcion() }</textarea>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="imagenreferencia" class="col-form-label col-md-4">Imagen referencia:</label>
                            <img src="IMGRutinas?id=${rutinas.getIdRutina()}" style="max-width:100%;">
                            <input type="file" name="img" id="img"/>
                        </div>
                        <div class="group">
                         	<input type="submit" class="btn btn-success" name="op" value="Modificar" onclick="javascript:modificar()">
							<a href="Rutinas?op=Regresar" class="btn btn-secondary">Regresar</a>
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