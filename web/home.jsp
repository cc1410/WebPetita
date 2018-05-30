<%-- 
    Document   : home
    Created on : 27-abr-2018, 20:08:25
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

        <title>Home</title>
    </head>
    <% if (logeado != null && logeado.getTipo() == 1) {%>   
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
                    <a class="navbar-brand" href="#"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> PepitaSchool</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="perfilProfesor.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="index.jsp">Salir<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-remove"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="main">
            <div class="container-fluid">
                <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <input type="hidden" name="profesor" value="<%=logeado.getEmail()%>">
                        <button type="submit" class="btn3d btn btn-default btn-lg" name="asignaturaAlumno" value="asignaturaAlumno"><span class="glyphicon glyphicon-user"></span> Alumnos</button>
                    </form>
                </div>
                <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <input type="hidden" name="profesor" value="<%=logeado.getEmail()%>">
                        <button type="submit" class="btn btn-success btn-lg btn3d" name="asignatura" value="asignatura"><span class="glyphicon glyphicon-ok"></span> Asignaturas</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/menuhome.js" type="text/javascript"></script>
    </body>
    <% }%>
</html>
