<%-- 
    Document   : alumnosProfesores
    Created on : 15-may-2018, 14:53:12
    Author     : Juan Elberto
--%>
<%@page import="java.util.List"%>
<%@page import="model.Asignatura"%>
<%@page import="model.Usuario"%>
<%@page import="model.Curso"%>
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

        <title>Asignaturas</title>
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
                    <a class="navbar-brand" href="otros/perfil/perfil.html"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> <%=  nom%></a></div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="perfilProfesor.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="index.jsp">Salir<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-remove"></span></a></li>s<li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
<!--                        <li><a href="#">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="#">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="#">Messages<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>-->

                    </ul>
                </div>
            </div>
        </nav>
        <div class="main">
            <div class="container-fluid">
                <div class="col-md-2">
                    <a href="alumnosProfesores.jsp"><button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-user"></span> Alumnos</button></a>
                </div>
                <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <input type="hidden" name="profesor" value="<%=logeado.getEmail()%>">
                        <button type="submit" class="btn btn-success btn-lg btn3d" name="asignatura" value="asignatura"><span class="glyphicon glyphicon-ok"></span> Asignaturas</button>
                    </form>
                </div>
            </div>
            <div class="container" style="padding-top: 2%; ">
                <div class="well">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre Asignatura</th>
                                <th>Nombre Curso</th>
                                <th style="width: 36px;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Asignatura> listaAsignatura = (List) request.getAttribute("listaAsignatura");

                                for (Asignatura a : listaAsignatura) {

                            %>

                            <tr>
                                <td><%=a.getNombre()%></td>
                                <td><%= a.getCurso().getNombre()%></td>
                            </tr>

                            <% }%>
                    </table>
                </div>
            </div>
        </div>
        <% }%>
    </body
</html>
