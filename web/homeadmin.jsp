<%-- 
    Document   : homeadmin
    Created on : 29-abr-2018, 21:20:46
    Author     : Juan Elberto
--%>

<%@page import="model.Usuario"%>
<%
    Usuario logeado = (Usuario) session.getAttribute("login");

    String nom = logeado.getNombre();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/buttonshome.css" rel="stylesheet" type="text/css"/>
        <link href="css/menuhome.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if (logeado != null && logeado.getTipo() == 0) {%>    
    <body>

        <nav class="navbar navbar-inverse sidebar" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="otros/perfil/perfil.html"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> <%=  nom%></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="homeadmin.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="perfilAdmin.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="index.jsp">Salir<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-remove"></span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="index.jsp">SALIR</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="main">
            <div class="container-fluid">
                <div class="col-md-2">
                    <a href="crearUsuario.jsp"><button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-user"></span> Crear Usuarios</button></a>

                </div>
                <div class="col-md-2">
                    <a href="crearCurso.jsp"><button type="button" class="btn btn-info btn-lg btn3d"><span class="glyphicon glyphicon-paperclip"></span> Crear Curso</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearClase.jsp"><button type="button" class="btn btn-primary btn-lg btn3d" ><span class="glyphicon glyphicon-tags"></span> Crear Clases</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearAsignatura.jsp"><button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Crear Asig.</button></a>
                </div>

                <div class="col-md-2">
                    <a href="asignaciones.jsp"> <button type="button" class="btn btn-asign btn-lg btn3d" style="color: white;"><span class="glyphicon glyphicon-book"></span> Asignaciones</button></a>
                </div>
                <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <button type="submit" class="btn btn-modificar btn-lg btn3d" name="listaAlumno" value="listaAlumno"><span class="glyphicon glyphicon-pencil"></span> Eliminar</button></a>
                    </form>
                </div>
                <!--                <div class="col-md-2">
                                    <button type="button" class="btn3d btn btn-default1 btn-lg"><span class="glyphicon glyphicon-eye-open"></span> Notas</button>
                                </div>-->
            </div>
            <div class="container">
                <div id="imghome" class="col-md-12">
                    <img src="img/home.PNG" class="col-md-12">
                </div>
            </div>
            <div class="container">
                <div class="col-md-12">
                    <a href="http://ec2-54-209-220-253.compute-1.amazonaws.com/sites/default/files/skiptu-template-0.3.zip" class="btn btn-lg " ><span class="glyphicon glyphicon-cloud-download"></span> Descargar PepitaSchool para Windows</a>
                    <a href="http://ec2-54-209-220-253.compute-1.amazonaws.com/sites/default/files/skiptu-template-0.3.zip" class="btn btn-lg " ><span class="glyphicon glyphicon-cloud-download"></span> Descargar PepitaSchool para Linux</a>
                    <a href="http://ec2-54-209-220-253.compute-1.amazonaws.com/sites/default/files/skiptu-template-0.3.zip" class="btn btn-lg " ><span class="glyphicon glyphicon-cloud-download"></span> Descargar PepitaSchool para MacOs</a>
                </div>
            </div>
<!--            <div id="calendar" style="width: 100%; height: 40%;">
                <iframe src="otros/calendario/calendario.html"></iframe>
            </div>-->
            <script src="js/menuhome.js" type="text/javascript"></script>
    </body>
    <% }%>
</html>