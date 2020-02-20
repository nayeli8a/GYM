<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Administrador</title> 
     
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
        <div class="mw-100 bg-danger">A D M I N I S T R A D O R: 
        <b>
        <c:out value="${usuario.APaterno}"> </c:out>
        <c:out value="${usuario.AMaterno}"> </c:out>
        <c:out value="${usuario.nombre}"></c:out>
        </b>
        </div>

        <div class="row navbar-abajo">
			<div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <H2>E N T R A D A S</H2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/reloj.png" height="160" width="160"></div>​
                    
                    <div class="card-body">
                        	<div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Registrar/registrar_entradas.jsp" class="btn btn-success btn-block">AGREGAR ENTRADAS</a></div>
                            <p class="card-text">Registrar nuevas entradas.</p>
                            <br>
                            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Entradas?op=AdminEntradas" class="btn btn-primary">CONSULTAR</a>
                            <p class="card-text">Consultar, editar, eliminar entradas. </p>
                    </div>

                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <H2>U S U A R I O S</H2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/usuario.png" height="160" width="160"></div>​
                    
                    <div class="card-body">
                        	<div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Usuario?op=ListarParaRegistro" class="btn btn-success btn-block">AGREGAR CLIENTES</a></div>
                            <p class="card-text">Registrar nuevos clientes.</p>
                            <br>
                            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Usuario?op=AdminCliente" class="btn btn-primary">CONSULTAR</a>
                            <p class="card-text">Consultar, editar, eliminar clientes. </p>
                    </div>

                </div>
            </div>
            
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <H2>R U T I N A S</H2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ejercicio.png" height="160" width="160"></div>​
                    
                    <div class="card-body">
                        	<div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Registrar/registrar_rutinas.jsp" class="btn btn-success btn-block">AGREGAR NUEVAS RUTINAS</a></div>
                            <p class="card-text">Registrar nuevas rutinas.</p>
                            <br>
                            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Rutinas?op=AdminRutinas" class="btn btn-primary">CONSULTAR</a>
                            <p class="card-text">Consultar, editar, eliminar rutinas. </p>
                    </div>

                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <h2>V E N T A S</h2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/dinero.png" height="200" width="200"></div>

                    <div class="card-body">
                    <div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Ventas?op=ListarParaRegistro" class="btn btn-success btn-block">AGREGAR NUEVA VENTA</a></div>
                        
                        <p class="card-text">Registrar nuevas ventas en el sistema. </p>
                        <br>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Ventas?op=AdminVentas" class="btn btn-primary">CONSULTAR</a>
                        <p class="card-text">Consultar, editar y eliminar ventas. </p>
                    </div>

                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <h2>P R O D U C T O S</h2>
                    <div style="text-align:center"><img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/productos.png" height="200" width="200"></div>

                    <div class="card-body">
                        <div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Registrar/registrar_producto.jsp" class="btn btn-success btn-block">AGREGAR NUEVOS PRODUCTOS</a></div>
                        <p class="card-text">Registrar nuevos productos en el almacen.</p>
                        <br>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Producto?op=AdminProducto" class="btn btn-primary">CONSULTAR</a>
                        <p class="card-text">Consultar, editar y eliminar productos en el almacen. </p>
                    </div>

                </div>
            </div>
            
               <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <h2>M E M B R E S I A S</h2>
                    <div style="text-align:center"><img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/membresia.png" height="200" width="200"></div>

                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Registrar/registrar_membresias.jsp" class="btn btn-success btn-block">AGREGAR NUEVA MEMBRESIA</a>
                        </h4>
                        <p class="card-text">Registrar nuevas membresias.</p>
                        <br>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/TipoMembresia?op=AdminMembresias" class="btn btn-primary">CONSULTAR</a>
                        <p class="card-text">Consultar, editar y eliminar membresias. </p>
                    </div>

                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <H2>F I N A N Z A S</H2>
                    <div style="text-align:center">​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/finanzas.png" height="160" width="160"></div>​
                    
                    <div class="card-body">
                        	<div style="text-align:center"><a href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/reporte.jsp" class="btn btn-success btn-block">REPORTE</a></div>
                            <p class="card-text">Generar el reporte financiero.</p>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
    
    <!-- /.container -->
    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Grupo DIS,ZeusGym 2019</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.min.js"></script>
    <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>