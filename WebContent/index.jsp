<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zeus Web</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
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
  
  <div class="container">

      <div class="row navbar-abajo">

          <div class="col-lg-12">

              <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                  <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner" role="listbox">
                      <div class="carousel-item active">
                          <img src="imagenes/1.jpg" class="img-fluid" height="350" width="1200" alt="Primary slide">
                          <div class="carousel-caption d-none d-md-block ">
                              <h5 style="text-shadow: 2px 2px 8px black;font-weight:bold">Instalaciones amplias y limpias</h5>
                              <p style="text-shadow: 2px 2px 8px black;font-weight:bold">Contamos con una buena iluminacion y areas ventiladas</p>
                          </div>
                      </div>
                      <div class="carousel-item">
                          <img src="imagenes/2.jpg" class="img-fluid" height="350" width="1200" alt="Second slide">
                          <div class="carousel-caption d-none d-md-block ">
                              <h5 style="text-shadow: 2px 2px 8px black;font-weight:bold">Expertos en rutinas</h5>
                              <p style="text-shadow: 2px 2px 8px black;font-weight:bold">Instructores con una actitud positiva</p>
                          </div>
                      </div>
                      <div class="carousel-item">
                          <img src="imagenes/3.jpg" class="img-fluid" height="350" width="1200" alt="Third slide">
                          <div class="carousel-caption d-none d-md-block ">
                              <h5 style="text-shadow: 2px 2px 8px black;font-weight:bold">Zeus Gym</h5>
                              <p style="text-shadow: 2px 2px 8px black;font-weight:bold">Creando tu imagen,cuidando tu salud</p>
                          </div>
                      </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                  </a>
              </div>

              <div class="row">

                  <div class="col-lg-6 col-md-6 mb-4">
                      <div class="card h-100">
                          <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/oferta.png" class="img-fluid" height="300" width="400">
                          <div class="card-body">
                              <center><B><font size=5, face="COURIER NEW" , color="RED">P R O M O C I O N E S</font> </B></center>
                              <p class="card-text">PROTEINAS CON 10% DE DESCUENTO</p>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-6 col-md-6 mb-4">
                      <div class="card h-100">
                          <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Producto?op=ListarSinUsuario">
                              ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/proteina.jpg" class="img-fluid" height="500" width="700">
                          </a>
                          <div class="card-body">
                              <h4 class="card-title">
                                  <a href="<c:out value="${pageContext.servletContext.contextPath}"/>/Producto?op=ListarSinUsuario">
                                      <center><B><font size=5, face="COURIER NEW" , color="Blue">P R O D U C T O S</font> </B></center>
                                  </a>
                              </h4>
                              <p class="card-text">-Proteínas</p>
                              <p class="card-text">-Suplementos alimenticios.</p>
                              <p class="card-text">¡Conoce nuestra gran variedad de productos!</p>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card h-100">
                          <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/rutina.jpg" class="img-fluid" height="300" width="400">
                          <div class="card-body">
                              <center><B><font size=4, face="COURIER NEW" , color="Blue">E N T R E N A M I E N T O</font> </B></center>

                              <p class="card-text">Contamos con rutinas personalizadas</p>
                              -Nivel principiante <br>
                              -Nivel avanzado <br>
                              -Rutinas personalizadas <br>
                              <b>Contamos con instructores capacitados en rutinas especificas</b>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card h-100">
                          <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/socio.png" class="img-fluid" height="200" width="300">
                          <div class="card-body">
                              <center><B><font size=5, face="COURIER NEW" , color="Blue">M E M B R E S Í A</font> </B></center>


                              <p class="card-text">
                                  Contamos con diferentes paquetes de membresía
                                  <br>
                                  Membresia <b>E S T U D I A N T E</b> $350
                                  Acceso de Lunes a Viernes 5:00PM a 8:00PM
                                  <br>
                                  Membresia <b>P R E M I U M</b> $500
                                  Acceso de Lunes a Viernes 6:00 AM A  10:00PM
                                  Sabado 6:00AM a 2:00PM
                                  <br>
                                  <b> Pago por visita:$30 </b>
                              </p>
                          </div>
                      </div>
                  </div>

                  <div class="col-lg-4 col-md-6 mb-4">
                      <div class="card h-100">
                          <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                          <div class="card-body">
                              <center><B><font size=5, face="COURIER NEW" , color="Blue">H O R A R I O</font> </B></center>

                              Lunes a Viernes: 6:00AM A 10:00PM
                              Sabado: 6:00AM a 2:00PM

                          </div>
                      </div>
                  </div>

              </div>
              <!-- /.row -->

          </div>
          <!-- /.col-lg-12 -->

      </div>

      <!-- /.row -->
      <!--SECCION QUIENES-SOMOS-->
      <section id="quienes_somos">
          <div class="QuienesSomos">
              <h1>¿Quienes somos?</h1>
              <br />
              <center>
                  <font size=10, face="COURIER NEW" , color="RED">GYM ZEUS</font>
              </center>

              <br>
              <b> Años de experiencia </b>
              <br>
              Hoy por hoy el ejercicio es la manera más sana de lidiar con los efectos negativos
              del intenso ritmo de vida que hemos adoptado.
              El objetivo de su propietario ha sido siempre ofrecer un buen servicio de gimnasio a un precio razonable.
              Mantenerte en forma con la asesoría y los equipos adecuados no tiene porque ser costoso, si lo que buscas es
              un gimnasio sin lujos, bien equipado y limpio, <b>¡TE ESPERAMOS!</b>.

              <center> <div class="mw-100 bg-danger">Creando tu I M A G E N, cuidando tu S A L U D</div></center>



              <div class="card-group">
                  <div class="card bg-secondary">

                      <div class="card-body text-center">
                          ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/mision.png" class="img-fluid" alt="logo zeus gym" height="400" width="450">

                          <br>
                          <p class="card-text"> Ayudar a nuestros miembros a mejorar su imagen y cuidar su salud física logrando sus objetivos individuales</p>
                      </div>
                  </div>
                  <div class="card bg-dark">
                      <div class="card-body text-center">
                          ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/valores.png" class="img-fluid" alt="logo zeus gym" height="400" width="400">
                          <br>

                      </div>
                  </div>
                  <div class="card bg-secondary">
                      <div class="card-body text-center">
                          ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/vision.png" class="img-fluid" alt="logo zeus gym" height="400" width="450">
                          <br>
                          <p class="card-text">Ser el gimnasio líder de la ciudad otorgando bienestar a nuestros miembros, generando valor a nuestra empresa, a nuestros colaboradores y a nuestra comunidad.</p>
                      </div>
                  </div>

              </div>
          </div>
      </section>

      <!--SECCION INSTALACIONES-->
      <section id="instalaciones">
          <div class="Instalaciones">
              <h1>Instalaciones</h1>
              El gimnasio ofrece una amplia variedad de equipos de entrenamiento y pesas,
              que incluyen bicicletas fijas computarizadas Lifecycle y caminadoras Technogym. <br>
              El gimnasio también dispone de máquinas universales de pesas, bancos rectos e inclinados y
              pesas. </h3>
              <center>


                  ​<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ins-1.jpg" height="400" width="650">
                  <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ins-2.jpg" height="400" width="450">
                  <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/ins-3.jpg" height="350" width="850">
              </center>
          </div>
      </section>

      <!--SECCIONES CONTACTO-->
      <section id="contacto">
          <div>
              <h1>Contacto</h1>
              Nos ubicamos en Francisco I. Madero Norte 1016, La Florida, 59610 Zamora de Hidalgo, Mich.


              <br />
              <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14996.548095650413!2d-102.283287!3d20.002763!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x38b807e760fe2264!2sAres%20GYM%20Zamora!5e0!3m2!1ses!2smx!4v1570665317375!5m2!1ses!2smx" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>

              <br />
          </div>
      </section>

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Zeus Gym, Grupo DIS 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>