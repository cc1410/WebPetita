<%-- 
    Document   : crearClase
    Created on : 30-abr-2018, 12:36:39
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
                    <a class="navbar-brand" href="#"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> <%=  nom%></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="homeadmin.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="perfilAdmin.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="index.jsp">Salir<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-remove"></span></a></li><li class="dropdown">
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
                    <a href="crearClase.jsp"><button type="button" class="btn btn-crearClase btn-lg btn3d" ><span class="glyphicon glyphicon-tags"></span> Crear Clases</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearAsignatura.jsp"><button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Crear Asig.</button></a>
                </div>

                <div class="col-md-2">
                    <a href="asignaciones.jsp"> <button type="button" class="btn btn-asign btn-lg btn3d"><span class="glyphicon glyphicon-book"></span> Asignaciones</button></a>
                </div>

                              <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <button type="submit" class="btn btn-modificar btn-lg btn3d" name="listaAlumno" value="listaAlumno"><span class="glyphicon glyphicon-pencil"></span> Eliminar</button></a>
                    </form>
                </div>
            </div>

            <div class="container">
                <form class="form-horizontal" method="POST" action="Registro">
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Crear una Clase</legend>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nombreClase">Titulo</label>  
                            <div class="col-md-4">
                                <input id="nombreClase" name="nombreClase" type="text" placeholder="nombre de la clase" class="form-control input-md" required="">

                            </div>
                        </div>
                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="button1id"></label>
                            <div class="col-md-8">
                                <input type="submit" id="button1id" name="insertarClase" value="insertar" class="btn btn-success">
                                <button type="reset" id="button2id" name="button2id" class="btn btn-danger">Cancelar</button>
                            </div>
                        </div>

                    </fieldset>
                </form>
                <%
                    String status = (String) request.getAttribute("clase");
                    if (status != null) {
                        if (status == "Ya existe la clase") {
                %>
                <div class="alert alert-warning" style="text-align: center;">
                    <strong><%=  status%></strong> 
                </div>
                <%
                } else if (status == "Clase dada de alta") {

                %>
                <div class="alert alert-success" style="text-align: center;">
                    <strong><%=  status%></strong> 
                </div>


                <%
                        }
                    }
                %>

            </div>
    </body>
    <% }%>
</html>
