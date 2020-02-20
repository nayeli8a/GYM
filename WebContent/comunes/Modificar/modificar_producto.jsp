<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Modificar producto</title>
  <!-- Bootstrap core CSS -->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css"
	rel="stylesheet">
<link"WebContent"
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
      <a href="../index.html">
        <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo_zeus.png" alt="logo zeus gym" height="100" width="100">
                    <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/index.jsp" class="navbar-brand" style="color:white">Zeus Gym</a>
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
<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/productos.png" height="150" width="150">
            <h1 class="display-4 titulosize">Modificar productos</h1>
            <hr class="bg-info">
          </div>
	<form action="<c:out value="${pageContext.servletContext.contextPath}"/>/Producto?op=Modificar" method="post" enctype="multipart/form-data">
            <div class="row form-group">
              <label for="nombre" class="col-form-label col-md-4">Id: </label>
              <div class="col-md-8">
                <input type="text" readonly name="txtid" class="form-control" required
                  placeholder="Nombre del producto" value="${producto.getIdProducto() }">
              </div>
            </div>
            <div class="row form-group">
              <label for="nombre" class="col-form-label col-md-4">Nombre: </label>
              <div class="col-md-8">
                <input type="text" name="txtnombre" class="form-control" required
                  placeholder="Nombre del producto" value="${producto.getNombre() }">
              </div>
            </div>
            <div class="row form-group">
              <label for="nombre" class="col-form-label col-md-4">Precio: </label>
              <div class="col-md-8">
                <input type="number" name="txtprecio" class="form-control" required placeholder="Precio en MXN"
                  value="${producto.getPrecio() }">
              </div>
            </div>
            <div class="row form-group">
              <label for="cantidad" class="col-form-label col-md-4">Stock: </label>
              <div class="col-md-8">
                <input type="number" name="txtstock"  class="form-control" required
                  placeholder="Numero de piezas" value="${producto.getStock() }">
              </div>
            </div>
            <div class="row form-group">
              <label for="Descripcion" class="col-form-label col-md-4">Descripción: </label>
              <div class="col-md-8">
                <textarea name="txtdescripcion" class="form-control" rows="3" required
                  placeholder="Descripcion del producto">${producto.getDescripcion() }</textarea>
              </div>
            </div>
            <div class="row form-group">
            	<label for="imagenreferencia" class="col-form-label col-md-4">Imagen del Producto:</label>
                <img src="IMGProductos?id=${producto.getIdProducto()}" style="max-width:100%;">
                <input type="file" name="img" id="img"/>
            </div>
            
            <div class="form-group">
				<input type="submit" name="op" value="Modificar" class="btn btn-success" onclick="javascript:modificar()">
				<a href="Producto?op=Regresar" class="btn btn-secondary">Regresar</a>
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